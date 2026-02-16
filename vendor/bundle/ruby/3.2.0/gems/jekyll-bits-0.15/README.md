[![DevOps By Rultor.com](http://www.rultor.com/b/yegor256/jekyll-bits)](http://www.rultor.com/p/yegor256/jekyll-bits)
[![We recommend RubyMine](http://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![Build Status](https://travis-ci.org/yegor256/jekyll-bits.svg)](https://travis-ci.org/yegor256/jekyll-bits)
[![Gem Version](https://badge.fury.io/rb/jekyll-bits.svg)](http://badge.fury.io/rb/jekyll-bits)
[![Dependency Status](https://gemnasium.com/yegor256/jekyll-bits.svg)](https://gemnasium.com/yegor256/jekyll-bits)
[![Code Climate](http://img.shields.io/codeclimate/github/yegor256/jekyll-bits.svg)](https://codeclimate.com/github/yegor256/jekyll-bits)

It's a collection of very simply and useful [Jekyll](https://jekyllrb.com/) plugins,
which I'm using on [my blog](https://github.com/yegor256/blog).

**ATTENTION**: You
[can't](https://help.github.com/articles/adding-jekyll-plugins-to-a-github-pages-site/)
use this plugin with GitHub Pages.

To start, add it to your `_config.yml`:

```yaml
gems:
  - jekyll-bits
```

# `jb_picture`

Add this to the [front matter](https://jekyllrb.com/docs/frontmatter/) of
your Jekyll page:

```yaml
---
jb_picture: http://...
---
```

Or with more details:

```yaml
---
jb_picture:
  src: SRC attribute of <IMG> (mandatory)
  alt: ALT attribute of <IMG> (optional)
  href: HREF attribute of <A> (optional)
  caption: text of <FIGCAPTION> (optional)
  width: width in pixels (optional)
  height: height in pixels (optional)
---
```

Then, in the HTML `<head>`:

```liquid
{{ page | jb_picture_head }}
```

This meta information will be rendered:

```html
<meta property='og:image' content='...'/>
```

Then, in the HTML `<body>`:

```liquid
{{ page | jb_picture_body }}
```

Or this way:

```liquid
{% jb_picture_body %}
```

Something like that will be rendered:

```html
<figure class='jb_picture'>
  <a href='...'>
    <img alt='...' src='...'/>
  </a>
  <figcaption>...</figcaption>
</figure>
```

You can also define your picture URL in `image`, for example:

```yaml
---
image: /images/2017/01/hello-world.jpg
jb_picture:
  alt: Hello, world!
  caption: This is my hello world picture for you
  width: 1280
  height: 800
---
```

# License

(The MIT License)

Copyright (c) 2016 Yegor Bugayenko

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the 'Software'), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
