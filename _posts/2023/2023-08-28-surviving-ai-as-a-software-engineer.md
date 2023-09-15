---
layout: post
title: Surviving the AI Revolution as a Software Engineer
subtitle: Is there still any hope?
tags: ai
description: The next wave of extremely powerful and specialized AI models is coming, and it will likely revolutionize software engineering as we know it. As developers, we need to get the skill to surf the wave and keep our jobs. As with every technological breakthrough, AI will create new jobs and destroy others. In this article, I will focus on how you can keep your job in this new world dominated by AI. My focus is on software engineering jobs, but most of the principles I mentioned also apply to other professions.
keywords:
  - software engineering,
  - Large Language Models (LLMs),
  - career advice,
  - Artificial Intelligence,
  - the future of software development
image: ../img/posts/2023/2023-08-28/head-down-teddy_cover.jpg
share-img: ../img/posts/2023/2023-08-28/head-down-teddy_cover.jpg
show-avatar: false
toc: true
date: 2023/08/28
author: cesarsotovalero
published: false
---

Dear software engineer, as you may know, AI is here to stay.
It's inevitable, and it changes everything.
If you are already mad about what [OpenAI's ChatGPT](https://chat.openai.com/) can do, hold on because it's just the beginning.
The next wave of extremely powerful and specialized AI models is approaching us.
In the next years, AI's massive adoption will affect every single aspect of our lives.
But this article is not about the issues of an AI-powered society, which you probably already eared from science fiction authors.
Instead, I will focus on how you can keep your job in a new world dominated by AI.
My focus is on software engineering jobs, but most of the principles mentioned here are applicable to any other profession.
In this survival guide, I cover only the facts that I believe will hold despite the imminent improvements of AI models. 
For example, I assume that Generative AI will eventually become better than humans at creating any kind of digital content, including not only code, but also images, music, or video.[^5]
So, what can we do to keep up with this?

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-08-28/head-down-teddy.jpg alt:"A lovely teddy bear thrashed in the backyard together with a keyboard" %}
  <figcaption class="stroke"> 
    &#169; Once we said goodbye to our lovely teddy bear, ...does the keyboard comes next?
  </figcaption>
</figure>

# What has changed?

[//]: # (My predictions two years ago)
In July 2021, I published a blog post titled "[Hermit Programmers are Dead](../blog/hermit-programmers-are-dead.html)."
My post was hardly criticized on Hacker News, receiving more than [100 negative comments](https://news.ycombinator.com/item?id=28744671).[^1]
Sadly, the main point of it was misunderstood.
The reason (I want to believe) was my limited writing skills.
In essence, I argued that the rules of the game for software developers have changed so much due to AI and cloud computing, that the archetype of the solo-programmer has become obsolete.
I believed back then than the ability to write code is not what makes a programmer successful, but instead is their social skill are, and this will exacerbate over time.
I said "writing a bunch of code is not going to be a cool thing to do anymore", and "only our unique human skills will be valued in the future."
In response, someone wrote: "this person has no idea what they are talking about."
But many things have changed since then.

[//]: # (What has changed since then)
Two years after, and it turns out that my predictions were right, particularly those about the threat of AI for developers.
Today, AI has not only proven to be better than humans at playing [Chess or Go](https://www.deepmind.com/research/highlighted-research/alphago), but it has also become better at creating all kinds of text-based content (specially code).
The improvement of deep learning techniques, advancements in neural architectures like transformers, increased computational capabilities, and the accessibility of massive training datasets extracted from the public internet have brought about a revolutionary transformation in the field of Natural Language Processing (NLP). 
This has lead to the emergence of Large Language Models (LLMs), which has proven to be capable of approximating human-level performance on certain evaluation benchmarks that require creativity and reasoning.

[//]: # (What is unique from LLMs)
What makes these modern AI systems different from previous Machine Learning (ML) models is that **they are generative instead of discriminative**.
This means that they have observed large amounts of data and learned patters, such that they can create new data that have never existed before.
In summary, the key to LLMs' tremendous success lies in the combination of the following  improvements:

<aside class="quote">
    <em>“With great size (of parameters) comes great power (of AI).”</em> 
</aside>

- **Model's complexity.** The size of ML models, measured by the quantity of parameters (i.e., the number of computed weights between artificial neurons' connections), has increased exponentially in the last years. This has been possible thanks to the availability of more powerful hardware, such as [NVIDIA GPUs](https://www.nvidia.com/en-us/data-center/h100/), and the development of more efficient training algorithms, such as the [Adam's](https://arxiv.org/abs/1412.6980) stochastic optimization and [attention mechanisms](https://arxiv.org/abs/1706.03762), which efficiently computes adaptive learning rates for each parameter, thus improving back-propagation.
- **Training size.** Researchers discovered that LLMs capabilities increase significantly when augmenting the training size.[^3] In the case of GPT based models, they are presumably trained on the whole internet's public data. This includes Stack Overflow's Q/A, GitHub's open-source projects, framework's APIs, technical documentation, and all the code that has ever been published on public websites. At some point after GPT-3's 175 billion parameters some magic happens and the text-based models get incredible powerful.[^4]
- **Human feedback.** Research has shown that AI's capabilities improve exponentially when the system is able to interact with humans. AI models fine-tuned with human feedback via reinforcement learning perform better than previous models.[^2] Today's ChatGPT models are instructed and improved continuously: both with a set of labeler-written prompts, and also with user's prompts submitted through the OpenAI's API.

<aside class="quote">
    <em>“With great size (of parameters) comes great power (of AI).”</em> 
</aside>

[//]: # (The rise of AI for developers)
Generative AI, as we know it today, is a layered system.
On the bottom is the LLM, and above there is a "simulacrum", the part that is specialized through interactions with the  the model (e.g., purpose, specifications, domain knownledge.
The simulacrum is the personality of the model, and ultimately determines the value of the AI system.

AI has become a commodity for developers, and their managers.
Something you can use as a source and transfer of value without even understanding it.
AI is better than humans at every single coding task.
This has rapidly reduced the effort of achieving any coding task.
Simply put, if you don't use AI as a developer, you're out of the market.

Microsoft is building an AI ecosystem (OpenAI GPT model, on top of ChatGPT, Bing search, and GitHub copilot).
Meta has Llama, and Google has Bard and on top Duet. They are basically “statistical models of words”.
Very useful, for example, GitHub Copilot can find the ISIN number for stocks, it can suggest the country for a particular stock. They can translate text, create poems, etc.
[GitHub Next](https://githubnext.com/) is setting what it would be the standard for the next generation of software development tools.
Soon AI will go beyond assisting developers, replacing developers in almost every single task. 
For example, it will create pull request, review code, and create documentation for managers.
The question is, what [30+ million developers](https://www.griddynamics.com/global-team-blog/number-software-developers-world) are going to do with all this extra time? 

[//]: # (The threat of AI for developers)
AI is cheaper than developers (the current price of ChatGPT 4.0 is $25/month). 
This disrupts the software industry.
Its astonishing labour-saving and problem-solving capabilities are available to anyone who wants to use them.
For developers, AI will suggest code enhancements, code completion, refactoring, generate documentation & tests, performance analysis, review code, rubber duck, dependency analysis, and security analysis. The possibilities are endless.
AI will be integrated into every single information flow service, from auto-generated email answers to the most advanced data analytic tools creating plots automatically and summarising huge amounts of data for humans to digest. This will allow faster decision-making.

# The survival backdoor

We need to focus on the skills that make us unique as humans, and at the same time are still valuable in the job market.
These skills are more difficult for machines to replicate or automate.
What follows is a list of skills that I think will allow us to preserve our developer jobs for the moment:[^6]

[//]: # (---------------------------------------------------------------)
**Understanding.** 
First, it is important to understand what this technology is capable of. 
For example, for the moment AI systems still require human instruction.
, in order to become operators. 
, .
Decision makers (a.k.a managers) usually don't have the capacity or time to understand technical communication with the machines.
Just like happened during the industrial revolution, machines will increase productivity, but they will be handled by humans, until they start repairing themselves.
To use AI, you first need to understand all the possibilities that you have with them.

[//]: # (---------------------------------------------------------------)
**Critical thinking.**
LLMs today make provide factual answers based on existing knowledge or through the analysis of data.
However, there is a large set of problems that are not clearly defined, and that require [critical thinking](https://www.criticalthinking.org/pages/defining-critical-thinking/766), which is an almost unique human skill.
For example, designing scalable systems or deciding on the correct data migration strategy is not something that can be solved by AI today because they require multiple layers of abstraction and a deep understanding of the problem domain.

A well cultivated critical thinker:
- raises vital questions and problems, formulating them clearly and precisely;
- gathers and assesses relevant information, using abstract ideas to interpret it effectively comes to well-reasoned conclusions and solutions, testing them against relevant criteria and standards;
- thinks openmindedly within alternative systems of thought, recognizing and assessing, as need be, their assumptions, implications, and practical consequences; and
- communicates effectively with others in figuring out solutions to complex problems.


[//]: # (---------------------------------------------------------------)
Opinions.
AI doesn’t take responsibility for the mistakes.
Senior developers get a big boost from this technology because they understand the response of an AI. 
For example, if you are a junior you don't know exactly what to ask, and you don’t understand the response.

[//]: # (---------------------------------------------------------------)
**Creativity.** Making jokes and the ability to understand humans’ sense of humor, is something very hard for machines.

[//]: # (---------------------------------------------------------------)
**Initiative.**
People think that now that we have an LLM, we don’t need programmers anymore, we just need to describe a problem and ask for a solution.
But come on, that’s what programming is! And what you need is domain knowledge to do that.

[//]: # (---------------------------------------------------------------)
**Empathy.** AI is better than humans in every single task, just as a calculator is better at math. But you will never get in love with a calculator.

[//]: # (---------------------------------------------------------------)
**Curiosity.**
This could be a problem in the industry: losing the happiness of discovery!
Because these machines just know everything.
And the possibilities to learn new things are so big that it is almost impossible to choose what to learn. 
So I guess we’ll need more mentors who organize the knowledge in an organized package.
You need to be curious to learn: what would happen if you change this variable? Or by taking this particular problem in a different way?

[//]: # (---------------------------------------------------------------)
**Storytelling.**
A sense of time. Reflected in our ability to tell stories.
Machines eventually will understand space through sensors but time is more complicated.
It’s good at generating boilerplate code, and then you need to check it out.

[//]: # (---------------------------------------------------------------)
**Causality.**
Current AI is like talking with something that knows everything but doesn’t quite understand it.

[//]: # (---------------------------------------------------------------)
**Research.**
 

# Future predictions

In the standard way of economy everything is a commodity, if you reach a certain level of quality, then it is all about price.
AI seems to be like the final nail in the coffin for the industrial way of the tech economy, where the price of an engineer is totally irrelevant, the only thing that matters is if high productivity and innovation over cost savings, as a highly productive developer can potentially create significantly more value than a less productive one, even if they are more expensive to hire.

The way to be able to use properly these models is to be a senior engineer.
The way you become a senior is by making mistakes and having a senior who mentors you.
Now companies don’t need juniors anymore because they have all the juniors in the form of AI. 
So, if we have no more seniors because we don’t have more juniors that are mentored by seniors?

Use it carefully today if your code has sensitive data (e.g., in a bank). 
Maybe the future will be deploying open source model in the companies to protect their data.

Just as in the science fiction novel "[The Forever War](https://en.wikipedia.org/wiki/The_Forever_War)" (1974), where due to the peculiarities of interstellar war, a time dilation occurs making the journey to the battle take a significant amount of time, causing the human soldiers to arrive 30 years later, with outdated weapons compared to the alien civilization they were intended to fight. With AI, it might be more beneficial to start anew with updated methods and rapidly improve, potentially overtaking the progress made by those who started latter.

# Conclusion

LLMs and Generative AI affects us all, as developers and humans.

With AI, everything that is boring to do and takes time becomes very very fast, as long as you know the subject. 
It makes you many times more productive.
For example, they can suggest the full specification to design an API in seconds (this normally takes days).

What is next? AI will keep grounding in experience.
We are currently at the phase of AI’s learning the written world, next it’ll move towards gaining better perception of the wold through vision, audio, touch, etc.
Next step AI systems will be able to interact with the world through physical actions, becoming sociable agents, indistinguishable from humans that learn from experience, autonomously.

Machines with outsmart people. Taking power.

# Further reading

- [How Soon AI Will Start Firing Programmers?](https://cacm-acm-org.focus.lib.kth.se/blogs/blog-cacm/276029-how-soon-ai-will-start-firing-programmers/fulltext)
- [LLaMA: Open and Efficient Foundation Language Models](http://arxiv.org/abs/2302.13971v1)
- [A Multitask, Multilingual, Multimodal Evaluation of ChatGPT on Reasoning, Hallucination, and Interactivity](http://arxiv.org/abs/2302.04023v2)
- [A Survey of Large Language Models](http://arxiv.org/abs/2303.18223v11)
- [How Close is ChatGPT to Human Experts? Comparison Corpus, Evaluation, and Detection](http://arxiv.org/abs/2301.07597v1)
- [HuggingGPT: Solving AI Tasks with ChatGPT and its Friends in Hugging Face](http://arxiv.org/abs/2303.17580v3)
- [ChatGPT is not all you need. A State of the Art Review of large Generative AI models](http://arxiv.org/abs/2301.04655v1)
- [Theory of Mind May Have Spontaneously Emerged in Large Language Models](http://arxiv.org/abs/2302.02083v3)

# Footnotes

[^1]: I decided not to edit or improve the original article to avoid losing the context of the discussion. 

[^2]: [Training language models to follow instructions with human feedback](https://arxiv.org/abs/2203.02155)

[^3]: [GPT-4 Technical Report](http://arxiv.org/abs/2303.08774v3)

[^4]: [Sparks of Artificial General Intelligence: Early experiments with GPT-4](https://arxiv.org/abs/2303.12712)

[^5]: Eventually AI will know practically everything. It will include references to where the information was taken so that we can fact-check the validity of the information.

[^6]: This guide is for 10 years only, as nobody can predict what will happen after that.
