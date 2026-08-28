# Ruby 4.0+ regex engine cannot allocate the giant emoji alternation pattern
# built by html-pipeline's EmojiFilter. Replace it with a simple pattern and
# hash-based validation only when running on an affected Ruby version.
if RUBY_VERSION >= "4.0"
  require "html/pipeline"

  module HTML
    class Pipeline
      class EmojiFilter < Filter
        class << self
          def emoji_names_set
            @emoji_names_set ||= Set.new(Emoji.all.map(&:aliases).flatten)
          end

          def emoji_pattern
            /:([\w\+\-]+):/
          end
        end

        def call
          doc.search('.//text()').each do |node|
            content = node.to_html
            next unless content.include?(':')
            next if has_ancestor?(node, %w[pre code tt])

            html = content.gsub(self.class.emoji_pattern) do |match|
              name = Regexp.last_match(1)
              if self.class.emoji_names_set.include?(name)
                emoji_tag_for(name)
              else
                match
              end
            end

            next if html == content
            node.replace(html)
          end
          doc
        end

        private

        def emoji_tag_for(name)
          emoji = Emoji.find_by_alias(name)
          return name unless emoji
          src = File.join(asset_root, emoji.image_filename)
          "<img class='emoji' title=':#{name}:' alt=':#{name}:' src='#{src}' height='20' width='20' align='absmiddle' />"
        end
      end
    end
  end
end
