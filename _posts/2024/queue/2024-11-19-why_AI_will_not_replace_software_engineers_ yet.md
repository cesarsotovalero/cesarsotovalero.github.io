---
layout: post
title: AI Will NOT Replace Software Engineers... Yet
subtitle: TODO
tags: ai
description: |
  AI systems are becoming more and more capable of performing complex cognitive tasks that were once thought to be uniquely human. In particular, LLMs are proven to be very good at writing code. With all the buzz around AI replacing software engineers, are our jobs really at risk? In this article, I dive deep into AI's current capabilities and how they stack up against the demands of real-world software development. I discuss the actual potential of AI to assist in common development activities, and where it still falls short when it comes to creative problem solving and human intuition. 
keywords:
  - artificial intelligence
  - software engineering
  - AI vs. engineers
  - tech career
  - ai
image: ../img/posts/img-placeholder_cover.webp
share-img: ../img/posts/img-placeholder_cover.webp
show-avatar: false
toc: true
mathjax: false
date: 2024/11/19
author: cesarsotovalero
published: false
---

[//]: # (- What is the personal story? when I was...)
[//]: # (- What problem am I solving?)
[//]: # (- What are the benefits of solving it?)
[//]: # (- What emotion am I generating?)
[//]: # (From these questions, I create:)
[//]: # (- At least 5 headlines)
[//]: # (- The bullet point summary)

AI has made incredible strides in recent years, particularly in generating source code.
Today's AI systems can perform common software development tasks better than most engineers.  
For example, I use ChatGPT to find and fix bugs, refactor code, and even add entirely new features to my software projects.
But this joy is not shared by everyone.
Armed with these capabilities, AI seems poised to disrupt the job market, threatening to replace many software engineering roles.
But let's be hones, the AI threat is not new, back in 2022 an article in Nature Journal [predicted this very phenomenon](https://www.nature.com/articles/d41586-022-04383-z).

Over the past few months, I’ve attended several academic and industrial conferences and read a plethora of research papers on this topic.  
Yet, even among world-class experts, there’s still no clear consensus on where we are headed.
Amid the hype, the massive investments in AI, and the pervasive [fear of missing out](https://en.wikipedia.org/wiki/Fear_of_missing_out), there’s a lot of confusion and uncertainty about AI’s current and future impact on the software industry.

It is understandable, if you work in tech, you’re probably wondering:  
- Is the career I’ve worked so hard to build at risk?_
- Can an AI truly grasp the complexities of a software project?  
- Can it interpret vague business requirements, understand user needs, and make informed trade-offs like a human engineer?

In this blog post, I’ll share my perspective on the capabilities of today’s AI systems to see how they measure up to the demands of real-world software development.
Let’s dive in!

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "0px solid #808080" path: img/posts/img-placeholder.webp alt: "TODO" %}
  <figcaption class="stroke"> 
    &#169; TODO
  </figcaption>
</figure>

# Behind The Sensational Headlines

If you follow the latest [tech newsletters](https://tldr.tech/) as I do, you'll find out that the media seems excited to declare that AI is set to take over a wide range of software engineers jobs.[^1]
Headlines like _“[Is There a Future for Software Engineers?](https://brainhub.eu/library/software-developer-age-of-ai)”_ or *“AI is the Future of Programming!”* make it easy to feel like the ground is shifting beneath our feet.  
It’s tempting to think your career might soon be eclipsed by machines capable of churning out entire software applications faster than you can type a few lines of code.

But hold on—let’s take a closer look.

It’s true that advancements in [natural language processing (NLP)](https://link.springer.com/article/10.1007/s11042-022-13428-4) have powered generative AI systems to tackle tasks once deemed uniquely human.  
These tasks include gathering requirements, creating documentation, and even identifying user needs.

Take tools like ChatGPT or GitHub Copilot, for example.  
While undeniably powerful, they aren’t entirely new concepts.  
Let’s consider a scenario: a non-programmer uses an AI-powered no-code platform to develop a mobile app for personal finance management.  
Impressive, right?

Here’s the catch.  
That app likely doesn’t introduce any groundbreaking innovations.  
The building blocks—libraries, APIs, and templates—already exist.  
AI merely reassembles these components into a cohesive whole.

This distinction is vital: AI excels at recombination, but genuine innovation—the ability to transform abstract ideas into practical solutions that deliver meaningful value—requires more than algorithms.  
It demands a profound understanding of the problem domain, which includes grasping complex trade-offs, navigating edge cases, and adapting to evolving constraints.

### Why AI Isn't Replacing Engineers (Yet)

AI systems operate within well-defined boundaries set by the algorithms powering them and the data they’ve been trained on.  
They’re astonishingly effective at recognizing patterns, generating text, and synthesizing existing information in novel ways.  
But here’s the rub:

- **No Contextual Understanding:** AI lacks the domain expertise and intuition required to assess edge cases or fully grasp the implications of design decisions.
- **No True Creativity:** While AI can recombine existing elements in unexpected ways, its "creativity" stems from probabilistic reasoning, not from subjective experience, intentionality, or insight.
- **No Accountability:** Software projects don’t live in isolation—they exist to solve real-world problems.  
  An engineer must account for business needs, user behavior, and technical feasibility, which requires human judgment and responsibility.

### What AI Can Do (And What It Can't)

For now, AI tools are exceptional at **automation and augmentation** rather than outright replacement.  
They speed up repetitive tasks—such as boilerplate code generation, bug fixes, or refactoring—but lack the capacity for strategic thinking or long-term planning.

Take software architecture as an example.  
An AI can suggest patterns or frameworks based on existing designs, but defining the architecture for a mission-critical system—balancing scalability, performance, and security—remains firmly in the hands of human engineers.

### A Mindset Shift for Engineers

As a software engineer, the key is to think critically about where AI adds value and where it falls short.

Instead of viewing AI as a competitor, treat it as a collaborator.  
By leveraging AI for grunt work, you can focus on higher-value tasks:  
crafting innovative designs, optimizing user experiences, and solving problems that AI simply cannot understand at a conceptual level.

The truth is, your skills remain highly relevant—so long as you adapt.  
The engineers who thrive in this new landscape will be those who augment their capabilities with AI while continuing to bring their unique human creativity, expertise, and empathy to the table.

So, why is AI still unable to replicate the work of an experienced engineer?

Let’s dive deeper into the nuances.

# The Essence of Software Engineering

At its core, software engineering is about understanding needs—real-world needs. It’s about translating chaotic, ambiguous problems into clean, structured systems.

It doesn’t sound super complex, right?

Well, it’s super-complex.

For example, let’s say the goal is to build a mobile application for booking fitness classes. One solution might be to create a simple interface that allows users to choose a class and reserve a spot. But is that really enough? What if users also want to see instructor profiles, class reviews, or even receive reminders based on their schedule? Should it integrate with their fitness tracker or offer personalized class recommendations?

The search space for building a useful app is vast. The key point is that software engineers don’t just dive into coding an app without fully understanding the deeper needs of the user. Humans have the ability to grasp context, consider variables like user preferences, time, convenience, and even emotions. This is something machines can't do without clear direction from human insight.

And this is where AI falls short. Sure, AI can generate code, but it doesn’t truly *understand* the problem. It doesn’t think as a human, it lacks specific business context, and that make it fundamentally different. It cannot sit down with stakeholders and clarify their needs. It can’t challenge assumptions or deal with conflicting requirements. All it can do is guess based on patterns it’s been trained on. And often, that guess is way off the real needs of the users, because those needs are chaotic, and according to my experience, most users don’t really know what they want.

In my opinion, this is where human engineers shine. We understand nuance. We can think creatively and adapt to changing environments.

Why does this matter? Because the world needs critical thinking. As long as humans are complex, messy creatures with changing needs, there will always be a demand for someone who can turn those messy needs into clean software solutions.

So, I believe we should focus on our problem-solving skills instead of writing code because our ability to define and solve problems is going to be much more valuable. Anyways, source code is a way we found to instruct computer so that they can solve human problems.

And you might be thinking: What about the software engineering tasks that are more straightforward and annoying for humans? Could AI take over there? Let’s dig into that.

# Engineering Value Is in the Details

One of the biggest challenges in software development is that it’s error-prone at almost every step. If you misunderstand a customer need, Boom, you end up solving the wrong problem. Misinterpret a functional requirement and you will end up designing a system that’s overkill—or worse, one that underdelivers.

For example, imagine you’re tasked with building a real-time messaging system for a customer support team handling thousands of chats per day. The natural assumption might be to scale up with advanced microservices and expensive infrastructure to ensure immediate response times.

But in the prototyping phase, a more practical solution could involve implementing a simple queuing system to handle chat overflow during peak hours, reducing the need for costly infrastructure while keeping the user experience intact.

AI, on the other hand, would probably go with the more “typical” solution, like adding servers and microservices, because the majority of documentation resources to build these kind of system explain how it’s done. AI doesn’t have the creativity to consider alternative options. It follows the existing data, the information on what is has been trained on.

Personally, I’ve seen this play out time and again in my own work. The difference between a good solution and a great solution often comes down to human ingenuity—finding that less obvious, but more effective approach.

Why should you care? Because the real magic in engineering happens in those transitions—from needs to requirements, from designs to code. These steps are where human insight makes all the difference.

And of course, automating the boring parts is a great thing (it’s what engineers have been doing since the early days). However, today is even more important to look for smarter ways to solve problems, because AI might offer you a set of solution, but it’s your job to consider all the possibilities and make a critical evaluation of each of them.

So, what does this mean for the whole software industry, where things are constantly in flux? Can AI keep up with those changes?

# The Dynamic Nature Software Development

The concept of agile software development is all about flexibility. It’s about adapting to change, whether that change comes from shifting market conditions, evolving user needs, or even new regulatory requirements. It’s a fast-paced, ever-changing process. And that exactly where current AI systems based on large language model struggle the most.

For example, image you are mid-way through a project when suddenly, the market shifts. The client wants to pivot. You need to revise your priorities and adjust the entire architecture of your software. Can an AI do that? Yes it can. But, what if the conditions are completely new because of an event that has never ever happened before (like, for example a market crash, or a natural disaster).

AI operates based on past data and predefined assumptions. It’s not going to sit in a meeting with you, hear the client’s concerns, and propose a totally new approach.

Now, don’t get me wrong. Current AI can assist in agile development, especially when it comes to routine tasks like generating boilerplate code or testing. But when it comes to adapting to new, unexpected demands, they show some limitations.

AI will not replace programmers but will fundamentally change the development landscape, making human creativity and problem-solving essential. Adaptability is one of the most valuable skills in software engineering. As long as the world keeps changing, there will always be a need for people who can pivot quickly and come up with creative solutions.

Now, let’s talk about the situations where AI actually excels in software engineering, and how we can leverage that.

# Where AI Can Actually Help

Take code reviews, for example. I think it’s very tedious. You’ve got to sift through line after line of someone else’s work, looking for bugs, performance issues, or security vulnerabilities. AI agents, like those integrated on GitHub or other platforms, can help automate parts of this process, flagging potential issues before a human ever gets involved.

It can help with tasks that are repetitive, like generating boilerplate code, adding unit tests,  or writing documentation. It can analyze large datasets and suggest optimizations. Indeed, many surveys suggest that developers are eager to get away these tasks to AI assistants.

But when it comes to making the final call, the human touch is still essential.

In my opinion, the future isn’t about AI taking over but about humans learning how to work alongside AI to be more efficient and effective. And the engineers who can collaborate with AI will be the ones who thrive in the future.

So, let’s integrate AI into our workflows where it makes sense—use it to handle the boring stuff, so we can focus on the creative and complex tasks.

And I know what you may be thinking, if AI can assist in low level task, that means it could eventually replace less experienced engineers?

# Can AI Replace Entry Level Engineers?

Well, the answer is... maybe.

But…

Less experienced engineers don’t just exist to do the easy stuff. They’re learning, growing, and building the experience they need to tackle more complex problems down the road. AI might be able to take over some of the simpler tasks, but it can’t replace the learning process.

For example, if you have been around for a while in this industry, think about how much you learned from your first projects. It wasn’t just about writing down the code, because programmers are not typists. It was about understanding the problem, communicating with other developers, figuring out how to structure the solution, and dealing with unexpected bugs along the way.

If we remove the possibility of learning that stuff, and put AI systems in place, then it’ll harder for the young people to gain that kind of experience or develop the necessary intuition to solve real-world problems.

So, if you’re a entry level engineer, your goal should not be to compete with AI. It should be to delegate the tasks that AI can efficiently handle, and moving on to the bigger, more interesting challenges.

So, keep pushing yourself. Don’t get too comfortable with the easy tasks—just use AI can do those. Focus on learning the skills that only humans can master.

# Conclusion

So, I don’t think AI is going to replace software engineers—at least not anytime soon. And sure,  it can handle repetitive tasks and assist in certain areas, but the real value coming from software development still requires human intuition, creativity, and problem-solving.

Because, again, software development isn't just about writing code, it’s about solving problems. These problems are often really messy, poorly defined, and deeply tied to human intuition and creativity. The main task of engineers is to balance conflicting priorities, adapt to ever-changing environments, and navigate the ambiguous waters between business needs and technical solutions.

If there is one way to keep our jobs safe, I think it is to stay ahead of the curve.

See you in the next one, bye.

# External Resources

# Footnotes

[^1]: This is understandable because the traditional media is in the business of creating sensational headlines and monetizing our attention.
