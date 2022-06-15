---
layout: post
title: The Dynamics of Java
subtitle: Understanding IoC
tags: programming
description: TODO
keywords:
  - Spring Boot,
  - Java programming,
  - Design patterns,
  - TODO,
  - TODO 
image: ../img/posts/2022/untamed_horse_cover.jpg
share-img: ../img/posts/2022/untamed_horse_cover.jpg
show-avatar: false
toc: true
date: 2022/04/22
author: cesarsotovalero
published: false
---

The Java Reflection API allows programmers to dynamically inspect and interact with otherwise static language concepts such as classes, fields and methods, e.g., to dynamically instantiate objects, set fields and invoke methods.
These dynamic language features are useful, but their usage also wreaks havoc on the accuracy of static analysis results. This is due to the undecidability of resolving dynamic names and dynamic types.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/untamed_horse.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; TODO. 
The dynamic Java remain an untamed horse for program analysis techniques <a href="TODO">TODO</a>.
  </figcaption>
</figure>


# HEADING

Java is a wonderful, dynamic programming in language. 
It's a tried and true venerable systems programing language that's served a lot of people well over many years. 
It's also a bit of a funny old language. 
It may seem at times like a systems programming language, but it's actually got more in common with dynamic languages like Ruby, Python and JavaScript. 
It's this duality that makes it so cool. 
The dynamic nature of Java impacts its footprint at runtime. 
After all, a Java program can load strings, register those strings as classes, load those classes into the class loader, create proxies, serialize them, et cetera, all at runtime. 
And we can't afford to make any assumptions about what should be kept at runtime, what should be present at run time. 
We need to keep everything just in case. 

On the other hand, Java is used in serious enterprises that want to eek out every iota of performance from their applications. 
Java powers the largest services on the planet from Alibaba at to Google, to eBay, to Amazon, and others besides. 
They all have Java at the heart of their systems so Java has concessions for that crowd as well. 
It supports a just-in-time compiler or JIT. 
JIT allows the competitor to see frequently-access code paths and turn them into machine architecture-specific code. 
And for the most part, this works great. 
Code that's run frequently enough is adaptively compiled into an architecture-specific form, but this means that the distribution is still a portable.jar that'll run on every operating system. 

Large organizations like Google take advantage of this mechanism to proactively warm up their services before putting them into production. 
So it would seem everybody's happy. 
Java's just-in-time compiler makes it efficient to the point where certain code paths in a job application can run faster than a reasonable equivalent in C or C++, and even if it's only just close to a performance, nobody would argue that Java is, you know, not way more productive. 
This makes it a very compelling language. 
And a part of that productivity, a part of that compelling nature is the fact that it supports a runtime that cares for things that the developers shouldn't have to care about, like garbage collection and balance checking. 

Surely everybody's happy, right? Well, not quite. 
There's no such thing as a free lunch. 
The Java runtime has grown considerably over the years as have people's class paths. 
And since Java supports a lot of dynamic behavior, the Java runtime can't be sure about what code is being used so it loads everything. 
This slows down application startup time and it balloons the RAM footprint of the application. 
Also, Java is still interpreted, so while it's possible to get parts of the application that run at native speeds. 
Wouldn't it be cool if the whole thing ran at native speeds instead of just the frequently access code paths? 

This is the core conceit of GraalVM. 
GraalVM is an ahead-of-time competitor. 
It statically analyzes the app and chucks out everything that's not being used at runtime. 
Obviously it can't possibly know what's being used at runtime when it's compiling the code at compile time so we need to give it some extra information or hints. 
Spring Native provides GraalVM information about your Spring Native applications. 
It provides those hints and tells it what things should be retained so that your application can run and so that it can keep only the parts that are required for your application to run. 

The results are applications that start up in tens of milliseconds and take tens of megabytes of RAM, not hundreds, or, you know, worse. 
These applications are ideal for a production environment like Kubernetes, which wants to be the best bin packer to cram together all your applications as efficiently as possible to save you money, reduce server infrastructure, carbon footprint, and more. 

 # HEADING

# Conclusion

# References

- [On the Soundness of Call Graph   Construction in the Presence of Dynamic Language Features - A Benchmark and Tool Evaluation](https://link.springer.com/chapter/10.1007/978-3-030-02768-1_4)
- [Challenges for Static Analysis of Java Reflection – Literature Review and Empirical Study](https://dl.acm.org/doi/pdf/10.1109/ICSE.2017.53)
- [Judge: Identifying, Understanding, and Evaluating Sources of Unsoundness in Call Graphs](https://dl.acm.org/doi/10.1145/3293882.3330555)
- [On the Recall of Static Call Graph Construction in Practice](https://ieeexplore.ieee.org/abstract/document/9283958)
- [A Study of Call Graph Construction for JVM-Hosted Languages](https://ieeexplore.ieee.org/abstract/document/8944149)
- [Identifying Java Calls in Native Code via Binary Scanning](https://dl.acm.org/doi/pdf/10.1145/3395363.3397368)
- [Serialization-Aware Call Graph Construction](https://dl.acm.org/doi/pdf/10.1145/3460946.3464319)

