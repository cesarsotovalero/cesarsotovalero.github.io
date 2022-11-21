---
layout: post
title: How to Write a Good Paper Rebuttal
subtitle: A practical guide
tags: research
description: My conference paper was rejected. Is it worth writing a rebuttal? This post answers this question and presents practical guidelines to write an excellent rebuttal.
keywords: academia,conference rebuttal,research paper,experience share,paper rejection
image: ../img/posts/2022/maxwell_cover.jpg
share-img: ../img/posts/2022/maxwell_cover.jpg
show-avatar: false
toc: true
date: 2022/01/29
author: cesarsotovalero
published: true
---


The rejection of a research paper is always a tough spot in the life of researchers.
Today, many top conferences allow the authors of a rejected paper to submit a so-called "paper rebuttal."
This is a last chance for the authors to defend their work in case the reviewers made obvious mistakes or the arguments supporting the rejection are unclear.
In this post, I explain under which circumstances it is worth writing a rebuttal.
Moreover, I will cover practical tips to write a good rebuttal in case you decide not to give up on your paper.
In this case, the objective is to write a rebuttal that has the highest chance to be read by the PC chairs.
If this is what you want to do... keep reading!


<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/maxwell.jpg alt:"The synthesis of irrefutable proofs is invincible in science." %}
  <figcaption class="stroke"> 
    &#169; The synthesis of irrefutable proofs is invincible in science. Photo of a plate from <a href="https://goo.gl/maps/j8GC4KtHEXoKxLpB8">Tekniska Högskolan station</a>.
  </figcaption>
</figure>

# What Is A Rebuttal, Anyway?

A rebuttal is a way for the PC chairs to avoid committing clear unfairness to a paper.
Once the authors receive negative reviews of their submission, they can write a ~~response~~ rebuttal to the reviewers' comments.
This response is entirely optional, and there is no requirement to respond or not.
It is also enforced to be typically short (between 500 and 750 words), so that the PC chairs can scan it quickly.

> “An imperfect but useful metaphor for rebuttals is debate competitions. Yes, we are trying to convince our opponent (and this is where the metaphor is imperfect; reviewers are not our opponents, but hang with us). But more importantly, we are trying to convince the judges, who will ultimately be making the decisions. Thus, all else being equal, it is more important to convince the judges of your arguments than change your opponents’ minds.”
> -- <cite>Devi Parikh</cite>

The rebuttal must focus on the following:
- Answers to specific questions raised by reviewers (if any)
- Factual errors in the reviews

A rebuttal in academic conferences is not like a response to the reviewers' comments in a journal.
In a journal, you send a response to the reviewers and resubmit the paper for another revision.
At a conference, you cannot make further changes in your paper after revision.
So, you can only address the reviewers' comments with arguments in the paper or data that you have that is not in the paper but that is relevant to support your argument.

# Is It Worth Working on a Paper Rebuttal?

In theory, each submission in a conference must be judged on its own merits.
This means accepting a paper only if there is a general agreement that it meets the standards of the conference.
In practice, total consensus and fairness are very difficult to achieve.
For example, it can be hard for the organizers to guess who is the best person to review a particular paper.
If the topic is too novel or the paper too original, the decision may be biased to the detriment of the paper.

To mitigate unfairness, many top conferences adopt a method called [Identify the Champion](http://scg.unibe.ch/download/champion/).
For a paper to be accepted, it helps if some PC Member "champions" it.
The champion is an expert that is very enthusiastic about accepting a paper.
If an expert reviewer really likes the paper, that dramatically increases its chances for acceptance.
The champion must be a reviewer from PC Members who is recognized to be an expert (and not only competent) in the domain.

> “As a rule of thumb: If there is at least one reviewer that is clearly in favor of accepting your paper (i.e., you have a champion), then you should do the rebuttal.”

If your paper doesn't have a champion, it is very unlikely you will get it accepted in a major conference.
It doesn't matter how good your rebuttal is.
And by the way, working on a rebuttal is hard work.
So, assuming that you have a champion, the rebuttal should focus on one single goal: **arm the champion!**

Your champion will need solid arguments against its detractors in the final discussion, especially strong detractors.
Refute every issue the detractors raised to give your champion extra arguments for acceptance.
Lower the confidence in the detractors' reviews by pointing out mistakes.
A strong detractor can only be countered by a strong champion.
Rather than trying to dissuade a strong detractor, your aim should be on arming the champion.
I'll explain how to do this in the rest of this post.

# Start Positive

It is a good practice to start thanking the reviewers for their reviews, and directly pointing to their positive feedback.
Thus, use around 50 words to summarize the reviews, highlighting the positive comments that reviewers made about your work.
Rebuttals focus mostly on responding to negative points, don't let everyone forget about the strengths of your work along the way.

Here's an example:

{% highlight markdown %}
We thank the reviewers for their insightful and positive feedback! 
We are encouraged that they find Foo to be a novel tasks (R1,2,3), 
an important research problem (R1,2), appropriately positioned w.r.t 
prior work (R1,3), and of value for the community (R1,2,3).
One primary concern was insufficient discussion of results. We agree.
We were constrained by space. We answer some specific questions below,
but will incorporate all feedback in the final version.
{% endhighlight %}

Notice the conversational nature of the example responses above. 
The relaxed tone makes it easier for the PC chairs to read it.
Remember that the rebuttal should not be perceived as being combative.
You're trying to convince very competent people about the quality of your work.
So, don't miss the opportunity to show your respect for the time they spent reviewing your paper.

# Focus on Major Concerns

Choose your comments wisely.
Make sure to put the answers to the expert reviewers at the beginning of your rebuttal.
Identify the major concerns of the detractors, especially the ones where the reviewer assumes you may not be able to improve the paper.
If one of the reviewers' negative comments is clearly wrong, then you should point at it only if it is significant for understanding the novelty of the paper.

> “You do not need to convince the reviewer that you’re able to fix typos, straight-forward presentation issues, language issues, or anything else that can be fixed by simple proofreading. This is taken for granted.”
> -- <cite>Andreas Zeller</cite>

A major concern is one that:
- Mistrusts the scientific contribution of the paper (its novelty, significance, etc.)
- Raise doubts about the scientific methodology employed (validation protocol, dataset, the model employed, etc.)

Sometimes, one primary concern that a reviewer spot is, on the other hand, considered a valuable contribution by another reviewer.
In this case, use part of the arguments of the supportive reviewer in your favor without using her comment as the argument.
The goal is to select the most relevant questions to answer, not encourage a conflict of opinions among reviewers.

# Hack the Word Limit, but Not Too Much...

As mentioned, the word limit (typically 750 words) is a strict limitation.
You can use underscores (`_`)  or dashes (`-`) to concatenate two words for the less important things, such as the questions from reviewers.

Here is an example:

{% highlight markdown %}
Question-2-Reviewer-3:Is_Foo_in_your_paper_actually_a_Bar?
Answer-to-Reviewer-3:
Yes, your understanding is perfect.
Foo is a Bar with X and Z.
{% endhighlight %}

**\*NOTE:** Be cautious not abusing of this method, otherwise you may be at risk that PC chair will just delete your rebuttal. 

# Make Good Use of Tables

Most rebuttal handling systems are Markdown compatible.
In Markdown format, one row is counted as one word.
Therefore, using a table saves you word limits!

For example, the following table presents new data to the reviewers without significantly affecting the word count:

```text
We conducted a new experiment with the Foo dataset:

| Model | Metric1 | Metric2 | Metric3 |
|-------|---------|---------|---------|
| A     |    69   |    40   |    38   |
| B     |    99   |    89   |    78   |
| C     |    43   |    76   |    45   |

This shows that 1)B outperforms A and C,2)The results are similar to ours.
Full results: https://github.com/anonymous/repo 
```

Note how there is a link to an external repository.
Yes, adding links to data and experiments is a good idea in a rebuttal.

# Make New Experiments

Adding new experiments to support the rebuttal is incredibly valuable.
This ensures that the “lack of this experiment in the paper” is not the rejection reason.
Also, if the results are valuable and convincing, it is clear that you have done a lot of work for the reviewers.
Most people respect when somebody is working hard.
So, adding new experiments will make your rebuttal considered more seriously by the PC chairs.

Always give the details of the methodology used in the experiment and the data to support your claim.
Rather than argue with the reviewers, give them data and stats to back your claim up.
These can be statistics analyses based on new data or results.
Or the results of additional experiments you run to respond to their concern (if allowed by the venue).

Never claim that the reviewer has no idea what she is talking about, even if that is the case.
It would be best if you were respectful and polite to the reviewers.
Thank them for their suggestions and suggest fixing whatever is fixable even if you think nothing is wrong
Every time you find yourself having a different opinion than the reviewer, ask if you can establish that with data.
You can always provide intuitive arguments after settling the issue with data and new experiments.

# Emphasize

Acknowledge good suggestions made by the reviewer.
If those suggestions are easy to fix, say they are fixable and will be fixed in the final version.
Don’t be afraid of emphasis: “Row 2 in Table 4 shows exactly that.” “We do NOT need a human-in-the-loop at test time.” Notice that many of the responses above are not just direct, but also have emphasis (in tone if not formatting of text).

# Highlight the Important Points to All Reviewers

At the end of the rebuttal, consolidate all the common concerns.
You can also save space by responding to multiple reviewers at once if they share related concerns.
This is important to help the reviewers understand other reviewers' concerns!

Here is an example:


```text
Dear reviewers,
We appreciate your positive feedback.We focus on four major points to
solve your concerns and get your support:
1.The results of Foo are significant in terms of Metric1 and Metric2.
Please see Answer-to-Reviewer-2. 
2.We assume Bar, which follows state-of-the-art:X and Y.We agree with
Reviewer-2,so we added Z.Please see Answer to Reviewer-2. 
3.We added a new study Foo. Please see Answer-to-Reviewer-1.
4.We disagree that our results are insignificant because X and Z.
Please see Answer-to-Reviewer-3.
```

If some reviewers' comments do not make sense, you can showcase them here to discuss with all reviewers.
In case a reviewer's suggestion makes no sense or is not valid, explain why the argument is invalid.
However, you should acknowledge that your paper might have a problem if all the reviewers did not get it right.
Promise to clarify those issues for the final version.

# Conclusion

Only go for a rebuttal if at least one reviewer supports the paper (i.e., you have a champion).
The rebuttal should be thorough, direct, and easy for the reviewers to follow.
If a reviewer really doesn't like your paper, then it's unlikely you can change his mind during the rebuttal phase.
However, it's just an excellent opportunity to address some particular concerns.

Keep your answer factual, polite, and constructive.
For example, if a reviewer asks: “Isn't your approach undecidable?,” then you can answer “yes/no,” and “we can include the proof in the final version of the paper”  and link to a research report where the proof is already written.
Or if a reviewer wrote: “this problem was already solved 20 years ago by Einstein,” then you can answer: “We released one of Einstein's assumptions, that we believed was too strong for this particular context.”
Always be confident in your work.

If there is a chance, catch it and do not give up.
Conference rebuttal, journal response, rejection, and acceptance are all part of the research game.
And you better learn how to play it well 😀.

# References

- [:earth_americas: Patterns for writing good rebuttals](https://andreas-zeller.info/2012/10/01/patterns-for-writing-good-rebuttals.html), by Andreas Zeller.
- [:earth_americas: How we write rebuttals](https://deviparikh.medium.com/how-we-write-rebuttals-dc84742fece1), by Devi Parikh.