# _plugins/linkedin_embed.rb
module Jekyll
  class LinkedInEmbedTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @url = markup.strip
    end

    def render(context)
      url = if @url =~ %r{\Ahttps?://}
              @url
            else
              "https://www.linkedin.com/posts/#{@url}"
            end
      <<~HTML
      <div class="linkedin-embed">
        <script src="https://platform.linkedin.com/in.js" type="text/javascript"> lang: en_US</script>
        <script type="IN/Embed" data-url="#{url}"></script>
      </div>
      HTML
    end
  end
end

Liquid::Template.register_tag('linkedin', Jekyll::LinkedInEmbedTag)
