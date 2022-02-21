---
layout: post
title: Use Custom LaTeX Macros to Boost Your Writing Productivity
subtitle: Forget About the Annoying Numerical Glitches in your Document 
tags: latex tutorial
description: LaTeX macros allow increasing productivity by avoiding typing repetitive LaTeX commands. In this tutorial, I show you how to use them.
published: true
keywords: latex, macros, productivity, tutorials
image: ../img/posts/2021/snail_cover.jpg
share-img: ../img/posts/2021/snail_cover.jpg
toc: true
show-avatar: false
author: cesarsotovalero
date: 2021/5/28
---

If you ever use [LaTeX](https://en.wikipedia.org/wiki/LaTeX) to write your research papers or technical reports, then you should know how useful and powerful this tool is. 
Let me just mention three well-known benefits of using LaTeX: 1) beautiful typeset output (especially when dealing with mathematical notations); 2) consistent handling of references and bibliography (thanks to [BibTeX](http://www.bibtex.org/); 3) separation of content and style, meaning that all you need to write is plain text (also true for tables and figures, thanks to [TikZ](https://en.wikipedia.org/wiki/PGF/TikZ)).
LaTeX has a powerful markup language for document creation. 
One of the best and often misleading advantages of using this language is that it allows the creation of [custom macros](https://en.wikibooks.org/wiki/LaTeX/Macros).
These are user-defined commands that allows avoiding typing repetitive LaTeX commands (e.g., formatting strings or numbers) and even perform live computations (e.g., calculating numeric expression). 
Let me show you how it works!

<figure class="jb_picture">
  {% responsive_image path: img/posts/2021/snail.jpg alt: "A slow snail crawling at Djurgården in Stockholm (he doesn't use LaTeX macros)" %}
  <figcaption class="stroke">
    &#169; A slow snail crawling at Djurgården in Stockholm (he doesn't use LaTeX macros)
    </figcaption>
</figure>

# Creating a Simple User Custom Command

To add a custom command in your document, use `\newcommand{\name}[num]{definition}`. 
The following commands are examples that allow simplifying the use of some common English abbreviations:

{% highlight latex linenos %}
% Load required package

\usepackage{xspace}

% Create custom user defined commands

\newcommand{\ie}{i.e.\@\xspace}
\newcommand{\aka}{a.k.a.\@\xspace}
\newcommand{\eg}{e.g.\@\xspace}
\newcommand{\etal}{et al.\@\xspace}
\newcommand{\wrt}{w.r.t.\@\xspace}
{% endhighlight %}

Once added in your document, you just need to type `\ie` and the text `i.e.` will be printed in your document.
Note that you need to use `\@\xspace` to indicate that a white space follows the displayed text.  

# Inserting Author Notes

I often find very useful defining the `\cesar` and `\todo` commands in all my documents to create quick author notes and remarks in my documents.  The following code defines these commands, which are very useful when inserting notes (e.g., `\cesar{refine this sentence}`): 

{% highlight latex linenos %}
% Load required packages
{% raw %}
\usepackage{xspace}
\usepackage{ifthen}
\usepackage[T1]{fontenc}
\usepackage{xcolor}
\usepackage{amsmath,amssymb}
\usepackage[inline]{enumitem}
{% endraw %}
% Code for creating comments
{% raw %}
\newboolean{showcomments}
\setboolean{showcomments}{true}
\ifthenelse{\boolean{showcomments}}
{\newcommand{\mynote}[2]{
  \fbox{\bfseries\sffamily\scriptsize#1}
  {\small
  $\blacktriangleright$
  \textsf{\textcolor{red}{{\em #2}\bf}}
  $\blacktriangleleft$}}
}
{% endraw %}
% Create custom user defined command for author notes
{% raw %}
\newcommand{
  \cesar}[1]{\mynote{Cesar}{#1}
}
{% endraw %}
% Create custom user defined command for `TODO` notes
{% raw %}
\newcommand*\badge[1]{
  \colorbox{red}{\color{white}#1}
}
\newcommand{\todo}[1]{
  \noindent\textbf{\badge{TODO}} {\color{red}#1}
  \GenericWarning{}{LaTeX Warning: TODO: #1}
}
{% endraw %}
{% endhighlight %}

For example, the `\cesar{An author note}` produces <img src="../img/posts/2021/authornote.png" height="18" border="0" alt="Comand">, whereas `\todo{A todo note}` produces <img src="../img/posts/2021/todonote.png" height="18" border="0" alt="Comand">.

# Formatting Numbers

You can use the `numprint` and `fp` packages to create your own commands to format numeric values. 
The following example creates a `\np` command to print numeric values in math mode, nicely formatted, and rounded by two decimal digits.

{% highlight latex linenos %}
% Load required packages

\usepackage{xspace}
\usepackage{fp}
\usepackage[autolanguage]{numprint}

% Create custom user defined command for author notes
{% raw %}
\newcommand*\np[2][z]{
  %\textcolor{red}{
  \ifx z#1
    \nprounddigits{2}$\numprint{#2}$
  \else
    \nprounddigits{2}$\numprint[#1]{#2}$
  \fi\xspace
}
{% endraw %}
{% endhighlight %}

Now, for example, you can use `\np{22.324}` to print `22.32`, or `\np{22.324}{\%}` to print `22.32%`. 

# Computing Numbers

You can create numeric variables using `\def`.
This is very handy since you can keep all the values in your document in the same place.
Furthermore, you can use `\FPeval` to compute values based on these variables.
With `\FPeval`, your document will lively update every time you update some value.
The following is a basic example:

{% highlight latex linenos %}
\def\nbX{42}
\def\nbY{42}
\FPeval{nbSum}{round(\nbX + \nbY, 0)}
{% endhighlight %}

In this example, using `\nbSum` prints the value `84` in the document.

# Handling Percentages

If you use percentages in your document, you can calculate a percentage directly based on two variables: a number and the total. The following `\ShowPercentage` command calculates rates based on two variables.

{% highlight latex linenos %}
% Load required packages

\usepackage{xspace}
\usepackage{fp}
\usepackage[autolanguage]{numprint}

% Create custom user defined command for author notes
{% raw %}
\newcommand{\ShowPercentage}[2]{
  \FPeval\percentage{round(#1/#2*100,0)}
  \FPeval\percentageOneDecimal{round(#1/#2*100,2)}
  \ifnum \percentage=0
    {\np[\%]{0}}
  \else
    \ifnum \percentage<1
      {$<$\np[\%]{0.1}}
    \else
      {\np[\%]{\FPprint{percentageOneDecimal}}}
    \fi
  \fi
  \xspace
}
{% endraw %}
{% endhighlight %}

For example, `\ShowPercentage{1221}{20023}` prints `6.10%`. 
Note that a percentage rounded to 0 will be presented as `<1%`

# Embedding Small Barcharts

A nice way to compare percentages in a graphical manner (especially in tables), is by embedding small barchart plots within them. The following `\ChartSmall` commands does the trick for you:  

{% highlight latex linenos %}
% Load required packages

\usepackage{xspace}
\usepackage{fp}
\usepackage[autolanguage]{numprint}
\usepackage{xcolor}

% Create custom user defined command for author notes
{% raw %}
\newlength\BARSIZE \setlength\BARSIZE{0.5cm}
\newcommand{\inlinechart}[2]{
  \FPeval{\BLACKBARSIZE}{#1/#2}\textcolor{black!80}{\rule{\BLACKBARSIZE\BARSIZE}{1.6ex}}
  \FPeval{\BLACKBARSIZE}{1 - (#1/#2)}\textcolor{black!10}{\rule{\BLACKBARSIZE\BARSIZE}{1.6ex}}
}
\newcommand*\ChartSmall[3][v]{
  \ifx q#1
    \np{#2}/\np{#3}(\ShowPercentage{#2}{#3})
  \else
    \ifx p#1
      \np{#2}(\ShowPercentage{#2}{#3})\else
    \ifx c#1
      \inlinechart{#2}{#3}
    \else
      \np{#2}
    \ifx r#1
      /\np{#3}
  \fi
  \hspace*{0.5ex}(\ShowPercentage{#2}{#3})
  \inlinechart{#2}{#3}
  \xspace
\fi\fi\fi
}
{% endraw %}
{% endhighlight %}

Note that you can use this command in three different flavors:
- `\ChartSmall[x]{80}{155}` produces <img src="../img/posts/2021/smallshart1.png" height="18" border="0" alt="Comand">
- `\ChartSmall[q]{80}{155}` produces <img src="../img/posts/2021/smallshart2.png" height="20" border="0" alt="Comand">
- `\ChartSmall[p]{80}{155}` produces <img src="../img/posts/2021/smallshart3.png" height="20" border="0" alt="Comand">

# Conclusion

LaTeX is not only an awesome tool to create beautiful documents.
It also provides packages to format and compute numeric values as variables.
I've used all the custom commands presented in this post to ease the writing process of [my research papers](https://www.cesarsotovalero.net/publications)
Since then, dealing with numeric values and percentages has never been easier. 
