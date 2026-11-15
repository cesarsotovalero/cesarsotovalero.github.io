# Posts are written with "# Section" headings, but the post title is already the
# page's <h1>. Shift the headings of post bodies down one level (h1 -> h2, ...,
# h5 -> h6) so every post has a single <h1>. css/main.css numbers the sections
# from h2, and _config.yml builds the TOC from h2.
#
# Only posts are changed; pages keep their headings.
Jekyll::Hooks.register :posts, :post_convert do |post|
  next unless post.output_ext == '.html'

  html = post.content.gsub(%r{<(/?)h([1-5])(?=[\s>])}) { "<#{Regexp.last_match(1)}h#{Regexp.last_match(2).to_i + 1}" }
  # "Footnotes" is not a numbered section: keep it out of the TOC (jekyll-toc skips .no_toc).
  html = html.sub('<h2 id="footnotes">', '<h2 id="footnotes" class="no_toc">')
  post.content = html
end
