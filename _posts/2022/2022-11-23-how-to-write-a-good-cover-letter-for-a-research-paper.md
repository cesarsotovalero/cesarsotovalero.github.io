---
layout: post
title: How to Write a Good Cover Letter for a Research Paper 
subtitle: Quick an easy
tags: science
description: It's a common practice in academic journals to ask authors to write a short cover letter to the editor. In this post, I share my experience writing cover letters for academic journals, along with useful tricks and tips that I've found along the way.
keywords:
  - PhD career,
  - research paper,
  - computer science,
  - paper submission,
  - academic journal
image: ../img/posts/2022/knowledge_cover.jpg
share-img: ../img/posts/2022/knowledge_cover.jpg
show-avatar: false
toc: true
date: 2022/11/23
author: cesarsotovalero
published: true
--- 

Submitting a research paper is probably one of the most happy moments in the working ~~life~~ career of PhD students.
You've been dealing with a research paper for months, maybe years.
And you know, clicking that "submit" button represents such a moment of relief.
You just want it to be finally done, moving on to the next project and so on.
But, wait a minute.
The submission system claims you to do one more thing: a **cover letter for the editor!**
Is the the paper not enough?
What is that?
Let me tell you.
It's a common practice in academic journals to ask authors to write a short cover letter to the editor.
In this post, I share my experience writing cover letters for academic journals, along with useful tricks and tips that I've found along the way.
I hope this will help you write a good cover letter without hassle.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/knowledge.jpg alt:"The academic revision process: an attempt to achieve perfection for the best of science" %}
  <figcaption class="stroke"> 
    &#169; Cover letters: are they really necessary? Photo from <a href="https://goo.gl/maps/vvZbf1x9hhrxdyaA6">Universitetet metro station</a>.
  </figcaption>
</figure>

# What Makes a Cover Letter Excellent?

> "A cover letter is your opportunity to make a great first impression on the journal editors who will be considering your research paper. 
> It is your chance to show that you understand the focus and scope of the journal, that your research is a good fit for it, and that your paper is of high quality and relevance."

In short, a good paper cover letter is a document that has:

- A good structure.
- A short and concise writing style.
- One page and it is made with LaTeX.[^1]

# Structure

I suggest the following elements to conform the body of the cover letter for a research paper:

1. **A disclosure paragraph**: This paragraph should disclose any potential conflict of interest. It should also contain a claim mentioning that the paper is original and has not been published elsewhere. If the paper is submitted to an special issue, it should also be mentioned here.
2. **A clear novelty claim**: This paragraph should clearly state the novelty of the paper. Summarize the methodological and technical contributions, as well as key results (a single number is perfect).
3. **A list of contributions**: This list summarizes the main contributions of the paper. Make it short and concise.
4. **A list of suggested editors**: This list makes it easy for the Editor in Chief to find the right editor for your paper. Suggest relevant editors and make sure to briefly argument your suggestion based on their individual expertise.

# Style

<aside class="quote">
    <em>“Good style is the most important factor in determining the success of a scientific paper.”</em>
</aside>

Here are a couple of additional **tips** regarding the style of the cover letter:

- Use short and concise writing style (avoid giving too much context).
- Write in the first person (from the perpective of the first author) and use present tense.

The following are non-obvious **don'ts** for a cover letter:

- Don't over sell the contributions of the paper. For example, don't say: "This paper is a breakthrough in the field of X", instead say: "This paper makes a significant contribution to the field of X".
- Don't include references, figures, or tables (footnotes are OK). 
- Don't repeat the same information written in the paper's abstract.  

# My LaTeX Template

I've created a LaTeX template for writing cover letters for research papers.
The template has the look and feeling of the [newlfm](https://ctan.org/pkg/newlfm) LaTeX package (not updated since 2009), but it uses modern packages.

Here's a screenshot of the resulting PDF file:

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/paper_cover_letter.png alt:"Overview of the template." %}
  <figcaption class="stroke"> 
    Overview of my paper cover template (downloadable <code>.tex</code>> file below).
  </figcaption>
</figure>

Here is the link to the template:

<div class="link_button centered">
  <a class="btn btn-success" href="../files/posts/2022/Paper_Cover_Letter_Template.tex">
  <i class="fa fa-download" style="font-size:28px;color:white"></i> 
  Research Paper Cover Letter Template (.tex)</a>
</div>

To use the template, you only need to fill in the following LaTeX macros:

{% highlight latex linenos %}
%----------------------------------------------------------------------------------------
%	YOU ONLY NEED TO FILL IN THE FOLLOWING LATEX MACROS
%----------------------------------------------------------------------------------------

% Title of the paper
\newcommand{\PaperTitle}{Paper's Title\xspace}

% Full name of the authors
\newcommand{\AuthorOne}{Author \#1\xspace}
\newcommand{\AuthorTwo}{Author \#2\xspace}
\newcommand{\AuthorThree}{Author \#3\xspace}
\newcommand{\AuthorFour}{Author \#4\xspace}

% Institution
\newcommand{\Institution}{Institution of the Authors\xspace}
\newcommand{\InstitutionAddress}{Institution Address\xspace}
\newcommand{\City}{City\xspace}
\newcommand{\Country}{Country\xspace}

% Full name of the Journal's Editor in Chief
\newcommand{\EditorInChief}{Name of Editor in Chief\xspace}

% Journal
\newcommand{\Journal}{Name of the Journal\xspace}

% Body
\newcommand{\Contribution}{X\xspace}
\newcommand{\Problem}{Y\xspace}
\newcommand{\Solution}{Z\xspace}
\newcommand{\Evaluation}{D\xspace}
\newcommand{\NoveltyClaim}{E\xspace}

% List of contributions
\newcommand{\ContributionOne}{Contribution A.\xspace}
\newcommand{\ContributionTwo}{Contribution B.\xspace}
\newcommand{\ContributionThree}{Contribution C.\xspace}
\newcommand{\ContributionFour}{Contribution D.\xspace}

% Suggested editors
\newcommand{\EditorOne}{Editor \#1\xspace}
\newcommand{\EditorOneExpertise}{A\xspace}

\newcommand{\EditorTwo}{Editor \#2\xspace}
\newcommand{\EditorTwoExpertise}{B\xspace}

\newcommand{\EditorThree}{Editor \#3\xspace}
\newcommand{\EditorThreeExpertise}{C\xspace}
{% endhighlight %}

Note that the date is autogenerated using the `\today` macro.

# Examples

As with [revision letters](../blog/how-to-write-a-good-revision-letter.html), researchers typically don't disclose their cover letters.
I guess that this is because they are considered as a second class citizen by the scientific community.
When compared to the paper, the cover letter is us a formality.
The effort put into them most of the time goes to waste, and only the final flawless version of the paper that is published and shared receives recognition.

Below you can look at some examples of my cover letters, corresponding to papers published in prestigious [software engineering journal](https://www.springer.com/journal/10664?gclid=CjwKCAjwsJ6TBhAIEiwAfl4TWBPJ7dgGi8fJhYX4kuqrVXciYhV0YTKriqi0NIWjEPv-M84TakNV5BoCz1wQAvD_BwE).
Hopefully, this will give you some inspiration.

| Published Research Paper                                                                                                                                       | Paper Cover Letter                                       |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| **A Comprehensive Study of Bloated Dependencies in the Maven Ecosystem** [:earth_americas: Link](https://link.springer.com/article/10.1007/s10664-020-09914-8) | [PDF](../files/posts/2022/DepClean_Cover_Letter.pdf)     |
| **Coverage-Based Debloating for Java Bytecode** [:earth_americas: Link](https://dl.acm.org/doi/10.1145/3546948)                                                | [PDF](../files/posts/2022/JDBL_Cover_Letter.pdf)         |
| **The Multibillion Dollar Software Supply Chain of Ethereum** [:earth_americas: Link](https://ieeexplore.ieee.org/document/9903894)                            | [PDF](../files/posts/2022/Multibillion_Cover_Letter.pdf) |


# Conclusion

Crafting effective cover letters is a critical aspect of academic communication.
PhD students invest time and energy in drafting cover letters that reflect the quality of the submitted research papers.
As with job seeking cover letters, the goal is to convince the editor that the paper is worth going into the revision process.
As someone who has made numerous cover letter, I developed my own structure and use a template which I share in this post.
If you have to prepare one, don't be discouraged; by following my clear system and template, you can produce a compelling and persuasive letter that increases your chances of success (without spending too much time into it).


# Footnotes

[^1]: You may disagree with me in this regards, however, all serious researchers know that LaTeX is the best tool for preparing professional documents.