# frozen_string_literal: true

require 'nokogiri'

# Counts only the words a reader reads in the body of a post. Liquid's
# number_of_words on rendered content also counts HTML tags, attributes (such
# as long image alt texts), figure captions, and the footnotes section.
# Code blocks render as <figure class="highlight">, so they are kept.
module ReadingTimeFilter
  EXCLUDED_SELECTORS = [
    'figure:not(.highlight)',
    '.lineno',
    '.gutter',
    '.rouge-gutter',
    'script',
    'style',
    'svg',
    'img',
    '.footnotes',
    'sup[role="doc-noteref"]',
    'a.footnote'
  ].join(', ').freeze

  def body_word_count(html)
    return 0 if html.nil? || html.empty?

    fragment = Nokogiri::HTML::DocumentFragment.parse(html.to_s)
    fragment.css(EXCLUDED_SELECTORS).each(&:remove)
    fragment.text.split.length
  end
end

Liquid::Template.register_filter(ReadingTimeFilter)
