---
layout: post
title:  Enhance your README with asciinema
subtitle: How to create beautiful terminal recordings that your users will love
tags: tools
published: true
image: https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/posts/asciinema.png
share-img: https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/posts/asciinema.png
show-avatar: false
date: 2021/4/5
---


[Asciinema](https://asciinema.org/) is an excellent tool for recording and sharing terminal sessions. 
The project is open-source and [available on GitHub](https://github.com/asciinema/asciinema).
A key feature of asciinema is that it allows the viewer to copy-paste the text from the player itself directly. 
The result of a terminal recording is an editable text file with extension `.rec`. 
This file can be easily [shared and embedded](https://asciinema.org/docs/embedding) on any website. 
However, markdown does not support rendering asciinema recordings.
Therefore, you will need to transform your asciinema recording into something that markdown can handle, such as `.gif` files.
This post will show you step-by-step how to use asciinema to generate beautiful terminal recordings to enhance `README.md` files.

First, let's see the help page of asciinema using the wonderful [tldr](https://github.com/tldr-pages/tldr) project:

<link rel="stylesheet" type="text/css" href="../css/asciinema-player.css" />
<script src="../js/asciinema-player.js"></script>
<asciinema-player src="../asciinema/tldr_asciinema.rec" poster="npt:00:12" start-at="3"></asciinema-player>

# Recording a terminal session

To install asciinema, follow [the official guide](https://asciinema.org/docs/installation).
Once you have it installed, you can start recording a terminal session using the following command:

{% highlight shell linenos %}
asciinema rec demo.cast
{% endhighlight %}

The previous command will create a recording file named `demo.cast`, which you can replay directly in the terminal as follows:

{% highlight shell linenos %}
asciinema play demo.cast
{% endhighlight %}

# Insert the recording in a README

Now that you have your session recorded, you need to transform the `demo.cast` into a  `.gif` file, which can be inserted in your `README.md`.
To do so, the [asciicast2gif](https://github.com/asciinema/asciicast2gif) tool comes handy. 
It allows to generate a `.gif` files from `.cast` asciinema recordings.
To install asciicast2gif using npm run the following command:

{% highlight shell linenos %}
npm install --global asciicast2gif
{% endhighlight %}

**Note:** For asciicast2gif to work, you also need have [ImageMagic](http://www.imagemagick.org/) installed on your system.

Once asciicast2gif is installed, make the file transformation as follows:

{% highlight shell linenos %}
asciicast2gif -w 80 -h 30 demo.cast demo.gif
{% endhighlight %}

The previous command will produce a `demo.gif` file with 80 characters width and 30 lines of height. 
It can be inserted in `README.md`, just as any other image: 

{% highlight markdown linenos %}
![demo](PATH_TO_FILE)
{% endhighlight %}

where `PATH_TO_FILE` is the path to your `demo.gif` file on GitHub.

I have used this method to add a terminal screencast in the `README.md` of [DepClean](https://github.com/castor-software/depclean) (one of my tools), so that the users can easily grasp its basic usage.

# Insert the recording in a website

To use asciinema on the browser, use the [asciinema-player](https://github.com/asciinema/asciinema-player).
You will need `asciinema-player.css` and `asciinema-player.js`. You can download the latest version of these files [here](https://github.com/asciinema/asciinema-player/releases).
Then, use these files from page as follows:

{% highlight html linenos %}
<html>
<head>
  ...
  <link rel="stylesheet" type="text/css" href="/asciinema-player.css" />
  ...
</head>
<body>
  ...
  <asciinema-player src="/demo.cast"></asciinema-player>
  ...
  <script src="/asciinema-player.js"></script>
</body>
</html>
{% endhighlight %}

This will embed a player similar to the one presented in this post.
