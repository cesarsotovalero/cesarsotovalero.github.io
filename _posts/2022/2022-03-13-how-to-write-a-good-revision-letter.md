---
layout: post
title: How to Write a Good Revision Letter
subtitle: My system to address major revisions and get my papers accepted
tags: research
description: Dealing with a major revision is a challenging process in the life of doctoral students. In this post, I share my personal system and some useful resources that may help you to navigate the academic revision process with panache.
keywords:
  - PhD career,
  - research paper,
  - computer science,
  - major revision,
  - minor revision,
  - academic journal
image: ../img/posts/2022/ring_cover.jpg
share-img: ../img/posts/2022/ring_cover.jpg
show-avatar: false
toc: true
date: 2022/03/13
author: cesarsotovalero
published: true
--- 

I just finished a **major revision** for one of my research papers.[^1]
It was a lot of work, as usual.
Writing a response letter for the editor and reviewers is always a challenging process.
After receiving the editor's decision, I had to put aside what I'm working on at the moment and focus on the revision.
That's the only way to prepare a **good revision letter**.
One that maximizes the chances of getting the paper accepted, finally.
So, I want to seize this time of relief (I just sent the revision letter, hurrah!) to write a blog post sharing my insights.
Along the time, there are many things that I've learned about academic papers' revisions.
After reading this post, you will know my system and acquire some useful resources, which I've perfected and battle-tested during the last years.
I hope that this post will help you navigate your major revision with panache.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/ring.jpg alt:"The academic revision process: an attempt to achieve perfection for the best of science" %}
  <figcaption class="stroke"> 
    &#169; The ring: a symbol of perfection. The academic revision process: an attempt to achieve perfection for the best of science. Photo from <a href="https://goo.gl/maps/7zbzJLFVGVWHXAL78">Finlandsparken</a>.
  </figcaption>
</figure>

# The Revision Process

You submitted your precious paper to an academic journal and clicked the magic “submit” button.
A few days after that, an associate editor is designed to handle your submission.
The editor then chooses two or three ~~expert~~ reviewers who will bring comments and suggestions about the paper.

In some editorial management systems the reviewers will give direct recommendations regarding your paper's fate. 
For most prestigious journals, the revision is typically done in a time period between three and six months.

Depending on the output of the reviewers, the editor has to take a decision on whether to accept the paper or not.
Often happens that the paper has some potential for acceptance but there are still significant concerns from the reviewers' side.
In this case, the editor decides to go into a **revision round** before acceptance.

Either way, you will receive an official decision from the editor containing all the reviewer's comments.
There are four different possible decisions from the editor:

- **Accept:** There's nothing to do on your side here. This very positive first response ~~almost~~ never happen in practice.
- **Reject:** There's nothing to do on your side here. Collect the reviewers' feedback, improve the paper and resubmit to another journal. It happens in approximately 40% of submissions.
- **Minor revision:** The paper is almost accepted. Only a few minor changes or clarifications are needed. Receiving this output from good journals is very rare. It happens in less than 10% of submissions.
- **Major revision:** The paper could be accepted after some significant changes. This means it's going to be a second round of revision. This is the most common output from good journals. It happens in approximately 50% of submissions.

The whole process looks as follows:

[//]: # (see https://mermaid-js.github.io)
{% mermaid %}
flowchart TB;
a([Submit Research Paper]) --> x[Editor Receives the Paper]
x[Editor Receives the Paper] --> y[Reviewers Receive the Paper]
y[Reviewers Receive the Paper] --> z[Editor Receives the Reviewers' Comments]
z[Editor Receives the Reviewers' Comments] --> b{What's The Editor's Decision?}
b -- Accept --> c([Celebrate!])
b -- Reject --> a([Submit Research Paper])
b -- Minor Revision --> d[Prepare Response Letter]
b -- Major Revision --> d[Prepare Response Letter]
d[Prepare Response Letter] --> e[Sent Response Letter]
e[Sent Response Letter] --> b{What's The Editor's Decision?}
{% endmermaid %}

The rest of this post focuses on addressing a major revision decision, which is the most likely positive output that you can receive, according to my experience.

# Overcome the First Impression

Let's face it: accepting harch criticism is not easy sometimes.
And some ~~bad~~ reviewers could write aggressive comments.
But no matter what, you should know that a major revision is actually a very good output.
It's an opportunity to get your paper accepted, finally!


<aside class="quote">
    <em>“After receiving a major revision, put it aside for a few days to cold down the first impression.”</em>
</aside>

I recommend you to read the whole letter from the editor a couple of times and put is aside for a few days.
The idea is to cold-down your initial (often negative) impression about the response.
Remember that you have some time, usually between one and three months, to prepare the response letter.

# Preparing the Response Letter

A few days after receiving the response, you'll probably feel more positive regarding the paper outcome.
The next step is filling a **revision letter template** with all the reviewers' comments.
It is also a good idea to set a schedule and mark a deadline in your calendar to handle the revision.
This is important because you probably have to set aside whatever you're doing.
A major revision is an excellent chance to get the paper done, so don't take risks and work seriously on the revision.

Do not reinvent the wheel: use a template to add the comments from the editor and reviewers.
You'll write your responses in that document.
It should look professional.
I recommend using LaTeX.
You can download my revision letter template below:

<div class="link_button centered">
  <a class="btn btn-success" href="../files/posts/2022/Revision_Letter_Template.tex">
  <i class="fa fa-download" style="font-size:28px;color:white"></i> 
  Revision Letter Template (.tex)</a>
</div>

The first page of the revision letter should address the editor.
Make sure to put the submission identifier of your paper on top of this page.[^2]
This facilitates editorial work when tracking your paper.

Also, on the first page, include a bullet list summarizing the significant changes made in the paper.
I recommend using passive voice tense, indicating concrete improvements made in the paper.
For example, “We have added ...”, “We have edited ...”, “We have modified ...”, etc.
I recommend you to provide direct references here to each major comment from the reviewers addressed in the text.
For example, “We have added a new Section X with the implementation details of Foo (Asked by R1 in Comment 1.3).”

The rest of the revision letter addresses the reviewers.
Decompose **all** the reviewer's comments (some reviewers write large paragraphs including several comments) and write them one by one.
Each comment should have a unique number.
For example, `R1 Comment 1.2` and so on.
Once you have set every question or concern, you can then address them.

# Identify the Major Changes

A major revision means that the reviewers expect **major changes** to be made in the paper.
I would say that you should make sure to include at least three major changes.
Sometimes is difficult to recognize the difference between major and minor changes.
The following are examples of major changes and what there are not.

A major change **is**:

- A new experiment
- A new section discussing a particular result
- A new research question
- A comparison with the state-of-the-art

A major change **is not**:

- Adding more examples
- Improving the readability of a section
- Adding more references
- Fixing some typos

I recommend starting with the minor changes first (usually typos and minor corrections).
Then move forward and address the major changes one-by-one. 

# Address the Major Changes

The major changes are the core of the revision letter.
It typically involves carrying on a lot of work.
There is no workaround here.
Don't evade the nasty comments from the reviewers.
Accept them.


<aside class="quote">
    <em>“Major changes <del>should</del> must significantly improve the quality of your paper..”</em>
</aside>


I suggest adding figures and tables directly in the revision letter (as a gift for the reviewers) explaining the major changes in the paper.
For example, if you carried out a new experiment and collected new data, add a figure in the revision letter showing the data collection pipeline. 
Be sure to include appropriate additional references in the revision letter when necessary.

After you're done, set the response letter aside for a few days.
Send it to your research colleagues and ask for feedback.
Then go back to it with fresh eyes, and improve it as much as you can.

# Examples

As you may already notice, there is a lot of work being done during the revision stage, way before accepting each research paper.
However, I've noticed that researchers typically don't disclose their revision documents.
Maybe some researchers are afraid of showing the weaknesses of their research.
All this work is lost somewhere on the way, and at the end only the flawless published paper is promoted and shared.

I strongly believe that openness is overall healthy for science.
Below you can look at some examples of my revision letters for two consecutive major revisions I've done for paper that I published in a prestigious [software engineering journal](https://www.springer.com/journal/10664?gclid=CjwKCAjwsJ6TBhAIEiwAfl4TWBPJ7dgGi8fJhYX4kuqrVXciYhV0YTKriqi0NIWjEPv-M84TakNV5BoCz1wQAvD_BwE).
Hopefully, this will give you a notion of the amount of work being put along the revision process.


| Published Research Paper                                                                                                                                   | Revision Letter                                                                                                                                               |
|------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A Comprehensive Study of Bloated Dependencies in the Maven Ecosystem<br/>[:earth_americas: Link](https://link.springer.com/article/10.1007/s10664-020-09914-8) | [Major Revision #1](../files/posts/2022/DepClean_Major_Revision_Round_1.pdf)<br/>[Major Revision #2](../files/posts/2022/DepClean_Major_Revision_Round_2.pdf) |
| Coverage-Based Debloating for Java Bytecode<br/>[:earth_americas: Link](https://dl.acm.org/doi/10.1145/3546948)                                                                       | [Major Revision #1](../files/posts/2022/JDBL_Major_Revision_Round_1.pdf)<br/>[Minor Revision #2](../files/posts/2022/JDBL_Minor_Revision_Round_2.pdf)     |


# Conclusion

<aside class="quote">
    <em>“Persevere, consolidate, and it goes though.” ― Benoit Baudry</em>
</aside>

Dealing with major revisions is part of the academic business.
Researchers spend a lot of time and effort preparing response letters for reviewers.
All these effort results in better papers, and better science after all.
I've dealt with many major revisions, and preparing the revision letter is always a lot of necessary work.
If you just received a response for your submission, then don't panic and follow my system and template.
I assure you that it works in most cases.[^3]


# Footnotes

[^1]: You can read the full paper [here](https://arxiv.org/abs/2008.08401) if you're interested.

[^2]: Most editorial systems assign a unique identifier to each paper after submission.

[^3]: Indeed, my system has worked very well: 100% of success so far 😄. 