# Accessibility fixes applied to the HTML that kramdown and Rouge generate.
#
# - Code blocks with line numbers are rendered as a horizontally scrolling
#   table; tabindex="0" lets keyboard users focus and scroll them.
# - Markdown task lists render unlabeled checkboxes; name them by their state.
Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  next unless doc.output.is_a?(String) && doc.output_ext == '.html'

  html = doc.output.gsub('<table class="rouge-table">', '<table class="rouge-table" tabindex="0">')
  html = html.gsub(/<input type="checkbox" class="task-list-item-checkbox"([^>]*)>/) do
    attrs = Regexp.last_match(1)
    label = attrs.include?('checked') ? 'Done' : 'Not done'
    %(<input type="checkbox" class="task-list-item-checkbox" aria-label="#{label}"#{attrs}>)
  end
  doc.output = html
end
