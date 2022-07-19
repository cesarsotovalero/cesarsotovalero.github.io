---
layout: post
title: How I Overcome Writer's Block When Preparing a Research Paper
subtitle: My bulletproof approach
tags: research
description: Writing a research paper can be a tremendous challenge, even for experienced researchers. I've faced the so-called writer's block many times, especially when starting the writing process. Fortunately, with time I've developed personal systems that allow me to deal with this particular issue.
keywords:
  - research paper,
  - writing skills,
  - writing techniques,
  - scientific paper,
  - PhD's habits
image: ../img/posts/2021/stalking_monster.jpg
share-img: ../img/posts/2021/stalking_monster_cover.jpg
show-avatar: false
toc: true
date: 2021/11/07
author: cesarsotovalero
published: true
---

Every time I start writing a new research paper, the same freezing feeling seems to emerge when I look at the blank page.
This problem is known as writer's block, and most academics suffer from it in one way or the other.
I've dealt with this invisible monster on many occasions, and each victory has taught me how to overcome it better.
If you have been there, too, you should know that understanding the particular characteristics of a research paper and breaking down the writing process into small pieces is key to success.
Over time, I've developed my own set of strategies to fight writer's block, which I share in this post.
So, let me tell you about the tricks I've learned through these years of continuous struggling [writing academic papers](https://www.cesarsotovalero.net/publications).
I hope you find them useful as too.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2021/stalking_monster.jpg alt:"Photo taken at Tekniska högskolan metro station." %}
  <figcaption class="stroke">
    &#169; Writer's block is an stalking monster. Photo taken at <a href="https://goo.gl/maps/ZjSrUbNDX9EutcES7">Tekniska högskolan metro station</a>.
    </figcaption>
</figure>

# Structure Comes First  

Writing a scientific paper is a skill that can be developed only trough continuous practice and dedication.
The idea of sitting down and writing a full academic paper from scratch is overwhelming, so it is better focusing on smaller goals.
As brilliantly explained by [Simon Peyton Jones](https://en.wikipedia.org/wiki/Simon_Peyton_Jones), a [great research paper](https://www.microsoft.com/en-us/research/academic-program/write-great-research-paper/) has a well-defined structure.
So, the first step when attempting to break the ice is creating an outline for every section.

I like to start by writing all headings and subheadings and adding [author notes](https://www.cesarsotovalero.net/blog/use-custom-latex-macros-to-boost-your-writing-productivity.html#inserting-author-notes) to highlight the information that will go under each of them.
Here's a typical example of an initial outline, in LaTeX, for a conference paper belonging to the field of software engineering:

{% highlight latex linenos %}
% Contextualization, motivation, and summary of contributions
\section{Introduction}

% Definitions and (optionally) an illustrative example
\section{Background}

% Description of the tool/s used, experimental protocols employed, and research questions
\section{Study Design}

% Answers to the research questions one-by-one, add one subheading per research question
\section{Results}

% Actionable insights that emerge from the results obtained, with a focus on researchers and practitioners
\section{Implications}

% Threats to the validity of the results obtained, explain how they are mitigated
\section{Threats to Validity}

% Present the state-of-the-art and let clear the difference w.r.t to this paper  
\section{Related Work}

% A paragraph summarizing the motivation, results, and implications
\section{Conclusion}
{% endhighlight %}

An outline like this one will break the blank page syndrome and guide the writing in a structured manner.
No need to be creative here.
It's better sticking to the standards regarding structure.
A good paper reports the results of a research project concisely, and the academic community has well-defined guidelines that help reviewers do their job.
It is a good idea to cooperate with the reviewers who ultimately will decide your paper's fate.
Note that the title and content of the paper might vary over time, but this initial outline ~~when done correctly~~ hardly changes.

# Add Figures and Results

I've found that one of the best ways to break initial writer's block is by adding figures and results at the very first stage of the paper.
Just draft a figure for the study design section and add some tables with preliminary results (I'm assuming that you already have some results 😀️).
Adding this type of content is the substance that I need to start writing.

Furthermore, with the time you will notice that describing tables and figures is almost a mechanical process.
After adding this type of content, you will have a good chunk of white space filled, which gives a very gratifying sensation of being making progress.
Of course, this technique only works if you're genuinely blocked and not lacking results, which is an entirely different problem.

Now is the time to start feeding the content.
I typically focus on writing a draft of the introduction section at this stage. 
The main goal is taking particular care of clearly stating what is the motivation of the paper.
This makes it clear in my mind what the paper is about.
Writing the introduction is also a good opportunity to discuss with coauthors and reformulate the core contributions of the paper.
Once done, I suggest jumping straight to the results section.

# Formulate Questions

Writing is, in a nutshell, the art of adding words, sentences, and paragraphs in a logical and structured manner.
Most research papers are constrained in size and follow a predictable structure.
The text is organized in paragraphs, and every paragraph should convey a particular message.

An effective way to start elaborate paragraphs is by formulating questions and answering them one-by-one.
For example, this is how I broke down the paragraphs for the introduction of this [paper](https://dl.acm.org/doi/10.1145/3468264.3468589).
Note that the trick here is formulating the right questions:

{% highlight latex linenos %}
\section{Introduction}

% What is software bloat? % Why it is an issue?
\todo{Add paragraph}

% What is the state-of-the-art of research on software bloat? What is missing?
\todo{Add paragraph}

% What is the main technical/conceptual contribution of this work? What is its key novelty?
\todo{Add paragraph}

% What are the results obtained?
\todo{Add paragraph}

% What are the key contributions/implications of the results obtained?
\todo{Add bullet points}
{% endhighlight %}

Once you have the question in place then you have a hook that can be later turn into narrative text with connectors (more on this later).
Questions give a focus to writers, an actionable direction to express the ideas.
If you master the art of asking and answering the right questions, then you'll always be "in the flow."

# Paraphrase the Recurrent

A good research paper should convey a single idea.
The idea can be very simple or complex (_simple is better_, IMHO 😉), and all the text in the paper should orbit around it.
Only 20% of a paper is usually dedicated to explaining the idea, and the remainder 80% consists of data and experiments to validate it.
Therefore, the majority of a paper if filled by "the recurrent" procedures established by modern science, and there is nothing new or spectacular in there.

Mastering the identification of the recurrent parts vastly simplifies the writing process.
When I get stuck, I just need to read other academic papers in search of inspiration, with a focus on this particular part.
After a careful scan, patterns immediately start to emerge from the text.
I look at the filler words, the connectors that maker each paragraph organic.
Then, I simply adapt my sentences to mutate them into paragraphs by following the same structure.
Note that you can always remove all the connectors and change the paragraph later, which means that you'll be "improving" something that already existed.
In the same way that criticizing something is generally easier than creating it, editing is easier than writing from scratch.

On the other hand, some sections are just repetitive, they follow an existing recipe as in [the hero's journey](https://en.wikipedia.org/wiki/Hero%27s_journey). 
For example, the section of related work doesn't need to be original.
I think it's fine summarizing and paraphrasing the key results of previous work there.
Yes, paraphrasing is a skill, too, which I strongly recommend you to learn very well.

If you get stuck, then start searching for inspiration somewhere else. 
I usually read articles from the journal or conference where I plan to submit.
This gives me an idea about the expectations of its reviewers and editors. 
It is also helpful to read articles that describe the same methodology that you use.

# Refine Later

Most of us want everything to be just right before even touching the keyboard. 
But this desirable state of minds and things never happens in practice. 
The perfect paragraphs is ~~almost~~ never written at the fist shot. 
So, if you try to get it perfect in your head, then you never do, so you never begin. 
Forget about perfection and lower down the initial expectations!

> “When writing, perfectionism is your enemy”

I'm against refining sentence by sentence.
The problem with this approach is that alternating between writing and editing encourages unuseful perfectionism.
Instead, I suggest just writing some sentences (i.e., the key raw ideas) and refining them later.
Focusing on substantive writing and postponing the editing is a good strategy to move forward.
Don't switch to editing if you hit a block.
Instead,  switch to writing a different part of the paper and edit only when you have a complete draft for a section.

# Either Write or Do Nothing

Always take into account that writer's block could resurface anytime.
This happens when because writing is a very intense mental activity that demand a lot of energy. 
Our brains are developed to save energy and resources. 
Every time we need to write, a self-protection mechanism activates in our brains.
Then is when lack of attention and procrastination arises. 

To me, writing a research paper is an act of willingness and perseverance.
When I'm into it, I need to concentrate and forget about everything else besides the words and what I want to say. 
To do so, I force myself to either write or do nothing.
I'm not talking about doing nothing like when one goes to do a walk, or walks to grab a cup of coffee.
I mean doing nothing at all!

> “Boredom, when used correctly, is an excellent weapon to combat procrastination”

When I do nothing, I enter into a mental state of boredom.
This sensation tends to be very uncomfortable to me as time goes on.
I feel the imperative need to do something. Then, I just write.
It doesn't need to be great what I write, it just needs to be something that puts me out of this uncomfortable state.
Yes, I overcome writer's block as an attempt to staying away of boredom!

# Imagine That the Task Is Finished

This last trick is very special and personal.
It relies on a couple of facts:

1. It is way easier improving something that is already written than creating something from scratch.
2. After seeing something done, at least mentally, it seems easier to accomplish.

So, when I have nothing written, I just imagine that I have it done.
Yes, I know this sounds a bit crazy 😌, but it works like a charm for me.

> “If you can imagine what you want to write, in details, then you can write it”

When stuck, I perform the following simple mental exercise: I close my eyes and visualize the parts of the paper that I would like to have written.
I imagine that every section is filled with text, tables, and figures.
The work is completed in my mind.
Jumping section by section and feeling the relief of having the work done is amazing.
It provides a sense of security and confidence that really helps me to continue writing.

It is like when playing chess, and you know exactly the moves needed to win the game or take some crucial advantage.
Once you find these right moves, then the game seems simple and there is no way to be afraid of your opponent.
It is a matter of finding and visualizing a good strategy to follow.
Writing is all about strategies as well. 
So do it. 
Imagine the next paragraph is done, make your move, and then write it! 

# Conclusion

All academics hit blocks when they are writing. 
Especially at the beginning of a research paper, there is much friction and resistance. 
Don’t make it harder than it has to be. Having a toolkit of strategies for overcoming writer’s block is helpful.
Structuring, following patterns, using filled words, and assembling ideas, when done well, can build the first draft. 
It doesn't have to be perfect, just something to tweak from there. When writing, movement is critical.
It is keeping momentum and staying focused. 
If you start moving in a direction, it becomes easier to pick up speed. 
And you will be making progress! Soon, your block will be a distant memory.
