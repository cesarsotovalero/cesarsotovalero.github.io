# Talk rows: renders each talk of a Markdown list as a row, like the blog, YouTube and LinkedIn lists.
#
# The Markdown in _pages/talks.md stays the source (scripts/sync_talks_from_page.py reads it); this only
# reshapes the converted HTML of pages with `talk_rows: true` in their front matter. Each list item that
# starts with a bold title becomes:
#
#   title
#   details (the rest of the sentence: role, event, place, date)
#   [Video] [Slides] [Announcement] ...   (the item's links with these labels, as chips)
#   + the YouTube thumbnail on the right when the talk has a video (otherwise an empty slot)
#
# Year headings (## 2026) get the talk count, and the per-year {% youtube %} boxes are dropped,
# since every talk with a video now shows its own thumbnail.
require 'nokogiri'

module TalkRows
  CHIP_LABELS = %w[video slides announcement poster post paper recording code].freeze
  YOUTUBE_ID = %r{(?:youtu\.be/|youtube\.com/watch\?v=)([A-Za-z0-9_-]{6,})}.freeze

  module_function

  def label(anchor)
    anchor.text.gsub(/:[a-z_]+:/, '').strip
  end

  def chip?(anchor)
    CHIP_LABELS.include?(label(anchor).downcase)
  end

  def external?(href)
    href.to_s.start_with?('http://', 'https://')
  end

  def transform(html)
    fragment = Nokogiri::HTML5.fragment(html)

    fragment.css('aside.youtube').each(&:remove)

    # Markdown like {:target="\_blank"} leaves a literal backslash: a window named "\_blank", not a new tab.
    fragment.css('a[target]').each do |anchor|
      next unless anchor['target'].include?('blank')

      anchor['target'] = '_blank'
      anchor['rel'] = 'noopener'
    end

    fragment.css('li').each { |item| reshape(item) }

    fragment.css('h2').each do |heading|
      next unless heading.text.strip.match?(/\A\d{4}\z/)

      count = 0
      sibling = heading.next_element
      while sibling && sibling.name != 'h2'
        count += sibling.css('li.talk-row').size
        sibling = sibling.next_element
      end
      next if count.zero?

      heading['class'] = [heading['class'], 'blog-year-title'].compact.join(' ')
      heading.add_child(Nokogiri::XML::Text.new(" (#{count})", fragment.document))
    end

    fragment.to_html
  end

  def reshape(item)
    elements = item.element_children
    # Loose lists wrap each item in a paragraph.
    body = elements.size == 1 && elements.first.name == 'p' ? elements.first : item
    first = body.children.find { |node| !(node.text? && node.text.strip.empty?) }
    return unless first && first.element? && first.name == 'strong'

    doc = item.document
    chips = body.xpath('./a').select { |anchor| chip?(anchor) }
    video = chips.find { |anchor| label(anchor).casecmp?('video') } ||
            item.css('a[href]').find { |anchor| anchor['href'].match?(YOUTUBE_ID) }
    video_id = video && video['href'][YOUTUBE_ID, 1]

    title = first.inner_html
    first.remove
    chips.each(&:remove)
    details = body.inner_html.strip
                  .sub(/\A[\s.,:;]+/, '')  # ". Presented at" -> "Presented at"
                  .sub(/[\s,]+\z/, '')     # separators the links left behind

    text = doc.create_element('div', class: 'blog-row-text')
    text.add_child(doc.create_element('span', class: 'blog-row-title')).inner_html = title
    text.add_child(doc.create_element('span', class: 'blog-meta')).inner_html = details unless details.empty?
    unless chips.empty?
      links = text.add_child(doc.create_element('span', class: 'talk-links'))
      chips.each do |chip|
        link = links.add_child(doc.create_element('a', label(chip), class: 'talk-link', href: chip['href']))
        if external?(chip['href'])
          link['target'] = '_blank'
          link['rel'] = 'noopener'
        end
      end
    end

    item.children.each(&:remove)
    item.add_child(text)
    if video_id
      thumb = item.add_child(doc.create_element('a', class: 'row-thumb-link', href: video['href'], target: '_blank',
                                                     rel: 'noopener', tabindex: '-1', 'aria-hidden': 'true'))
      thumb.add_child(doc.create_element('img', class: 'thumb-rect row-thumb', alt: '', width: '128', height: '72',
                                                loading: 'lazy', decoding: 'async',
                                                src: "https://i.ytimg.com/vi/#{video_id}/mqdefault.jpg"))
    else
      item.add_child(doc.create_element('span', class: 'row-thumb row-thumb-empty', 'aria-hidden': 'true'))
    end
    item['class'] = 'blog-row talk-row'
    list = item.parent
    list['class'] = 'blog-rows talk-rows' if list && list.name == 'ul'
  end
end

Jekyll::Hooks.register :pages, :post_convert do |page|
  page.content = TalkRows.transform(page.content) if page.data['talk_rows']
end
