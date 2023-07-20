---
layout: post
title:  Replace the Disqus Commenting System on your Blog 
subtitle: GitHub-based open-source alternatives are better
description: Disqus started polluting free users with unwanted ads; it's time to replace Disqus with better open-source alternatives.
tags: tools
keywords: blog, comments, disqus, replace
image: ../img/posts/2021/angry-emoji.jpg
share-img: ../img/posts/2021/angry-emoji.jpg
toc: true
show-avatar: false
author: cesarsotovalero
date: 2021/7/27
published: true
---

I started using [Disqus](https://disqus.com) in 2018.
At that time, it was ~~arguably~~ the leading commenting management system for both small and large websites.
Its popularity was well deserved: ubiquitous integration, easy to set up, friendly admin panel, clean comment widget design, excellent spam filters, [great content engaging features](https://disqus.com/features/engage/), etc.
Three years later, in January 2021, Disqus started polluting my blog with [unwanted ads](https://help.uberflip.com/hc/en-us/articles/360023372611-Unwanted-ads-appear-on-Hub).
At the time of writing this post, Disqus is charging a monthly fee of $10/month per site to remove its own imposed ads.
This change affects a large number of small businesses and bloggers that rely on Disqus to handle their visitors' comments.
Fortunately, there are now great open-source alternatives out there that allow GitHub users to get rid of Disqus.
In this post, I show you how I set up [Giscus](https://giscus.app) on this blog.
Gisqus is an open-source commenting system that relies on GitHub Discussions to securely and effectively manage comments.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Woah, <a href="https://twitter.com/disqus?ref_src=twsrc%5Etfw">@disqus</a> now forcing ads on the Commenting System. When tried to remove got this screen. :/ <br><br>These ads pay nothing &amp; they force them. <a href="https://t.co/8NxVis8n1A">pic.twitter.com/8NxVis8n1A</a></p>&mdash; Amit Bhawani (@amitbhawani) <a href="https://twitter.com/amitbhawani/status/828554455876505601?ref_src=twsrc%5Etfw">February 6, 2017</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

# What Happened with Disqus?

Comment management is a crucial part of the blogging endeavour.
Comments are the perfect communication channel to engage with readers.
From small to prominent blogs, the number of comments is an accurate measure of the popularity of a publication. 
But moderating visitor comments can consume a considerable amount of time.
I used to rely on Disqus for handling my blog's comments.
Disqus is one of the world's leading commenting management systems. 
It is massively used by thousand of websites. 
However, Disqus suddenly started to introduce ads on my website, asking for an ~~inexpensive~~ monthly fee in exchange for their removal.

> "For an inexpensive monthly fee publishers will be able to completely remove ads and take advantage of all of Disqus’ basic features and functionality." -- [Disqus](https://blog.disqus.com/our-plans-for-2017)

This is a bad move from Disqus, especially for small blogs that cannot afford this significant fee. 
So, it is time to replace it for the best of the visitors (and the pocket).

# Why Replacing Disqus?

These are the primary reasons to get rid of Disqus:

- **Spammy ads**: Disqus ads are just horrible. They cover a large portion of the screen and tend to be either click bait or fake news.
- **Performance issues:** Disqus is know to degrade [page load time](https://chrislema.com/killed-disqus-commenting/). This is mostly due to the syncing of comments back and forth with the server, and calling third party scripts when loading ads.
- **Privacy concerns:** Disqus introduces an additional layer of complexity to your website by forcing visitors to log in with their social media accounts when commenting. This ~~obviously~~ opens the door to privacy issues.

# Alternatives

Luckly, there are great open-source alternatives to Disqus:

- **[Giscus](https://giscus.app):** My preferred choice. It relies on GitHub discussions, which means that it supports replies and other cool features.
- **[Utterances](https://utteranc.es):** A lightweight comments widget built on top of GitHub Issues. It is one of the most widely used alternatives out there. However, given enough time, it might flood your repository's issues with comments.
- **[Gitalk](https://gitalk.github.io):** A modern component based on GitHub Issues and Preact. It supports cool features such as Facebook-like distraction free mode, hotkeys, and automatic language localization. 

**Note:** These GitHub-based solutions are ideal for sites with an audience that skews towards developers who already have a GitHub account. 

# Setting Up Giscus

[This blog](https://www.cesarsotovalero.net/blog) runs on GitHub pages, and [Jekyll](https://jekyllrb.com/) powers it.
By the way, please [give it a star](https://github.com/cesarsotovalero/cesarsotovalero.github.io) if you like it :smiley:.
Jekyll is a static site generator created by one of the GitHub founders.
The principal advantage of Jekyll is that I can deploy my website on GitHub completely free.
This means that all the GitHub features can be integrated as part of my blogging activities.

[Giscus](https://giscus.app) utilizes GitHub Discussions as a backing data store.
One significant advantage of Giscus concerning other GitHub-based commenting systems is that repository Discussions are more suitable for comments.
For example, it supports comments replies, more engaging discussion reactions, and is easier to moderate. In addition, it is lightweight, easy to configure, and secure. With Giscus, there is no need to worry about GitHub API rate limits, managing server-side code, manually linking blog posts to issues, or forcing users to leave your site to post a comment.

> **How it works?**
>
> "When giscus loads, the GitHub Discussions search API is used to find the Discussion associated with the page based on a chosen mapping (URL, pathname, \<title\>, etc.). If a matching discussion cannot be found, the giscus bot will automatically create a discussion the first time someone leaves a comment or reaction."
>
> "To comment, visitors must authorize the giscus app to post on their behalf using the GitHub OAuth flow. Alternatively, visitors can comment on the GitHub Discussion directly. You can moderate the comments on GitHub." -- [Gisqus](https://giscus.app)

To set up Giscus, the GitHub repo has to meet only three requirement:

1. The repo is [public](https://docs.github.com/en/github/administering-a-repository/managing-repository-settings/setting-repository-visibility#making-a-repository-public)
2. The [giscus](https://github.com/apps/giscus) app is installed on the repository
3. The Discussions feature is [enabled](https://docs.github.com/en/github/administering-a-repository/managing-repository-settings/enabling-or-disabling-github-discussions-for-a-repository)

To insert giscus, just add the following code where you want the comments to be displayed.

{% highlight html linenos %}
<script src="https://giscus.app/client.js"
  data-repo="cesarsotovalero/cesarsotovalero.github.io"
  data-repo-id="REPO_ID"
  data-category="Announcements"
  data-category-id="CATEGORY_ID"
  data-mapping="pathname"
  data-reactions-enabled="1"
  data-emit-metadata="1"
  data-theme="CUSTOM_CSS"
  data-lang="en"
  crossorigin="anonymous"
  async>
</script>
{% endhighlight %}

The `REPO_ID` and `CATEGORY_ID` can be obtained using the [Giscus](https://giscus.app/#repository) form.
The look and feel of the comments can be customized via `CUSTOM_CSS` path.
The following code is and example of how I changed the default font size of the [GitHub light syntax](https://github.com/primer/github-syntax-light/blob/master/lib/github-light.css) to meet the style of my blog:

{% highlight css linenos %}
mr-2 {
  font-size: 20px;
}

.text-sm {
  font-size: 18px;
}

.text-xs {
  font-size: 12px;
}
{% endhighlight %}

You can see my full customized CSS [here](https://www.cesarsotovalero.net/css/giscus.css).

# Additional Configurations

Giscus supports [additional configurations](https://github.com/giscus/giscus/blob/main/ADVANCED-USAGE.md).
These configurations can be set by creating a `.giscus.json` file in the root of the repository.

Here is an example used in this website:

{% highlight json linenos %}
{
  {
  "origins": [
    "https://www.cesarsotovalero.net",
    "https://cesarsotovalero.net"
  ],
  "originsRegex": [
    "http://localhost:[0-9]+"
  ],
  "defaultCommentOrder": "oldest"
  }
}
{% endhighlight %}

The `origins` and `originsRegex` keys restrict the domains that can load this website's repository discussions via giscus.

# Conclusion

The time to quit Disqus has come for me.
I prefer a lightweight, open-source, and free solution for handling my blog comments.
I opted for Giscus, a great ad-free solution that provides an excellent user experience, especially to readers already familiar with GitHub.
It's worth mentioning that this system relies on GitHub, a Microsoft product, so it is not wholly exempt from future changes.
However, it is highly unlikely to expect some sort of fee for public repositories at the moment.
If you have any questions, let me know in the Giscus-based comments below!
