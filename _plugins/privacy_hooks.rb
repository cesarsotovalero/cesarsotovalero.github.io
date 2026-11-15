# Security and privacy fixes applied to every generated HTML page.
#
# - Links that open a new tab get rel="noopener", so the opened page can't
#   control this one through window.opener.
# - Embedded YouTube players use youtube-nocookie.com, which doesn't set
#   tracking cookies until the visitor plays the video.
Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  next unless doc.output.is_a?(String) && doc.output_ext == '.html'

  html = doc.output.gsub(/<a\s[^>]*target=["']_blank["'][^>]*>/) do |tag|
    if tag =~ /\srel=(["'])(.*?)\1/
      Regexp.last_match(2).split.include?('noopener') ? tag : tag.sub(/\srel=(["'])(.*?)\1/) { %( rel="#{Regexp.last_match(2)} noopener") }
    else
      tag.sub(/>\z/, ' rel="noopener">')
    end
  end
  html = html.gsub('https://www.youtube.com/embed/', 'https://www.youtube-nocookie.com/embed/')
  doc.output = html
end
