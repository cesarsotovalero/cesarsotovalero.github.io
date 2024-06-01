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
image: ../img/posts/img-placeholder_cover.webp
share-img: ../img/posts/img-placeholder_cover.webp
show-avatar: false
toc: true
mathjax: false
date: 2023/11/12
author: cesarsotovalero
published: false
---

In the academic circle, [peer reviewing](https://en.wikipedia.org/wiki/Scholarly_peer_review) is the act of assessing the quality of research papers before they are published in journals or presented at conferences.
Peer reviewers are supposed to be expert in the field.
Their opinions have direct influence on the final decision taken by the associated editor regarding accepting or rejecting a submitted research paper.
During the last years, [I've peer-reviewed](../service/#peer-reviews) more than 10 research papers in top journals and conferences, mostly within the fields of Software Engineering, Applied Machine Learning, and Sports Sciences.
I've also played on the other side of the fence, submitting [my own papers](../publications.html) to similar venues and getting all kinds of positive and negative peer reviews.
This dual perspective has given me some interesting insights into the peer review process, its challenges, and its importance to the academic community.
Specifically, I have notice significant differences, in terms of quality, in the reviews I've had the chance to see.
Overall, I believe the quality is poor, and I think that is a problem that needs to be addressed.
In this post, I share my personal approach when peer-reviewing research papers. 
My focus is on following a methodology to deliver a decent peer review within a reasonably amount of time, i.e., fast and effectively.
Whether you're new to peer reviewing or looking to refine your approach, you'll ~~probably~~ find practical tips on providing constructive feedback to authors so that they could enhance the quality of their papers.

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "0px solid #808080" path: img/posts/img-placeholder.webp alt: "TODO" %}
  <figcaption class="stroke"> 
    &#169; TODO
  </figcaption>
</figure> 

# Acceptance

First, I would like to emphasize the fact that peer reviews represent personal opinions about a submitted paper.
Such opinions could be even contradictory (as it has happened to me several times).
Consequently, the history of science is full of [examples](https://www.sciencealert.com/these-8-papers-were-rejected-before-going-on-to-win-the-nobel-prize) of really awesome papers that were initially rejected by academic reviewers.[^2]
 The peer review process seems to be the less terrible method that the scientific community has come up with (so far) to judge the quality of science.
Having said that, let's accept its imperfections and focus on making it better.

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

> "The number one reason for me to reject a paper is novelty. The second one has to do with presentation. From the author's perspective, it very challenging to "fix" the novelty issue, but there is a lot that can be done to improve presentation. For example adding real world examples, improving the figures, making the paper more clear and readable, fixing incomplete sections, etc."

Second, I try to answer myself the following questions in order:

1. Do I understand the paper after reading the title and abstract? I assume I should not be an expert in the field to understand the key contribution.
2. Is the paper beautiful? For me, beautiful means written in LaTex, with clear structure, high-quality (vectorial) figures, well-formatted tables, right amount of references, and a good balance between text and other visual elements.
3. Does it include a link to a GitHub repository or raw dataset?  Reproducibility is key. I do `Cmd F` and search for `http` hyperlinks.

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

I use a simple template to guide my review.
It helps me to enter into my reviewer's flow and to make sure I don't forget anything.

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

**Comments to the Editor**

Key points to justify my recommendation to 
accept, accept after minor revisions, major revision, or reject.
{% endhighlight %}

Then, I use the following checklist to guide my review:

- [ ] I think that the idea is novel (not done before), it identifies and fills a knowledge gap.
- [ ] I understand the contributions of the paper after reading the introduction. 
- [ ] I find the research questions well-defined, relevant and meaningful. 
- [ ] I believe the methodology is rigorous and performed to a high technical standard.
- [ ] I agree that the conclusions are well backed and linked to original research questions.
- [ ] I identify the citations are appropriate and relevant.
- [ ] I enjoy reading the paper because it's well written, clear, and easy to follow.

If I can check all the boxes, then I then I recommend the paper for acceptance.
Otherwise, I have to elaborate on the reasons why I can't check them.

## Common Reviewer's Phrases

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

# Good vs. Bad Reviews 

Bad reviews are those that are vague, unhelpful, generic.
Counterintuitively, I find bad papers the easiest to review because there a so many things to criticize.
Good papers, on the other hand, require more work to review because I need to be more creative in finding ways to improve them.
In the following sections, I provide examples of good and bad reviews, and I explain what makes them good or bad.

## Bad Reviews

<aside class="quote">
    <em>“Reviewing papers is a selfless, unpaid act of true academic altruism.”</em> 
</aside>

This explains among other things, the poor quality of reviews (but that is the topic for another post).

- Bad reviews are vague: "I didn't like this paper."
- They don't help to make the paper any better: Figure 3 is not clear. Why? How can it be improved?
- They are not constructive: The authors should have done a better job. How? What specifically should they have done differently?
 
Here's a real example of a bad review:

> "Reviewer 1: The article needs significant improvements in its writing, as it is more similar to a technical report than a scientific article. The article is written very superficially, with sections written in a summarized manner. The Introduction section is profusely long and confusing, while the Methodology is insufficiently detailed and fragmented into many brief subsections. The Discussion section lacks clarity, not adequately detailing the results presented. These, in turn, are described very vaguely. Furthermore, most of the references are old."

## Good Reviews

<aside class="quote">
    <em>“I've seen that the better the journal the better the submitted paper (generally).”</em> 
</aside>

It's a good practice looking at the reviewer's guidelines in the journal.[^1]

Organize by importance of the issues, and number your points:
1. Your most important issue
2. The next most important item
3. …
4. The least important points

Support criticisms with evidence from the text or from other sources: 
Example: Smith et al (J of Methodology, 2005, V3, pp 123) have shown that the analysis you use in Lines 241-250 is not the most appropriate for this situation. Please explain why you used this method

Give specific suggestions on how to improve the manuscript:
Your introduction needs more detail. I suggest that you improve the description at lines 57- 86 to provide more justification for your study (specifically, you should expand upon the knowledge gap being filled).

Comment on language and grammar issues:
The English language should be improved to ensure that an international audience can clearly understand your text. Some examples where the language could be improved include lines 23, 77, 121, 128 – the current phrasing makes comprehension difficult. I suggest you have a colleague who is proficient in English and familiar with the subject matter review your manuscript, or contact a professional editing service.

Provide constructive criticism, and avoid personal opinions:
I thank you for providing the raw data, however your supplemental files need more descriptive metadata identifiers to be useful to future readers. Although your results are compelling, the data analysis should be improved in the following ways: AA, BB, CC

Comment on strengths (as well as weaknesses) of the manuscript to provide a balanced review:
I commend the authors for their extensive data set, compiled over many years of detailed fieldwork. In addition, the manuscript is clearly written in professional, unambiguous language. If there is a weakness, it is in the statistical analysis (as I have noted above) which should be improved upon before Acceptance.

# Ethics

The role of a peer reviewer is pivotal in the scholarly publication process, ensuring the integrity and quality of research within the academic community. However, the task comes with its own set of challenges, notably time constraints and the pressure to maintain one's own research output. This blog post aims to share effective strategies and insights for improving the quality of reviews, drawn from best practices in the field, and to provide a template and example to guide new and experienced reviewers alike.

**Understanding the Importance of Peer Review:**

Peer review is the cornerstone of academic publishing. It not only validates and improves the quality of published research but also helps in shaping the scientific agenda and in advancing a researcher’s own understanding of their field. Despite often being unseen work, the contributions of peer reviewers are vital to the academic ecosystem.

**Best Practices for Efficient and Effective Reviews:**

1. **Time Management:**
  - **Set Priorities:** Given the numerous demands on a researcher’s time, decide how many reviews you can handle annually without compromising the quality of your own work or the reviews themselves.
  - **Schedule Reviewing:** Allocate specific times in your calendar for reviews to avoid last-minute rushes, which can diminish the quality of feedback.
2. **Structured Approach:**
  - **Initial Skim:** Start by skimming the paper to capture its main thrust and novelty. This helps in understanding whether the paper fits well within its claimed scope and your expertise.
  - **Detailed Reading:** Then move to a detailed reading, annotating as you go. Focus on key sections such as methodology, results, and conclusions.
3. **Balanced Feedback:**
  - **Constructive Criticism:** Aim to provide feedback that is constructive, even when critical. Suggest specific improvements rather than just pointing out flaws.
  - **Encouragement:** Recognize the strengths of the work. Positive feedback motivates authors and acknowledges their effort.
4. **Clarity and Objectivity:**
  - **Be Clear:** State your points clearly, backing them with evidence and avoiding ambiguity. This clarity helps authors understand your perspective better.
  - **Stay Objective:** Review the manuscript impartially, regardless of your personal or professional views about the authors.
5. **Confidentiality and Integrity:**
  - **Maintain Confidentiality:** Treat the review process as confidential, and avoid discussing the paper with others.
  - **Disclose Conflicts:** If you perceive any conflict of interest, disclose this to the editor and recuse yourself if necessary.

**A Template for Writing a Review:**

*Introduction to the Review:*

- Briefly state your understanding of the paper's goals and contributions.

*Major Issues:*

- List the major strengths and weaknesses. Discuss the novelty, methodology, data validity, and impact of the findings.

*Minor Issues:*

- Point out smaller issues such as typographical errors, figure clarity, and organizational problems.

*Summary:*

- Summarize your overall impression of the paper. Would you recommend publication? If so, what revisions are necessary?

**Example of a Good Review:**

*Review for [Journal Name] Manuscript #XXXX:*

**Introduction:**
This manuscript attempts to tackle [brief description of the problem] using [methods]. The authors propose [key contribution], aiming to [impact].

**Major Issues:**

1. **Strengths:**
  - The methodology is robust and well-suited for the hypotheses tested.
  - The data analysis is thorough, and results are clearly presented.
2. **Weaknesses:**
  - The literature review is somewhat outdated. Including recent studies could strengthen the paper.
  - Certain key variables are not adequately controlled in the study design.

**Minor Issues:**

- There are several typographical errors in Sections 2 and 3.
- Figure 4 is unclear and could benefit from a higher resolution.

**Summary:**
The paper is a valuable addition to the field of [field], with potential implications for [applications]. I recommend acceptance after moderate revisions as outlined above.

# Last Thoughts

Effective peer review is an essential, if demanding, aspect of academic life. By adopting structured, thoughtful, and ethical reviewing practices, reviewers not only contribute to the advancement of knowledge but also enhance their own understanding and reputation in the field. Remember, the essence of peer review lies in the balance between rigorous critique and constructive support, aiming always to foster scientific progress.

# External Resources

- [Review a Research Paper: Constructive Critique in Five Steps](https://www.yegor256.com/2023/12/17/how-to-review-research-paper.html)

# Footnotes

[^1]: For example, [here](https://ieeeaccess.ieee.org/about-ieee-access/announcements/reviewerbestpractices_ieeeaccess/) are the reviewer guidelines for _IEEE Access_, and [here](https://dl.acm.org/journal/tosem/reviewers) for _ACM Transactions on Software Engineering and Methodology_. Notice how vague some of thes suggestions are.

[^2]: For example, [the PageRank algorithm](https://doi.org/10.1016/S0169-7552(98)00110-X) by Larry Page and Sergey Brin, which later became the foundation of Google’s search engine, was not fully appreciated by early reviewers. The groundbreaking nature of their approach to ranking web pages based on links fundamentally changed internet search technology and contributed to Google’s dominance in the field.

[^3]: I personally don’t care about the authors' prestige, but some people certainly do.



