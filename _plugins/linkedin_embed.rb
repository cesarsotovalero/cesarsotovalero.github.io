# _plugins/linkedin_embed.rb
module Jekyll
  class LinkedInEmbedTag < Liquid::Tag
    @@script_included = false

    def initialize(tag_name, markup, tokens)
      super
      raw = markup.strip
      @url = if raw =~ %r{\Ahttps?://}
               raw
             else
               "https://www.linkedin.com/posts/#{raw}"
             end
    end

    def render(context)
      html = +"<div class=\"linkedin-embed\" data-src=\"#{@url}\">\n"
      unless @@script_included
        html << <<~SCRIPT
          <script src="https://platform.linkedin.com/in.js" type="text/javascript">lang: en_US</script>
        SCRIPT
        @@script_included = true
      end
      html << %Q{<script type="IN/Embed" data-url="#{@url}"></script>\n}
      html << "</div>\n"
      html
    end
  end
end

Liquid::Template.register_tag('linkedin', Jekyll::LinkedInEmbedTag)
