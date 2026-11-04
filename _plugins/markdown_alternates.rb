# Writes a clean-Markdown twin (e.g. /blog/my-post.md) of every post and Markdown page
# so that LLM agents can fetch readable content, and exposes the same text to Liquid
# as `raw_markdown` (used by llms-full.txt).
#
# Source posts mix Markdown with Liquid tags and some inline HTML, so the body is
# normalised: Liquid tags become Markdown equivalents, simple HTML becomes Markdown,
# and layout-only markup is dropped. Fenced code is never touched.
require 'cgi'

module MarkdownAlternates
  FENCE = /(```.*?```)/m

  def self.liquid_to_markdown(text, site_url)
    text = text.gsub(/\{%-?\s*(?:end)?raw\s*-?%\}/, '')
    text = text.gsub(/\{%-?\s*highlight\s+(\w+)[^%]*%\}\n?(.*?)\{%-?\s*endhighlight\s*-?%\}/m) do
      "```#{Regexp.last_match(1)}\n#{Regexp.last_match(2).rstrip}\n```"
    end
    text = text.gsub(/\{%-?\s*responsive_image\s+(.*?)-?%\}/m) do
      args = Regexp.last_match(1)
      path = args[/path:\s*"?([^\s"]+)/, 1]
      alt = args[/alt:\s*"([^"]*)"/, 1].to_s
      path ? "![#{alt}](#{site_url}/#{path.sub(%r{\A(\.\./|/)+}, '')})" : ''
    end
    text = text.gsub(/\{%-?\s*youtube\s+([\w-]+)\s*-?%\}/) do
      "[Watch on YouTube](https://www.youtube.com/watch?v=#{Regexp.last_match(1)})"
    end
    text = text.gsub(/\{%-?\s*badge\s+\S+\s+\S+\s+(\S+)\s*-?%\}/) { "<#{Regexp.last_match(1)}>" }
    text = text.gsub(/\{\{\s*base\.url\s*\|\s*prepend:\s*site\.url\s*\}\}/, site_url)
    text.gsub(/\{%-?.*?-?%\}/m, '')
  end

  def self.html_to_markdown(text, site_url)
    text = text.gsub(%r{<figcaption[^>]*>(.*?)</figcaption>}m) { "\n_#{Regexp.last_match(1).gsub(/\s+/, ' ').strip}_\n" }
    text = text.gsub(%r{<iframe[^>]*src="https?://www\.youtube\.com/embed/([\w-]+)[^"]*"[^>]*>\s*</iframe>}m) do
      "[Watch on YouTube](https://www.youtube.com/watch?v=#{Regexp.last_match(1)})"
    end
    text = text.gsub(/<img\b[^>]*>/) do |tag|
      src = tag[/src=["']([^"']+)["']/, 1]
      alt = tag[/alt=["']([^"']*)["']/, 1].to_s
      src ? "![#{alt}](#{src.start_with?('/') ? site_url + src : src})" : ''
    end
    text = text.gsub(%r{<a\b[^>]*href=["']([^"']+)["'][^>]*>(.*?)</a>}m) { "[#{Regexp.last_match(2).strip}](#{Regexp.last_match(1)})" }
    text = text.gsub(%r{<(em|i)>(.*?)</\1>}m) { "_#{Regexp.last_match(2)}_" }
    text = text.gsub(%r{<(strong|b)>(.*?)</\1>}m) { "**#{Regexp.last_match(2)}**" }
    text = text.gsub(%r{<code>(.*?)</code>}m) { "`#{Regexp.last_match(1)}`" }
    text = text.gsub(%r{<h([1-6])[^>]*>(.*?)</h\1>}m) { "\n#{'#' * Regexp.last_match(1).to_i} #{Regexp.last_match(2).strip}\n" }
    text = text.gsub(%r{<summary>(.*?)</summary>}m) { "\n**#{Regexp.last_match(1).strip}**\n" }
    text = text.gsub(%r{<aside[^>]*>(.*?)</aside>}m) { Regexp.last_match(1).strip.gsub(/^\s*/, '> ') }
    text = text.gsub(/^[ \t]+(!\[)/, '\1')
    text = text.gsub(%r{<br\s*/?>}, "  \n")
    text = CGI.unescapeHTML(text.gsub('&nbsp;', ' '))
    text = text.gsub(%r{\]\((?:\.\./|\./|/)(?!/)}, "](#{site_url}/")
    text.gsub(%r{</?(figure|div|p|details|span|section|center|picture|link|source)\b[^>]*>}, '')
  end

  def self.clean(raw, site_url)
    text = liquid_to_markdown(raw.to_s, site_url)
    text = text.split(FENCE).each_with_index.map { |seg, i| i.odd? ? seg : html_to_markdown(seg, site_url) }.join
    text = text.gsub(/^\{:[^}]*\}[ \t]*$/, '').gsub(/^\[\/\/\]: # .*$/, '')
    text.gsub(/[ \t]+$/, '').gsub(/\n{3,}/, "\n\n").strip
  end

  def self.target(site, url)
    path = url.sub(/\.html\z/, '').sub(%r{/\z}, '')
    path.empty? ? nil : File.join(site.dest, "#{path}.md")
  end

  def self.render(site, data, url, date)
    meta = ["# #{data['title']}", '', "URL: #{site.config['url']}#{url}"]
    meta << "Date: #{date.strftime('%Y-%m-%d')}" if date
    meta << "Author: #{site.data.dig('authors', 'cesarsotovalero', 'name')}"
    tags = Array(data['tags'])
    meta << "Tags: #{tags.join(', ')}" unless tags.empty?
    description = data['description'].to_s.strip.gsub(/\s+/, ' ')
    meta << "Summary: #{description}" unless description.empty?
    "#{meta.join("\n")}\n\n#{data['raw_markdown']}\n"
  end
end

%i[posts pages].each do |kind|
  Jekyll::Hooks.register kind, :pre_render do |doc|
    doc.data['raw_markdown'] = MarkdownAlternates.clean(doc.content, doc.site.config['url'])
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  items = site.posts.docs.map { |p| [p, p.url, p.date] }
  site.pages.each do |pg|
    next unless %w[.md .markdown].include?(pg.ext)
    next if pg.url == '/' || pg.url.end_with?('404.html') || pg.data['published'] == false
    next if pg.data['raw_markdown'].to_s.match?(/\{\{|\{%/) # dynamic listing pages

    items << [pg, pg.url, nil]
  end

  items.each do |doc, url, date|
    file = MarkdownAlternates.target(site, url)
    next unless file

    FileUtils.mkdir_p(File.dirname(file))
    File.write(file, MarkdownAlternates.render(site, doc.data, url, date))
  end
end
