---
layout: post
title: On the Rise, Decline, and Stickiness of Web Technologies
subtitle: From Static HTML to WebAssembly
tags: web
description: |
  TODO
keywords:
  - A
  - B
  - C
  - D
  - E
image: ../img/posts/2024/2024-01-12/infinite-park-cover.jpg
share-img: ../img/posts/2024/2024-01-12/infinite-park-cover.jpg
show-avatar: false
toc: true
mathjax: false
date: 2024/01/12
author: cesarsotovalero
published: false
---

I've been doing some frontend development lately as part of my daily job.[^1]
On the way, I've reflected on how the different web technologies have changed and evolved over time.
Soon I delved into the many technical challenges and solutions that have been developed over the years. 
While digging into it, I realized how little I know about the underlining technologies that power the web.
This post presents a roadmap of the different technical solutions that have been created over the years to solve the technical requirements of the web.
This includes the different architectures and patterns as they appeared over the years, tracing their need and impact on the technological landscape.
From those that got obsolete like Java Applets, to those that survived the test of time like Static Pages, to the recent emergence of WebAssembly.
You're likely to find this post interesting if you are a software developer, a web developer, or just curious about how the web works.
Let's dive in!

<figure class="jb_picture">
  {% responsive_image path: img/posts/2024/2024-01-12/infinite-park.jpg alt: "TODO" %}
  <figcaption class="stroke"> 
    &#169; TODO
  </figcaption>
</figure>

# Overview

<figure class="jb_picture">
  {% responsive_image path: img/posts/2024/2024-01-12/FirstProposalMarch1989.jpg alt: "Tim Berners-Lee's proposal for the World Wide Web" %}
  <figcaption class="stroke"> 
    Figure 1. Fist page of Tim Berners-Lee's proposal for the World Wide Web in March 1989. <a href="https://cds.cern.ch/images/OPEN-PHO-CCC-2019-001-1">Source</a>
  </figcaption>
</figure>

- The history of the web has been a continuous back and forward regarding where to put the execution logic: in the server or in the client.
- The development of web technologies has dramatically transformed the way we build and interact with applications on the internet.

- The address of the world's first ever website and Web server was [info.cern.ch](https://info.cern.ch/), running at CERN. The first web page address was [https://info.cern.ch/hypertext/WWW/TheProject.html](https://info.cern.ch/hypertext/WWW/TheProject.html).
- The first time I navigated the Internet was in 2011, because in Cuba the days we have Internet only on the universities and of course, we have intranet.
- The internet was created in the 1960s, and the web was created in the 1990s by Tim Berners-Lee.
- The internet runs through submarine cables, whereas the web there is a collection of protocols and technologies that support data transfer over the internet.
- Interestingly, the web was created initially to link research papers through hyperlinks.
- Over the years, companies have pushed countries to reach consensus on which web technologies to adopt or accept.  
- The web has evolved over time, and different technologies have been developed to solve different problems.
- Some of these technologies have been replaced by newer ones, while others have survived the test of time.

# Timeline

[//]: # https://mermaid.js.org/syntax/timeline.html
{% mermaid %}
timeline
title History of Social Media Platform
2002 : LinkedIn
2004 : Facebook
: Google
2005 : Youtube
2006 : Twitter
{% endmermaid %}

## Transfer Files & Static HTML (1990s to present)

[//]: # (ChatGPT)
In the early 1990s, the World Wide Web was a collection of static HTML pages. 
HTML (HyperText Markup Language) was designed by Tim Berners-Lee to allow researchers to share documents over the Internet.
These early web pages were simple and solely focused on text and hyperlinks, allowing users to navigate from one page to another.
The simplicity of HTML made it easy for anyone to create and publish content on the web.

- Browsers could send a request to a server and say hey get me that file
- Web servers were basically file servers with a network connection they didn't do anything other than giving the file back 
- Browsers would render the file, which sometimes included links to images and gifs, which the server would send them back
- it's a great idea back in the '90s for delivering content that doesn't change very often (e.g., for a restaurant menu that changes once a month you can upload a file once a month you can stick it in GitHub Pages you can put it on a Amazon S3 bucket and make that bucket public you can use a Content delivery Network)
- Static HTML is it is incredibly cheap because you don't have to do any processing all your server is doing is going yeah here's the file and that is trivial.
- You can run a site that gets thousands millions of hits for a few dollars a month using static HTML hosting, or you can run it for free on GitHub pages won't cost you anything at all

## Web Forms & Server-Side Rendering (1990s to present)

- HTML forms were invented so that users could contact us, send us a message, or buy something
- Once the form is filled, it sends a post request to a script, like the [sendmail Perl](https://metacpan.org/pod/Mail::Sendmail) that sends an email back to the client and the browser would go and say thank you back in the homepage
- This was the origin of server side rendering. There's some code on the server which runs a program or runs a script and one of the outputs of that is a chunk of HTML that then gets rendered by the browser
- Server side rendering has really stood the test of time. From CGI bin bash scripts through PHP, ASP, Ruby on Rails, nodejs, WordPress, aspnet core, if you use an MVC all of these technologies are based on server side rendering.
- It's a really powerful pattern the only downside is every time anyone hits one of your pages you need to run the code that generates the result and that can get expensive if you've got thousands of people tens of thousands hitting your site you're paying for all those Cycles you're paying for that computing power.

## Java Applets & Plugins (1990s to 2015)

- In the 90s, Java applets were going to be the future of web applications.
- The idea was including an applet object inside an HTML tag the browser out of the box would execute it.
- To do so, you need to install a plugin that will run on the server giving rich interactivity such as games, interactive forms and applications
- This patter of adding plugins to do things that browsers couldn't do out of the box was not only used by Java, but it included Shockwave, Flash, Director, Real Player, QuickTime, among others
- It had some security headaches and in 2007 Apple launched the iPhone and Apple went on record very early as saying no the iPhone is never going to run Java applets or Shockwave or Flash it's never going to run any plugins please build web applications instead using JavaScript and HTML.
- Apple's announce signed the death warrant for the whole plug-in Paradigm.

## JavaScript & XML HTTP Request (1995 to present)

- JavaScript was invented in 1995. It was originally just a glue language used to stick Java applets together.
- The applets would do all the heavy lifting. JavaScript was used to do some rudimentary tasks, like someone could fill out your contact form and then when they got down to here and they clicked submit you could run a little snippet that would go hey confirm are you sure and pop up dialogues but it was really restricted one you had to include everything in the page script.
- there was no way that clientside JavaScript could retrieve more data. It couldn't make requests, couldn't talk to the rest of the world, and there was no way of sending anything back to your client or your user is halfway through filling out a really complicated form with lots of JavaScript and everything on it. If they press refresh it's all gone completely lost their work they got to start again now.
- But everything changed with Google figured out how to use JavaScript to do autocomplete in the search form. Interestingly, the origin of this feature comes from Outlook web access in the early 2000's when they wanted a way of sending requests in the background. So they went to the developers who built Internet Explorer and asked for a component that allowed to do network requests without having to reload the page, and the Internet Explorer people said "yeah" and they plugged in a thing Called `xmlhttp request`. Outlook web access used this for a couple of years, but no one really kind of noticed because there weren't that many people using Outlook web access. And that feature was added later to Netscape and the other browsers and then Google came and used the feature every time you press a key your browser is sending a request and getting fresh suggestions every time you press a key you've got this conversation backwards and forwards going on in the background. This unlocked a 
  whole new way of building web applications now this was initially uh the XML HTTP request wasn't terribly catchy round about 2005 someone said hey why don't

## CSS (1996 to present)

[//]: # (ChatGPT)
As the web grew, so did the demand for more stylistic and dynamic websites. 
This led to the introduction of CSS (Cascading Style Sheets) in 1996, which separated content from design, allowing developers to create more visually appealing websites without altering the HTML structure.
Around the same time, JavaScript was introduced, enabling interactive elements on web pages. 
JavaScript's ability to manipulate the Document Object Model (DOM) revolutionized the user experience by allowing web pages to respond to user actions without needing to reload.
  
## SPA & AJAX (2005 to present)

- In 2005 someone said hey why don't we call it AJAX (Asynchronous JavaScript and XML) or asynchronous JSON and XML HTTP request  because a lot of the time they were using the XML HTTP request, but the thing that's coming back from the server was not  XML it would be JSON or something else (could be snippets of HTML). The Ajax pattern worked brilliantly unlocking all kinds of cool authoring paradigms.
- In about 2015 the browser vendors when we could probably come up with a nicer way of doing this so they implemented an API called `fetch` which we still use today. This ability to send background requests meant we could start building new kinds of web applications instead of your web app being a collection of pages that lived on a server.
- AJAX enabled web applications to load content dynamically. Users could now enjoy a smoother and more engaging experience that resembled desktop applications. 
- `fetch` works as follows: you send a single page app (SPA) to the client, then the client later sends a request to the backend API (something like a REST API) and it would send back some data and you swap out the part of the page with the data you plugged in. 
- SPA is a really powerful paradigm for rich client-side interactivity. However, the dead giveaway here is that one bit of the page will start spinning if there's an element somewhere which is waiting for data to come back from the server, and until it gets it can't draw anything. So, if you're ever on a web page where you click a button and a little part of the page is replaced with a spinning icon, you're looking at a single page application.
- SPA are incredible popular, many JavaScript Frameworks that came out in the last sort of 15 years favored this pattern (e.g., React, Angular).
- The term Web 2.0 emerged in the early 2000s, describing websites that were interactive and collaborative. These sites leveraged technologies like AJAX (Asynchronous JavaScript and XML), enabling web applications to load content dynamically. Users could now enjoy a smoother and more engaging experience that resembled desktop applications.
  
## WebSockets (2008 to present)

- We invented websockets to get rid of the limitations of the SPA paradigm. 
- The idea with a websocket is the browser connects to the server, and it just leaves the connection open. 
- It's a new kind of connection: lightweight and long. This means we can build chat applications, type hello there and a request is sent to the server and a message pops up.
- This is a big deal because for the first time there was a way for the server to tell the browser when something happened, allowing multiple browswers to connect concurrently to the same service, allowing realtime collaboration as in Multiplayer Online Videogames or Google Docs.  


## WebAssembly (2017 to present)

- There were a bunch of technologies that allowed to write in a programming language other that JavaScript and then transpile to JavaScript, because that's the only thing the browser was able to understand. For example, Google Web Toolkit (GWT) allowed to write Java, or more recently TypeScript.
- The problem is that when running native apps directly in a computer, you don't run them in JavaScript. You run them in native executables.
- So, they created a native runtime inside the browser called WebAssembly. 
- The premise here is you can write your app in whatever you want go Ruby rust C anything that compiles down to WebAssembly. Then a `wasm` file is published to the web server, and then the client downloads that file and execute it (there is still some JavaScript involved to bootstrap it).
- It gives rich native applications with high performance and interactivity running right there in the browser, similar to how Java Applets were doing in the 90's.
- If you got a team that wants to do stuff in Rust or C, or you need better performance. 

## Blockchain & Decentralization (2020 to present)



# Summary

- The only web technologies that are truly dead today are applets and plugins but all the rest they still solve certain kinds of problems.
- Static HTML: if you want to put a restaurant menu on the internet and change it once a month static HTML was the best way of doing that in 1992 it's still the best way of doing that in 2024
- Server Side Rendering: if you want to render a product catalog and send back HTML which works with search engines works with screen readers works with accessibility.
- XML HTTP Request and `fetch`: if you want to do minimal interactivity you just got pages where you want some autocomplete or some autos suggest.
- Websockets: if you want to do real-time notifications
- WebAssembly: if you want to deploy native web applications

# A Few Parting Thoughts...

The web is just the latest in a series in a series of oscillations that our industry has gone through since 1960s. These oscillations move back and forth between putting all the computer power in central servers and putting all the computing power out at the terminals.

We’ve seen several of these oscillations just in the last decade or so since the web became prominent. At first, we thought all the computer power would be in server farms, and the browsers would be stupid. Then we started putting applets in the browsers. But we didn’t like that, so we moved dynamic content back to the servers. But then we didn’t like that, so we invented Web 2.0 and moved lots of processing back into the browser with Ajax and JavaScript. We went so far as to create huge applications written to execute in the browsers. And now we’re all excited about pulling that JavaScript back into the server with Node…

And so the story goes. We can’t seem to figure out where we want the computing power. We go back and forth between cetralizing it and distributing it. And, I imagine, those oscillations will continue for some time to come.

[//]: # (below is an example of how to write this section properly)
There are valuable lessons to be learned from all of this -- including the need for real, meaningful support (by large corporations) of the projects they rely so heavily upon.

But, for now, I'd like to leave you with a few observations.

# Resources

- [The Evolution of Web Apps 1992-2024, by Dylan Beattie](https://youtu.be/a_1cV7hg5G8?si=VIaAQnfTyR9nuUdc)
- [How We Got Here - The History of Web Development, by Richard Campbell](https://youtu.be/41mnNyMxPOA?si=9NVNYd9jyopvFaXj)

# Footnotes

[^1]: BTW, my sincere appreciation to the frontend and UI devs. What you guys do in the trenches is really hard. I ~~probably~~ never would be able to make a decent living as a frontend.  


