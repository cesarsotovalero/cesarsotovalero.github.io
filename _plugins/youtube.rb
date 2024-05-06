require 'net/http'
require 'uri'
require 'yaml'
require 'cgi'
require 'json'

# My module
module Yegor
  # The class
  class YoutubeBlock < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @id = markup.strip
    end

    def render(_context)
      key = if ENV['YOUTUBE_API_TOKEN']
              ENV['YOUTUBE_API_TOKEN']  # Use the environment variable if it exists
            else
              # Fall back to secrets.yml if the environment variable is not set
              path = File.expand_path('~/secrets.yml')
              File.exist?(path) ? YAML.safe_load(File.open(path))['youtube_api_key'] : nil
            end

      return '<!-- No API key found -->' unless key  # Return error comment if no key is found

      # Construct the API request URI
      uri = URI.parse("https://www.googleapis.com/youtube/v3/videos?id=#{@id}&part=snippet&key=#{key}")
      response = Net::HTTP.get(uri)
      json = JSON.parse(response)

      # Handle potential errors from the API
      if json['error']
        puts "Can't download YouTube video #{@id}, skipped: #{json['error']}"
        return "<!-- YouTube video #{@id} skipped: #{json['error']['message']} -->"
      end

      raise "YouTube video #{@id} not found" if json['items'].empty?

      # Render the video snippet if found
      item = json['items'][0]
      snippet = item['snippet']
      puts "YouTube video #{@id} found: #{snippet['title']}"
      "<aside class='youtube'>
        <a href='https://www.youtube.com/watch?v=#{@id}'><div class='box'>
        <img src='#{snippet['thumbnails']['medium']['url']}' alt='YouTube video ##{@id}'/>
        <div class='play'>
          <img src='/img/icons/youtube-play20px.svg' alt='Play Video' class='youtube-logo'>
        </div>
        </div></a>
        <div>#{CGI.escapeHTML(snippet['title'])};
        #{Time.parse(snippet['publishedAt']).strftime('%-d %B %Y')}.</div></aside>"
    end
  end
end

Liquid::Template.register_tag('youtube', Yegor::YoutubeBlock)
