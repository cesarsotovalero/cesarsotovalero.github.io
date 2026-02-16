# encoding: utf-8
#
# (The MIT License)
#
# Copyright (c) 2016 Yegor Bugayenko
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

require 'digest/md5'
require 'liquid'
require 'uri'
require 'fastimage'

# Jekyll module
module Jekyll
  # All our custom filters
  module JbFilters
    def jb_picture_head(page)
      uri = jb_abs(jb_uri(page))
      return '' if uri.empty?
      html = "<meta name='og:image' content='#{CGI.escapeElement(uri)}'/>"
      html += "<meta name='twitter:image' content='#{CGI.escapeElement(uri)}'/>"
      path = uri
      path = File.join(Dir.pwd, path) unless \
        %w(http https).include?(URI.parse(uri).scheme)
      width, height = FastImage.size(path)
      if width
        html += "<meta name='og:image:width' content='#{width}'/>
<meta name='twitter:image:width' content='#{width}'/>"
      end
      if height
        html += "<meta name='og:image:height' content='#{height}'/>
<meta name='twitter:image:height' content='#{height}'/>"
      end
      if width && width >= 640 && height && height >= 480
        html += "<meta name='twitter:card' content='summary_large_image'/>"
      else
        html += "<meta name='twitter:card' content='summary'/>"
      end
      html += "<meta name='twitter:image:alt' \
content='#{CGI.escapeHTML(jb_alt(page))}'/>"
      html
    end

    def jb_picture_body(page)
      uri = jb_uri(page)
      return '' if uri.empty?
      yaml = page['jb_picture']
      html = "<img itemprop='image' alt='#{CGI.escapeHTML(jb_alt(page))}'"
      html += " src='#{CGI.escapeElement(uri)}'"
      md5 = Digest::MD5.new.hexdigest(uri)[0, 8]
      html += " longdesc='##{md5}'" \
        if yaml.is_a?(Hash) && yaml['caption']
      html += " width='#{yaml['width']}'" \
        if yaml.is_a?(Hash) && yaml['width']
      html += " height='#{yaml['height']}'" \
        if yaml.is_a?(Hash) && yaml['height']
      html += '/>'
      html = "<a href='#{CGI.escapeHTML(yaml['href'])}'>#{html}</a>" \
        if yaml.is_a?(Hash) && yaml['href']
      html = "<figure class='jb_picture'>" + html
      if yaml.is_a?(Hash) && yaml['caption']
        html += "<figcaption id='#{md5}'>" \
          "#{CGI.escapeHTML(yaml['caption'])}</figcaption>"
      end
      html + '</figure>'
    end

    private

    @@home = nil

    def jb_uri(page)
      uri = ''
      uri = page['image'] if page['image']
      yaml = page['jb_picture']
      if yaml
        if yaml.is_a?(Hash)
          uri = yaml['src'] if yaml['src']
        else
          uri = yaml
        end
      end
      uri.to_s
    end

    def jb_abs(uri)
      unless uri.empty?
        uri = URI.parse(uri)
        uri = jb_home + uri.to_s unless %w(http https).include?(uri.scheme)
      end
      uri.to_s
    end

    def jb_home
      if @@home.nil?
        @@home = Jekyll.configuration({})['url']
        if @@home.nil?
          @@home = ''
        else
          @@home.gsub!(%r{/$}, '')
        end
      end
      @@home
    end

    def jb_alt(page)
      alt = ''
      yaml = page['jb_picture']
      if yaml && yaml.is_a?(Hash)
        if yaml['alt']
          alt = yaml['alt']
        elsif yaml['caption']
          alt = yaml['caption']
        end
      end
      alt = 'Main picture' if alt.empty?
      alt
    end
  end

  # Box for testing and calling static methods.
  class JbBox
    include JbFilters
  end

  # Jekyll block
  class JbPictureBlock < Liquid::Tag
    def render(context)
      JbBox.new.jb_picture_body(context.registers[:page])
    end
  end
end

Liquid::Template.register_filter(Jekyll::JbFilters)
Liquid::Template.register_tag('jb_picture_body', Jekyll::JbPictureBlock)
