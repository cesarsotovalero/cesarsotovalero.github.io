require 'net/http'
require 'uri'
require 'yaml'
require 'cgi'
require 'json'
require 'openssl'

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
              File.exist?(path) ? YAML.safe_load(File.read(path))['youtube_api_key'] : nil
            end

      # Try API if key is available
      if key
        begin
          snippet = fetch_snippet(key)
          if snippet
            puts "YouTube video #{@id} found: #{snippet['title']}"
            return render_aside(
              snippet['thumbnails']['medium']['url'],
              CGI.escapeHTML(snippet['title']),
              Time.parse(snippet['publishedAt']).strftime('%-d %B %Y')
            )
          end
        rescue StandardError => e
          puts "YouTube API error for #{@id}: #{e.message}"
        end
      else
        puts "No YouTube API key found, using static fallback for #{@id}"
      end

      # Static fallback: use YouTube's public thumbnail URL (no API key needed)
      render_aside(
        "https://i.ytimg.com/vi/#{@id}/mqdefault.jpg",
        'Watch on YouTube',
        nil
      )
    end

    private

    def fetch_snippet(key)
      uri = URI.parse("https://www.googleapis.com/youtube/v3/videos?id=#{@id}&part=snippet&key=#{key}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      # Use system cert store and disable CRL checking to avoid LibreSSL issues on macOS
      cert_store = OpenSSL::X509::Store.new
      cert_store.set_default_paths
      http.cert_store = cert_store

      begin
        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)
        json = JSON.parse(response.body)
      rescue OpenSSL::SSL::SSLError => e
        puts "SSL error for YouTube video #{@id}: #{e.message}"
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)
        json = JSON.parse(response.body)
      end

      if json['error']
        puts "Can't download YouTube video #{@id}: #{json['error']['message']}"
        return nil
      end

      return nil if json['items'].nil? || json['items'].empty?

      json['items'][0]['snippet']
    end

    def render_aside(thumbnail_url, title, date)
      caption = date ? "#{title}; #{date}." : title
      "<aside class='youtube'>
        <a href='https://www.youtube.com/watch?v=#{@id}'><div class='box'>
        <img src='#{thumbnail_url}' alt='YouTube video ##{@id}'/>
        <div class='play'>
          <img src='/img/icons/youtube-play20px.svg' alt='Play Video' class='youtube-logo'>
        </div>
        </div></a>
        <div>#{caption}</div></aside>"
    end
  end
end

Liquid::Template.register_tag('youtube', Yegor::YoutubeBlock)
