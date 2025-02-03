---
layout: post
title: Why GenAI Will NOT Replace Software Engineers
subtitle: For now...
tags: ai
description: |
  GenAI systems are becoming more and more capable of performing complex cognitive tasks that were once thought to be uniquely human. In particular, LLMs are proven to be very good at writing code. With all the buzz around GenAI replacing software engineers, are our jobs really at risk? In this article, I dive deep into AI's current capabilities and how they stack up against the demands of real-world software development. I discuss the actual potential of GenAI to assist in common development activities, and where it still falls short when it comes to creative problem solving and human intuition. 
keywords:
  - artificial intelligence
  - software engineering
  - GenAI vs. engineers
  - tech career
  - ai
image: ../img/posts/2024/2024-08-19/armillary-sphere_cover.jpg
share-img: ../img/posts/2024/2024-08-19/armillary-sphere_cover.jpg
show-avatar: false
toc: true
mathjax: false
date: 2024/08/19
author: cesarsotovalero
published: true
---

The field of Generative Artificial Intelligence (GenAI) has made incredible strides in recent years, particularly in [source code analysis and generation](https://ml4code.github.io/papers.html).  
The excitement is well justified.  
Today's GenAI systems can perform common software development tasks more efficiently than many human engineers.

{% youtube kw7fvHf4rDw %}

I've experienced the power of this technology firsthand.  
[ChatGPT-4o](https://chatgpt.com/?model=gpt-4o) is truly impressive at fixing bugs, refactoring code, and even adding entirely new features to my software projects.  
However, the excitement about speeding up software development isn't universally shared across the industry.  
Many developers are concerned that GenAI systems will soon replace them, rendering their skills obsolete.  
With its powerful capabilities, GenAI seems poised to disrupt the software development job market, potentially taking over a wide range of engineering roles.

Over the past few months, I’ve attended several academic and [industrial conferences](https://www.linkedin.com/posts/cesarsotovalero_ai-sweden-activity-7255582747417571328-oGDN) and read a plethora of [research papers on this topic](https://ml4code.github.io/papers.html).  
Yet, even among world-class experts, there’s no clear consensus on where we’re headed.  
Amid the hype, massive AI investments, and pervasive [fear of missing out](https://en.wikipedia.org/wiki/Fear_of_missing_out), confusion and uncertainty about AI’s current and future impact on the software industry abound.

In this blog post, I’ll share my perspective on the capabilities of today’s GenAI systems to see how they measure up to the demands of real-world software development.

Spoiler: I’m on the optimists' side. So let’s dive in!

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "0px solid #808080" path: img/posts/2024/2024-08-19/armillary-sphere.jpg alt: "Photo of a garden sundial in the form of an armillary sphere in Skansen, Stockholm, Sweden." %}
  <figcaption class="stroke"> 
    &#169; Since ancient times, we've tried to anticipate the future with certain levels of pessimism, and (ironically) we've been proven wrong most of the time. Photo of a garden sundial in the form of an <a href="https://en.wikipedia.org/wiki/Armillary_sphere">armillary sphere</a> in <a href="https://maps.app.goo.gl/61UCZPas6UNWWWS67">Skansen</a>, Stockholm, Sweden.
  </figcaption>
</figure>

# Behind The Sensational Headlines

If you follow the latest [tech newsletters](https://tldr.tech/) (as I do), you'll find out that the media seems excited to push out sensational news declaring that GenAI is set to take over a wide range of software engineers jobs.[^1] For those who make a living ~~pretending to write~~ writing source code, headlines like _“[Is There a Future for Software Engineers?](https://brainhub.eu/library/software-developer-age-of-ai)”_ make it easy to feel like the ground is shifting beneath our feet.  

The concern is understandable.
Advancements in [natural language processing (NLP)](https://link.springer.com/article/10.1007/s11042-022-13428-4) have powered GenAI systems to tackle tasks once deemed uniquely human.
These tasks not only include writing code but also other hardcore software engineering activities, such as gathering requirements, creating documentation, and even identifying user needs.

Consequently, we're starting to develop a deep fear on the possibility that our professional careers might soon be eclipsed by machines capable of churning out entire software applications faster than we can.[^4]

So, if you work in tech, you’re probably wondering:

1. Is the career I’ve worked so hard to build at risk?
2. Do GenAI tools truly grasp the complexities of a software project?
3. Can GenAI tools interpret vague business requirements, understand user needs, and make informed trade-offs like a human engineer?

# The Catch

The idea of AI kicking out software engineers is not new.
For instance, in 2022 an article in Nature Journal [predicted this very phenomenon](https://www.nature.com/articles/d41586-022-04383-z). 
The authors let it clear that [ChatGPT](https://openai.com/index/chatgpt/) and [AlphaCode](https://alphacode.deepmind.com/) would replace software engineers in the coming years.
But let's be honest, many companies have tried to automate software development in the past, [and most of them have failed](https://www.monperrus.net/martin/startups-machine-learning-code).[^3]
So, this kind of prediction is not new.

> "Most AI startups and companies are primarily focused on creating _wrappers_ around existing AI models without offering real value. I believe most of them will fail in the coming years."

Let’s consider the following scenario: a single person without any programming experience today can leverage an AI-powered IDE, like the popular [Cursor AI](https://www.cursor.com/), to develop a full mobile app for personal finance management. 
All from scratch! 

Impressive, right?

But there is a catch. 
The developed app likely doesn't introduce any groundbreaking innovation because its building blocks (libraries, APIs, and templates) already exist and are probably very well established in the market. 
Current GenAI code assistants merely reassemble these components to fit a well-known specific use case.
While undeniably useful, tools like ChatGPT or GitHub Copilot still don't have the ability to fully understand the context of a software project from the business, technical, and user perspectives.

This distinction is vital: GenAI excels at recombination of existing knowledge, but genuine [innovation](https://en.wikipedia.org/wiki/Innovation) (i.e., the ability to transform abstract ideas into novel practical solutions that deliver unique value) requires more than that. 
It demands a profound understanding of the problem domain, which includes grasping complex trade-offs, navigating edge cases, and adapting to evolving constraints.

Having diverse viewpoints and broad experience in managing a complex set of challenges is something that GenAI systems are still far from achieving.

# GenAI Isn't Replacing Engineers

GenAI systems operate within well-defined boundaries set by the algorithms powering them and the data they’ve been trained on. 
They’re astonishingly effective at recognizing patterns, generating text, and synthesizing existing information in seemingly novel ways. 
However, when it comes to the messy, chaotic, and unpredictable world of software development, GenAI falls short in several key areas due to its inherent reasoning limitations.

<figure class="jb_picture">
  {% responsive_image width: "75%" border: "1px solid #808080" path: img/posts/2024/2024-08-19/reciting-vs-reasoning.png alt: "TODO" %}
  <figcaption class="stroke"> 
    Reciting vs. Reasoning: GenAI can find patterns quickly, but it can't reason like a human. Source: <a href="https://news.mit.edu/2024/reasoning-skills-large-language-models-often-overestimated-0711">MIT News</a>.
  </figcaption>
</figure>

Here are some key limitations of GenAI in the context of software engineering:

- **No Contextual Understanding:** GenAI lacks the domain expertise and intuition required to assess edge cases or fully grasp the implications of design decisions.
- **No True Creativity:** While GenAI can recombine existing elements in unexpected ways, its "creativity" stems from probabilistic reasoning, not from subjective experience, intentionality, or insight.
- **No Accountability:** Software projects don’t live in isolation, they exist to solve real-world problems. An engineer must account for business needs, user behavior, and technical feasibility, which requires human judgment and responsibility.

Let's take software architecture as an example. 
A GenAI model can suggest patterns or frameworks based on existing designs.
However, defining the architecture for a mission-critical system that has not been done before and for which there is not available training data is a task that requires human extrapolation (e.g., balancing scalability, performance, and security).
This is because [architecture](../blog/what-does-it-take-to-become-a-software-architect.html) is not just about choosing the right tools or patterns, it’s about understanding the problem space, anticipating future needs, and making informed trade-offs decisions.

As I mentioned in a [previous blog post](../blog/ai-doesnt-make-me-the-same-coffee.html), GenAI powered tools are not a silver bullet.
They are exceptional at _augmentation_ of human capabilities rather than outright replacement.
They can speed up repetitive tasks, such as generation of boilerplate code, fix well-known bugs or code smells, or doing basic refactorings, but lack the capacity for _strategic thinking_ or _long-term planning_.
Besides, getting code written so easily feels somehow like cheating, which decreases the _perceived value_ of the resulting output.

# The Essence of Software Engineering

At its core, software engineering is about understanding real-world needs and finding software solutions to them. 
It’s about translating chaotic, ambiguous problems into clean, structured systems.
Software engineering is a job of high cognitive complexity because it not only requires technical skills but also a deep understanding of human behavior, business goals, and the broader context in which software operates.

For example, let’s say the goal is to build a mobile application for booking fitness classes. 
One solution might be to create a simple interface that allows users to choose a class and reserve a spot. 
But is that really enough? 
What if users also want to see instructor profiles, class reviews, or even receive reminders based on their schedule? 
Should it integrate with their fitness tracker or offer personalized class recommendations?
The possibilities are endless.

As in any other software project, the search space for building a useful app like the one mentioned before is vast.
The key point is that software engineers don’t just dive into coding without fully understanding the deeper needs of the user. 
Humans have the ability to grasp context, consider variables like user preferences, time, convenience, and even emotions.
This is something machines can't do without a clear direction from human insight.

And this is precisely where GenAI falls short. 
Sure, GenAI can generate code, but it doesn't truly _understand_ the problem at hand.
It doesn’t think _as a human would do_, it lacks specific business context, and that make it fundamentally different. 
It cannot sit down with stakeholders and clarify their needs. 
It can’t challenge assumptions or deal with conflicting requirements. 
All it can do is guess based on patterns it’s been trained on. 
And often, that guess is way off the real needs of the users, because those needs are chaotic, and according to my experience, most users don’t really know what they want.

<figure class="jb_picture">
  {% responsive_image width: "75%" border: "1px solid #808080" path: img/posts/2024/2024-08-19/jobs-quote.png alt: "People don't know what they want until you show it to them." %} 
  <figcaption class="stroke"> 
    Steve Jobs understood the importance of human creativity in software development.
  </figcaption>
</figure>

In my opinion, this is where human engineers shine. 
We understand nuance. 
We can think creatively and adapt to changing environments.
And why does this matter? 
Because the world needs critical thinking. 
As long as humans remain as complex, messy creatures with changing needs, there will always be a demand for someone who can turn those messy needs into clean software solutions.

<figure class="jb_picture">
  {% responsive_image width: "50%" border: "1px solid #808080" path: img/posts/2024/2024-08-19/ai-dumbness-example.jpg alt: "Example of chatbot messing out with human context." %}
  <figcaption class="stroke"> 
    A dummy example showing the limitations of current GenAI in understanding context.
  </figcaption>
</figure>

Even if we stop writing code ourselves and rely fully on natural language interfaces to generate it, the essence of software engineering will remain the same.
Source code is just the way we found to instruct computer so that they can solve human-centered problems.
Therefore, I believe we should focus on developing our problem-solving skills instead of writing code.
Our ability to define requirements and solve human problems (using AI systems) is going to be much more valuable in the coming years.

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "0px solid #808080" path: img/posts/2024/2024-08-19/requirements-engineering-in-the-age-of-ai.png alt: "TODO" %}
  <figcaption class="stroke"> 
    Example of a loop of requirement engineering in the age of AI. Requirement engineers, stakeholder, engineers and domain experts cooperate with AI agents to define the requirements of a software project.
  </figcaption>
</figure>


Now you might be thinking: What about the software engineering tasks that are more straightforward and annoying for humans? Could GenAI take over there? 

# Engineering Value Is in the Details

One of the biggest challenges in software development is that it’s error-prone at almost every step. 
If you misunderstand a customer need, you end up solving the wrong problem. 
Misinterpret a functional requirement, and you will end up designing a system that’s overkill, or worse, one that under-delivers.

For example, imagine you’re tasked with building a real-time messaging system for a customer support team handling thousands of chats per day concurrently. 
The natural assumption might be to scale up with advanced [microservices](../blog/design-for-microservices.html) and expensive infrastructure to ensure immediate response times.
But in the prototyping phase, a more practical solution could involve implementing a simple queuing system to handle chat overflow during peak hours, reducing the need for costly infrastructure while keeping the user experience intact.

<figure class="jb_picture">
  {% responsive_image width: "75%" border: "1px solid #808080" path: img/posts/2024/2024-08-19/notification-system-architecture.jpg alt: "Example of a notification system architecture." %} 
  <figcaption class="stroke"> 
    Example of a notification system architecture using a queuing system to handle peak hours. Source:
    <a href="https://www.cometchat.com/">CometChat</a>.
  </figcaption>
</figure>

A GenAI powered engineer, on the other hand, would probably go with the more “typical” solution, like adding servers and microservices, because that's how the majority of documentation resources to build these kinds of system explain how it’s done.
GenAI models doesn't have the creativity to consider alternative options.
They follow the existing data, the information on what is has been trained on.
I foresee this as a potential problem in the future, because it could lead to a homogenization of software solutions, where everyone uses the same tools and the same approaches, and that’s not good for [software diversity](https://en.wikipedia.org/wiki/Software_diversity) and innovation.

Personally, I'm seeing too much GenAI generated code in my own work and on GitHub these days.
The difference between a good solution and a great solution often comes down to human ingenuity, finding that less obvious, but more effective approach.
I believe the real magic in engineering happens in those transitions, from needs to requirements, from designs to code.
These steps are where human insight makes all the difference.

> "My entire career working in AI/ML has shown me that domain knowledge is the highest leverage investment. Most of the tooling for AI/agents/etc. really is still in the _technical_ realm, intended for AI/ML people or maybe engineers. But imagine a world where the domain expert had the agency to iterate and improve an AI, without having to go through an _AI engineer intermediary_.
> That would open the door to create incredibly powerful AI systems quickly. Keep a close eye on the product they are building, because I think it will close this gap." -- _[Skylar Payne](https://www.linkedin.com/in/skylar-payne-766a1988/)_

Of course, automating the boring parts is a great thing.
That's what engineers have been doing since the early days, right?
However, today is even more important to look for smarter ways to solve problems, because GenAI might offer a set of solutions, but it’s our job to consider all the possibilities and make a critical evaluation of each of them.

So, what does this mean for the whole software industry, where things are constantly in flux? Can GenAI keep up with those changes?

# The Dynamic Nature of Software Development

The concept of agile software development is all about flexibility.
This means adapting to change, whether that change comes from shifting market conditions, evolving user needs, or even new regulatory requirements.
It’s a fast-paced, ever-changing process, and that exactly where current GenAI systems based on Large Language Models (LLMs) struggle the most.

<figure class="jb_picture">
  {% responsive_image width: "75%" border: "1px solid #808080" path: img/posts/2024/2024-08-19/agile-software-development.png alt: "TODO" %}
  <figcaption class="stroke"> 
    Agile software development is all about adapting to change.
  </figcaption>
</figure>

For example, imagine you are midway through a project when suddenly, the market shifts. The client wants to pivot. 
You need to revise your priorities and adjust the entire architecture of your software. Can a GenAI system do that? Yes, it can!
But what if the conditions are completely new because of an event that has never ever happened before? For example, during a market crash or a natural disaster.
It's hard for me to imagine a GenAI system that can adapt to those kinds of unpredictable situations.

AI operates based on past data and predefined assumptions. 
It’s not going to sit in a meeting with you, hear the client’s concerns, and propose a totally new approach.
But part of our work is finding out what the client really needs, even when they don’t know it themselves!

Now, don’t get me wrong.
Current GenAI can assist in agile development, especially when it comes to routine tasks like generating boilerplate code or testing. 
But when it comes to adapting to new, unexpected demands, they show some limitations.

AI will not replace programmers but will fundamentally change the development landscape, making human creativity and problem-solving capabilities more essential than ever. 
Adaptability is one of the most valuable skills in software engineering. 
As long as the world keeps changing, there will always be a need for people who can pivot quickly and come up with creative solutions.

Now, let's take a closer look at the situations where GenAI actually excels in software engineering, and how we can leverage that.

# Where GenAI Can Actually Help

Take code reviews, for example. 
I think it’s a very tedious but necessary task.
You’ve got to sift through line after line of someone else’s work, looking for bugs, performance issues, or security vulnerabilities. 
[GenAI agents](https://en.wikipedia.org/wiki/Intelligent_agent), like those integrated on GitHub or other platforms to review pull-requests, can help automate parts of this process, flagging potential issues before a human ever gets involved.

AI can help with tasks that are repetitive, like generating boilerplate code, adding unit tests, or writing documentation. 
It can analyze large datasets and suggest optimizations. 
Indeed, many surveys suggest that developers are eager to get away from these tasks to GenAI assistants.

But when it comes to making the final call, the human touch is still essential.

> "With LLMs, coding won't be enough to differentiate as an engineer, you'll need to think about the product, business KPIs, strategy etc. 
> You need to think about solutions to problems, not software tools. 
> And PMs are going to be expected to get more technical. 
> Nothing is stopping them now, LLMs help you code. 
> They will need to use their product knowledge and combine it with technicals to give engineers more tangible instructions. 
> Those sound pretty similar, and the result will be less fragmentation and miscommunication between PMs and engineers, something that's far too common today. 
> They'll start speaking more similar languages."

In my opinion, the future isn’t about GenAI taking over but about humans learning how to work alongside GenAI to be more efficient and effective. And the engineers who can collaborate with GenAI agents (or whatever we'll call them) will be the ones who thrive in the future.

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "1px solid #808080" path: img/posts/2024/2024-08-19/stackoverflow-dev-survey-2024-ai-developer-tools-ai-complex-social.png alt: "Stack Overflow Developer Survey 2024 results on the perceived ability of AI tools to handle complex tasks." %}
  <figcaption class="stroke"> 
    Stack Overflow Developer Survey 2024 results on the perceived ability of AI tools to handle complex tasks.
  </figcaption>
</figure>

We should integrate GenAI into our workflows where it makes sense, use it to handle the boring stuff, so we can focus on the creative and complex tasks.

And I know what you may be thinking, if GenAI can assist in low level tasks, that means it could eventually replace less experienced engineers. Isn't it?

# Can GenAI Replace Entry Level Engineers?

Well, the answer is... yes/maybe.

But…

Less experienced engineers are not just doing the easy tasks.
They’re learning, growing professionally, and building the experience they need to tackle more complex problems down the road. 
GenAI might be able to take over some of the simpler tasks, but it can’t replace the learning process.

For example, if you have been around for a while in this industry, think about how much you learned from your first projects. 
It wasn't just about writing down the code (programmers are not typists). 
It was about understanding the problem, communicating with other developers, figuring out how to structure the solution, and dealing with unexpected bugs along the way.

If we remove the possibility of learning that stuff, and put GenAI systems in place, then it'll be harder for the young people to gain that kind of experience or develop the necessary intuition to solve real-world problems.

What should we do then?
Well... if you’re an entry level engineer, your goal should not be to compete with AI. 
It should be to delegate the tasks that GenAI can efficiently handle, and moving on to the bigger, more interesting challenges.

So, keep pushing yourself.
Don’t get too comfortable with the easy tasks and just delegate those to GenAI systems.
Focus on learning [the skills](../blog/surviving-the-ai-revolution-as-a-software-engineer.html) that only humans can master.

# Final Thoughts

As software ~~developers~~ creators, the key is to think critically about where GenAI adds value and where it falls short.
Instead of viewing GenAI as a _competitor_, we should treat it as a _collaborator_. 
By leveraging GenAI for grunt work, we can focus on higher-value tasks, such as crafting innovative designs, optimizing user experiences, and solving problems that GenAI simply cannot understand at a conceptual level (i.e., leveraging _the human experience_).

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "1px solid #808080" path: img/posts/2024/2024-08-19/stackoverflow-dev-survey-2024-ai-efficacy-and-ethics-ai-threat-social.png alt: "Stack Overflow Developer Survey 2024: Are AI tools a threat to software engineers?" %}
  <figcaption class="stroke"> 
    Stack Overflow Developer Survey 2024 results about the perceived threat of AI tools for software engineers.
  </figcaption>
</figure>

The truth is, your skills remain highly relevant, so long as you _adapt_ to the new order. 
The engineers who thrive in this new landscape will be those who augment their capabilities with GenAI while continuing to bring their unique human creativity, expertise, and empathy to the table.

In conclusion, I don’t think GenAI is going to replace software engineers (at least not anytime soon).
And sure, it can handle repetitive tasks and assist in certain areas, but the real value coming from software development still requires human intuition, creativity, and problem-solving.

Because, let me say it again, software development isn't just about writing code, it’s about solving problems.
These problems are often really messy, poorly defined, and which solutions are deeply tied to human intuition and creativity. 
The main task of engineers is to balance conflicting priorities, adapt to ever-changing environments, and navigate the ambiguous waters between business needs and technical solutions.

If there is one way to keep our pockets safe, I think it is to stay ahead of the curve.

# Footnotes

[^1]: This is understandable once we realize that the traditional media is in the business of creating sensational headlines and monetizing our attention rather than providing accurate information. 

[^2]: See Billings, Jay Jay, et al. 2017 "Will humans even write code in 2040 and what would that mean for extreme heterogeneity in computing?", [in arXiv](https://arxiv.org/pdf/1712.00676).

[^3]: I still remember Dreamweaver from [Macromedia](https://en.wikipedia.org/wiki/Macromedia) (later purchased by Adobe). It was a no code app that promised to make web development just a matter of throwing components to a canvas. It didn't work out as expected, and today we are still writing HTML, CSS and JavaScript, ouch!

[^4]: Not to mention the negative impact of AI related layouts on our ~~highly overvalued~~ software engineering pockets.

