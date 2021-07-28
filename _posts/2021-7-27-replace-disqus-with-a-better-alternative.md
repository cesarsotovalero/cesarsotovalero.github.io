---
layout: post
title:  Replace disqus comments system on your Jekyll blog 
subtitle: The GitHub based open-source alternatives are much better
description: Disqus started polluting users with unwanted ads; it's time to migrate your blog's discussion management system with better open-source alternatives.
tags: research
published: false
keywords: blog, comments, disqus, open-source
image: https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/posts/angry-emoji.jpg
share-img: https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/posts/angry-emoji.jpg
show-avatar: false
date: 2021/7/27
---

I started using [Disqus](https://disqus.com) in 2018. 
At that time, Disqus was arguably the leading comment management system of the web: ubiquitous integration, easy to set up, clean comment widget design, excellent spam filters, great content engaging features, etc.
Two years later (January 2020), Disqus started polluting their free users with unwanted ads; it now charging a monthly fee to remove them.
This change affects a large number of small businesses and bloggers that rely on Disqus to handle their comments.


> For an inexpensive monthly fee [$10/month per site] publishers will be able to completely remove ads and take advantage of all of Disqus’ basic features and functionality. -- Disqus

It's time to migrate your blog's discussion management system with better open-source alternatives.

Features such as powerful moderation and admin tools, spam filtering, blacklisting, email notifications, and well designed threaded comments are just a few reasons why it has become popular over the years.



I see that you're using utterances for comments. As we know, it utilizes GitHub Issues, which (given enough time) would flood your repository's issues with comments.

I've been developing an alternative: giscus, a similar project that utilizes GitHub Discussions instead. It has support for replies and other cool stuff from GitHub Discussions. The big advantage is the fact that it uses your repository's Discussions, which is more suitable for comments. I would really appreciate it if you tried it. Feedback is welcome, the code is open source.

You can convert existing issues into discussions, as described here.


<figure class="jb_picture">
  {% responsive_image path: img/posts/ladybug.jpg alt: "Disqus' intrusive ads."%}
  <figcaption class="stroke">
    &#169; Disqus' intrusive ads.
  </figcaption>
</figure>


Jekyll + GitHub Pages
Plus, because GitHub pages are powered by Jekyll (one of the GitHub founders created it back in 2008.), you can deploy your newly created Jekyll site on GitHub - completely free.

# Why removing

- 

# Pros

Both are ideal solutions for sites with an audience that skews towards developers and may already have a GitHub account. I want something platform agnostic and didn’t require any sort of account to leave a comment… so the search continued.

- [Performance increase](https://chrislema.com/killed-disqus-commenting/)


# Cons


# Alternatives

- [https://gitalk.github.io/](https://gitalk.github.io/)
- [https://utteranc.es](https://utteranc.es)
- [Staticman](https://staticman.net/)

Adding static comments to a Jekyll site with Staticman
# Conclusion

