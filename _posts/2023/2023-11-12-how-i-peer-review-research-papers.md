---
layout: post
title: How I Peer Review Research Papers
subtitle: My reviewer's flow, template, and tips
tags: science
description: |
  In this blog post, I share my experiences and personal approach when peer-reviewing research papers in the field of software engineering. My focus is on delivering good peer reviews, fast and effectively. I give my template and provide generalizable examples of good and bad reviews. After reading this post, as a reviewer, you will gain first-hand insight on how to give constructive feedback to paper's authors so that they could improve the quality of their research papers.
keywords:
  - peer review
  - research papers
  - software engineering research
  - academic publishing
  - scholarly communication
image: ../img/posts/2023/2023-11-12/dansmuseet_cover.png
share-img: ../img/posts/2023/2023-11-12/dansmuseet_cover.png
show-avatar: false
toc: true
mathjax: false
date: 2023/11/12
author: cesarsotovalero
published: true
---

In the academic circles, [peer reviewing](https://en.wikipedia.org/wiki/Scholarly_peer_review) is the act of assessing the quality of a research paper and determine if it's worth it to be published in a journals or conference.
Peer reviewers are supposed to be (human) experts in the field, and their opinions have direct influence on the final decision taken by the associated editor regarding accepting or rejecting a paper submission.
During the last years, [I've peer-reviewed](../service/#peer-reviews) more than 10 research papers in top journals and conferences, mostly within the fields of Software Engineering, Applied Machine Learning, and Sports Sciences.
I've also played on the other side of the fence, submitting [my own papers](../publications.html) to similar venues and getting all kinds of positive and negative peer reviews.
This dual perspective has broadened my knowledge about the peer review process, bringing insights on its challenges and importance to the academic community.
Specifically, I have noticed a large variance of quality in many of the reviews I've had the chance to see.
Overall, I believe the general quality of reviews is poor.[^4]
In this post, I share my personal approach when peer-reviewing research papers. 
My focus is on following a methodology to deliver a decent peer review within a reasonably amount of time, i.e., fast and effectively.
Whether you're new to peer reviewing or looking to refine your approach, you'll ~~probably~~ find practical tips on providing constructive feedback to authors so that they could enhance the quality of their papers.

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "0px solid #808080" path: img/posts/2023/2023-11-12/dansmuseet.jpg alt: "Reviews are a matter of personal taste." %}
  <figcaption class="stroke"> 
    &#169; Looks like, at the end, beauty and tidiness are a matter of personal taste. Photo taken at the <a href="https://maps.app.goo.gl/k3aDzTu7VhFGibBG9">Dansmuseet</a>, in Stockholm, Sweden.
  </figcaption>
</figure> 

# Understanding

First, I would like to emphasize the fact that peer reviews represent personal opinions regarding the quality and merits of a research paper.
As such, personal opinions could appear biased, contradictory, or even stupid (I've seen the later several times).
The history of science is full of [examples](https://www.sciencealert.com/these-8-papers-were-rejected-before-going-on-to-win-the-nobel-prize) of really awesome papers that were initially rejected by academic reviewers.[^2]
 Nevertheless, the peer review process seems to be the less terrible method that the scientific community has come up with (so far) to judge the quality of science.
Having said that, let's accept its imperfections and focus on what can we to to making it better.

# What I Look For?

When receiving an invitation to review a research paper, I first download the PDF and skim through it.
I don't read anything other than the title and maybe abstract.
I decide to accept reviewing it only based on the presentation (i.e., if has readable figures, written in LaTeX, acceptable size).
I trust that the editor has done a good job at determining if the paper is worth reviewing.

Once I decided to accept the review, I go through a two steps process: 1) First Glance Review and 2) Detailed Review.
In the next sections, I describe what I look for in each of these steps.

## Quick Review

<aside class="quote">
    <em>“I spot a poorly written paper in 5 minutes or less. When this happens, I know the paper has really no chances to get accepted.”</em> 
</aside>

First, I print the paper just to confirm that it looks good.
A good paper always "feels" nice on paper.
Once printed, I search for a clear novelty claim statement.
The novelty claim is written somewhere in the introduction section, and it should be generally easy to spot.
It reads like this: "_In this paper, we propose a new method `X` to solve the problem `Y`_".
In software engineering, it's also common to find a summary of contributions as a list of bullet points, something like this: "_The contributions of this paper are as follows: `X`, `Y`, and `Z`_".
If I don't find a clear novelty claim, or list of contributions at the end of the introduction section, then it's a red flag and I start doubting the paper.
As a reviewer, I don't want to squeeze my brain to figure out what the paper is all about.

> "The number one reason for me to reject a paper is novelty. The second one has to do with presentation. From the author's perspective, it's very challenging to "fix" the novelty issue, but there is a lot that can be done to improve presentation. For example, adding real world examples, improving the figures, making the paper more clear and readable, fixing incomplete sections, etc."

Second, I try to answer myself the following questions in order:

1. Do I understand the paper after reading the title and abstract? I assume I should not be an expert in the field to understand the key contribution.
2. Is the paper beautiful? For me, beautiful means written in LaTex, with clear structure, high-quality (vectorial) figures, well-formatted tables, right amount of references, and a good balance between text and other visual elements.
3. Does it include a link to a GitHub repository or raw dataset?  Reproducibility is key. I do `⌘ F` or `Ctrl F` and search for `http` hyperlinks.

If the answer to all the previous questions is "Yes!", then I start to look at the paper with good eyes and focus on helping the authors to get it through.[^3]
If my answer to all of them is "No", then I just focus on providing proofs to the editor that the paper is not worth publishing.
In any case, then it comes a more detailed review.

## Detailed Review

<aside class="quote">
    <em>“I think the key to make good review is asking direct questions to the authors regarding specific sections of the paper.”</em> 
</aside>

The detailed review is the most time-consuming part of the process.
I try self-imposed a time frame of 2 hours to complete it.
My main goal here is to provide constructive feedback to the authors (if the paper is good), or to make clear to the editor that the paper should not be published (if the paper is bad).

I use the following checklist to guide my review:

- [ ] I think that the idea is novel (not done before), it identifies and fills a knowledge gap.
- [ ] I understand the contributions of the paper after reading the introduction. 
- [ ] I find the research questions well-defined, relevant and meaningful. 
- [ ] I believe the methodology is rigorous and performed to a high technical standard.
- [ ] I agree that the conclusions are well backed and linked to original research questions.
- [ ] I identify the citations are appropriate and relevant.
- [ ] I enjoy reading the paper because it's well written, clear, and easy to follow.

If I can check all the boxes, then I would most likely recommend the paper for acceptance.
Otherwise, I'm very sceptical about it and start thinking on the arguments to justify my recommendation to reject it.

# Bad vs. Good Reviews 

<aside class="quote">
    <em>“I've seen that, in general, the better the journal the better the submitted papers.”</em> 
</aside>

Bad reviews are those that are vague, unhelpful, generic.
Counterintuitively, I find bad papers the easiest to review because there a so many things to criticize.
Good papers, on the other hand, require more work to review because I need to be more creative in finding ways to improve them.
In the following sections, I provide examples of good and bad reviews, and I explain what makes them good or bad.

## Bad Reviews

Here are some (not so obvious) characteristics of bad reviews:

- The reviewer clearly didn't read the paper at all and throws a general chunk of generic text (this happens more often than you think).
- The review is vague and negatively opinionated. For example: "The paper is not good. The authors should have done a better job." How? What specifically should they have done differently?
- They don't help to make the paper any better: Figure 3 is not clear. Why? How can it be improved?
- They are destructive. For example: "This paper makes no sense".
 
Here's a real example of a bad review from one of the co-reviewers of one of the papers I've reviewed:

{% highlight markdown linenos %}
Reviewer 1: 
The article needs significant improvements in its writing,
as it is more similar to a technical report than a scientific article.
The article is written very superficially, with sections written in a
summarized manner. The Introduction section is profusely long and
confusing, while the Methodology is insufficiently detailed and
fragmented into many brief subsections. The Discussion section lacks
clarity, not adequately detailing the results presented. These, in
turn, are described very vaguely. Furthermore, most of the references
are old.
{% endhighlight %}

I think it's worth mentioning that reviewing papers is a selfless, unpaid act of true academic altruism.
It's primarily carried out by academic in their spare time, and these are people under limited time constraints and pressure to maintain theirs own research output.
It's unseen work, and it's not rewarded in any way [^5].
This explains among other things, the poor quality of reviews (but that is the topic for another post).

## Good Reviews

Here are some characteristics of good reviews:

- Support criticisms with evidence from the text or from other sources. For example: "Doe et al [1] have shown that the analysis you use in Section 3 is not the most appropriate for this situation. Please explain why you used this particular method." 
- Provide specific suggestions on how to improve the manuscript. For example: "The introduction needs more detail. I suggest that you improve the description in Section 3 to provide more justification for your study (specifically, you should expand upon the knowledge gap being filled)."
- Provide constructive criticism, and avoid personal opinions. For example: "The paper would benefit from a more detailed literature review to provide context for the study. Although your results are compelling, the data analysis should be improved in the following ways: A, B, and C."
- Concrete comment on the strengths and weaknesses to provide a balanced review. For example, "I commend the authors for their extensive data set, compiled over many years of detailed fieldwork. In addition, the manuscript is clearly written in professional, unambiguous language. If there is a weakness, it is in the statistical analysis (as I have noted above) which should be improved upon before Acceptance."
  I use a simple template to guide my review.
  It helps me to enter into my reviewer's flow and to make sure I don't forget anything.

Good reviews have a clear structure.
Here's the template I use:

{% highlight markdown linenos %}
Title: [Paper's Title]

**Summary**

One-paragraph summary of the paper.

**Positive Aspects**

Bullet list in decreasing order of relevance.

Example:
- The topic is relevant and timely.
- The idea is novel and fills a knowledge gap.
- The conclusion makes sense.

**Major Inconsistencies**

Bullet list of major issues in decreasing order of relevance.

Example:
- The paper is not novel, it was done before by John Doe in 1984 [1].
- The methodology is not rigorous, it's clearly flawed.
- The conclusions are not backed by the results.

**Minor Inconsistencies**

Bullet list of minor issues in decreasing order of relevance.

Example:
- The figure 3 is not clear.
- The paragraph 2 in section 3 is redundant.
- The terminology is not consistent.

**Questions and Remarks to the Authors**

Bullet list of direct questions to the authors regarding major issues.

**Nitpicking**

Bullet list of minor issues (e.g., typos, grammar, etc.).
- Page 3, line 4: "the" should be "they".
- Figure 2: the font is too small.
- Figure 4 is unclear and could benefit from a higher resolution.

**Comments to the Editor**

Key points to justify my recommendation to
accept, accept after minor revisions, major revision, or reject.

Example:
The paper is a valuable addition to the field of [field],
with potential implications for [applications]. 
I recommend acceptance after moderate revisions as outlined above.
{% endhighlight %}

It's a good practice looking at the reviewer's guidelines in the journal.[^1]
Sometimes they provide a list of questions that reviewers should answer when reviewing a paper.
When peer reviewing, it is essential to provide balanced feedback by offering constructive criticism that includes specific improvement suggestions while also recognizing the work's strengths to motivate authors.
Ensure your feedback is clear and objective, backing points with evidence and remaining impartial.
Maintain confidentiality by treating the review process as private and disclose any conflicts of interest to the editor, recusing yourself if necessary.

# Common Reviewer's Phrases (Bonus Section)

Here are some common phrases that I use when looking for nitpicking issues in the paper:

- The sentence `X` is **cryptic**.
- The paragraph `X` is **redundant**.
- The word `X` is **unnecessary**.
- The paragraph `X` is **orphan**, merge with the previous one or extend.
- The arguments in paragraph `X` are quite **subjective**, specify.
- Add more concrete **examples** for `X` and `Y`.
- The idea `X` is interesting, **elaborate** more on it.
- The variable are not well defined, **clarify**.
- For sake of understanding, **rephrase** the sentence `X`.

# Last Thoughts

Being an effective peer reviewer is an essential aspect of academic life.
It's also a good opportunity to learn from other what's going on in the field.
I tend to accept most of the reviewer request coming from good journals.
As more reviews come in, I think that adopting structured, thoughtful, and ethical reviewing practices is essential, not only to contribute to the advancement of knowledge, but also to enhance my own understanding and reputation in the field. 
In essence, the quality of peer review lies in balancing between rigorous critique and constructive support, aiming always to foster scientific progress.

# External Resources

- [:earth_americas: Peer fortress: The scientific battlefield](https://matt.might.net/articles/peer-fortress/)
- [:earth_americas: Review a Research Paper: Constructive Critique in Five Steps](https://www.yegor256.com/2023/12/17/how-to-review-research-paper.html)

# Footnotes

[^1]: For example, [here](https://ieeeaccess.ieee.org/about-ieee-access/announcements/reviewerbestpractices_ieeeaccess/) are the reviewer guidelines for _IEEE Access_, and [here](https://dl.acm.org/journal/tosem/reviewers) for _ACM Transactions on Software Engineering and Methodology_. Notice how vague some of these suggestions are.

[^2]: For example, [the PageRank algorithm](https://doi.org/10.1016/S0169-7552(98)00110-X) by Larry Page and Sergey Brin, which later became the foundation of Google’s search engine, was not fully appreciated by early reviewers. The groundbreaking nature of their approach to ranking web pages based on links fundamentally changed internet search technology and contributed to Google’s dominance in the field.

[^3]: I personally don’t care about the authors' prestige, but some people certainly do.

[^4]: Improving the quality of reviews is a problem that I think needs to be addressed by the institutions that benefit directly from the research.

[^5]: Some efforts have been made to reward reviewers, such as [Publons](https://publons.com/) and [Web of Science](https://clarivate.com/). However, these platforms lack direct reward, beyond digital badges and certificates, and are not widely recognized by the academic community.





