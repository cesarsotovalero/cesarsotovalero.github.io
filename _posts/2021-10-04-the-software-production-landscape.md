---
layout: post
title: The software production landscape
subtitle: Software supply chains 
tags: security
description: 
keywords:
  - software development,
  - continuous integration,
  - continuous delivery,
  - software design,
  - software architecture
image: https://www.cesarsotovalero.net/img/posts/clouds_cover.png
share-img: https://www.cesarsotovalero.net/img/posts/clouds_cover.png
show-avatar: false
date: 2021/10/04
published: false
---


According to Wikipedia a [supply chain](https://en.wikipedia.org/wiki/Supply_chain) is a system of organizations, people, activities, information, and resources involved in moving a product or service from supplier to consumer.
Supply chains has been successful to mitigate the risk associated to the dinamic and distributed nature of goods' production.

Software is untangible. A software supply chain is all the technology involved in shipping a piece of code from development to getting deployed in production.
This includes application's source code, CI/CD pipeline, binaries, package managers, etc.



Software has already [eaten the world](https://www.wsj.com/articles/SB10001424053111903480904576512250915629460).




[Software supply chain attacks](https://en.wikipedia.org/wiki/Supply_chain_attack) target the less secure elements in the supply chain.
For example, third party libraries. 
Cyber-criminals focus on the software infrastructure, including corrupted compilers, . 



1. The idea.
2. The people who wrote it.
3. When it was contributed.
4. The security scanning.
5. The infrastructure the application runs on.



- sometimes is hard to see the big picture


<figure class="jb_picture">
  {% responsive_image path: img/posts/clouds.png alt: "The cloud: a bunch of Linux servers where microservices coexist." %}
  <figcaption class="stroke">
    &#169; The cloud: a bunch of Linux servers where microservices coexist. 
    </figcaption>
</figure>


# Open source 

As in traditional supply chains chains, open source software has a distributed decision making process that involves several information flow streams.

What should be measured?
- Dependency
- code reused
- Knowledge flow network

# Dependencies

Today it is almost impossible to ship software fast without relying on third-party dependencies.

[comment]: <> (Add data of open-source libraries that are eavily used).
This means that most of the code shipped to the clients is not written by the providers.   


