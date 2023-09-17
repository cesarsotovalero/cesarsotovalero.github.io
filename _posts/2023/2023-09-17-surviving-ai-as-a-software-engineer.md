---
layout: post
title: Surviving the AI Revolution as a Software Engineer
subtitle: Is there still any hope?
tags: ai
description: The next wave of extremely powerful and specialized AI models is coming, and it will likely revolutionize software engineering as we know it. As developers, we need to get the skills to surf the wave and keep our jobs. As with every technological breakthrough, AI will create new jobs and destroy others. In this article, I will focus on how you can keep your job in this new world dominated by AI. My focus is on software engineering jobs, but most of the principles I mentioned also apply to other professions.
keywords:
  - software engineering,
  - Large Language Models (LLMs),
  - career advice,
  - Artificial Intelligence,
  - the future of software development
image: ../img/posts/2023/2023-09-17/head-down-teddy_cover.jpg
share-img: ../img/posts/2023/2023-09-17/head-down-teddy_cover.jpg
show-avatar: false
toc: true
date: 2023/09/17
author: cesarsotovalero
published: true
---

Dear software engineer, as you may already know, AI is here to stay.
It's inevitable, and it changes everything.
If you are worried about what [OpenAI's ChatGPT](https://chat.openai.com/) can do, hold on because it's just the beginning.
The next wave of extremely powerful and specialized AI models is coming faster than predicted.
In the next years, AI's massive adoption will affect every single aspect of our lives.
But this article is not about the issues of an AI-powered society, prophesied decades decades agro by science fiction writers.
Instead, I will focus on its effects on the software industry.
This article reflects my opinion on how developers can protect their jobs in a new world dominated by AI.
My focus is on software engineering jobs, but most of the principles mentioned here apply to any other profession as well.
In this survival guide, I cover only the facts that I believe will hold despite the imminent improvements of AI models.
For example, I assume that [Generative AI](https://www.nvidia.com/en-us/glossary/data-science/generative-ai/) will eventually become better than humans at creating any kind of digital content, including not only source code, but also images, music, or video.[^5]
So, what can we do to keep up with this wave of changes?

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-09-17/head-down-teddy.jpg alt:"A lovely teddy bear thrashed in the backyard together with a keyboard" %}
  <figcaption class="stroke"> 
    &#169; Once we said goodbye to our lovely teddy bear, ...does the keyboard comes next?
  </figcaption>
</figure>

# The game has changed

[//]: # (My predictions two years ago)
In July 2021, I published a blog post titled "[Hermit Programmers are Dead](../blog/hermit-programmers-are-dead.html)."
My post was hardly criticized on Hacker News (HN), receiving more than [100 negative comments](https://news.ycombinator.com/item?id=28744671).[^1]
Sadly, the main point I wanted to make back then was misunderstood.
The reason (I want to believe) was my ~~still~~ precarious writing skills.
In essence, I argued that the rules of the game for software developers have changed so much due to AI and cloud computing, that the archetype of the solo-programmer has become obsolete.
I argued that the ability to write code is not what makes a programmer successful, but instead, their social skills are.
I predicted that this situation would just exacerbate over time.
For example, I said "writing a bunch of code is not going to be a cool thing to do anymore," and "only our unique human skills will be valued in the future."
In response, someone on HN wrote: "this person has no idea what they are talking about."
It's fun, but many things have changed since then.
Let me explain.

[//]: # (What has changed since then)
Two years later, it turns out that my predictions were right, particularly those about the threat of AI to developers.
Today, AI has not only proven to be better than humans at playing [Chess or Go](https://www.deepmind.com/research/highlighted-research/alphago), but it has also become better at creating all kinds of text-based content, especially source code.
The improvement of Deep Learning (DL) algorithms, advancements in neural architectures such as transformers, ever-increasing computational capabilities, and the accessibility of massive training datasets extracted from the public internet have brought about a revolutionary transformation in the field of Natural Language Processing (NLP).
This has led to the emergence of Large Language Models (LLMs),[^15] which have proven to be capable of approximating human-level performance on many evaluation benchmarks that require creativity and reasoning.[^7]

[//]: # (What is unique from LLMs)
The unique characteristic that makes these modern AI systems different from previous Machine Learning (ML) models is that they are generative instead of discriminative.
They have observed large amounts of data and learned patterns, such that they can create new data that have never existed before.
These generative abilities open a wide range of new possibilities for software developers.

In summary, the key to LLMs' tremendous success lies in the combination of the following three major improvements:

<aside class="quote">
    <em>“With great size (of parameters) comes great power (of AI).”</em> 
</aside>

1. **Model's complexity.** Research evidence that at some point after GPT-3's 175 billion parameters some magic happens and the text-based models get incredibly powerful.[^4] The size of ML models, measured by the number of parameters (i.e., the number of computed weights between artificial neurons' connections), has increased exponentially in the last few years. This has been possible thanks to the availability of more powerful hardware, such as [dedicated NVIDIA GPUs](https://www.nvidia.com/en-us/data-center/h100/), and the development of more efficient training algorithms, such as the [Adam's](https://arxiv.org/abs/1412.6980) stochastic optimization and [attention mechanisms](https://arxiv.org/abs/1706.03762), which efficiently computes adaptive learning rates for each parameter, improving the back-propagation technique.
2. **Training size.** Researchers discovered that LLMs capabilities increase significantly when augmenting the size of the training dataset.[^3] In the case of [Generative Pre-trained Transformer](https://en.wikipedia.org/wiki/Generative_pre-trained_transformer) (GPT) models, they are presumably trained on the whole internet's public data. This includes the whole Stack Overflow's Q/A database, GitHub's entire codebase of ~~public~~ open-source projects, frameworks and APIs, all sources of technical documentation, and overall all the code that has ever been published on public websites.
3. **Human feedback.** Research has shown that AI's capabilities improve exponentially when the system is able to interact with humans. AI models fine-tuned with human feedback via [Reinforcement Learning](https://en.wikipedia.org/wiki/Reinforcement_learning) (RL) perform better than previous models with a larger training size.[^2] Today's ChatGPT models are instructed and refined continuously by human experts and users in general. First, with a set of labeler-written prompts, and second, with the user's prompts submitted through the OpenAI's API directly.

<aside class="quote">
    <em>“Foundational models are general-purpose LLMs trained on massive amounts of data using self-supervision at scale, they can solve a wide range of downstream tasks.”</em> 
</aside>

[//]: # (The rise of AI for developers)
It's important to notice that Generative AI, as we know it today, is a layered system.[^19]
On the bottom layer are LLM Foundational Models (FMs),[^9] followed by a "simulacra" of context-specific training data.
This context-specific layer is improved through constant interactions with the model (e.g., refining its purpose, adding specifications, and/or increasing domain knowledge datasets).
The part above the simulacrum is the personality of the model, the consumable layer, refined with additional human feedback.
This layer on top is what ultimately determines the value of the AI system.
In the context of source code, the personality of the model is the programming language, the coding style, the specific framework, and the business specifications.

<aside class="quote">
    <em>“Simply put, if you don't use AI (as a developer) today, you wake up out of the market tomorrow morning.”</em> 
</aside>

[//]: # (The rise of AI platforms from large companies)
Big tech companies are heavily competing to become the next AI platform for businesses and developers.
Microsoft is at the head of the race today, leveraging its AI ecosystem by directly partnering with OpenAI, deploying its successful GPT models on top of its Bing search engine and [GitHub Copilot](https://github.com/features/copilot).
On the other hand, Meta released its [<i class="fab fa-github"></i> LLaMa 2](https://github.com/facebookresearch/llama) trained model and made it open-source (good move Mark!), whereas Google struggles to not miss out the party and just deployed its Bard[^10] model on top of its [Duet AI](https://workspace.google.com/blog/product-announcements/duet-ai) platform.

[//]: # (The threat of AI for developers)
The bets have been gigantic because AI has the potential to radically disrupt the software industry.
Bill Gates believes it's the biggest move forward since the invention of the Internet.
Utilizing AI can be more cost-effective compared to employing developers.[^13]
Moreover, its impressive capacity for labor-saving and problem-solving is accessible to a broad audience, including managers and stakeholders.
Developers stand to benefit significantly as AI can assist in suggesting code enhancements, facilitating code completion, orchestrating refactoring, generating documentation and tests, conducting performance and security analyses, and even engaging in rubber duck debugging.
The potential applications are virtually limitless.
As AI continues to evolve, it is expected to permeate every facet of information flow services, spanning from the automation of email responses to advanced data analytics that can autonomously create plots and synthesize large volumes of data into digestible summaries, thereby expediting decision-making processes.

<aside class="quote">
    <em>“A fool with a tool is still a fool.” -- <cite>Grady Booch</cite></em> 
</aside>

[//]: # (Personal experience with AI)
From my personal perspective, I think it's important to understand that, although powerful, current LLMs are all basically statistical models of words.
No doubt they are useful for developers, as they provide a new form of generative search capabilities.
As an example, imagine a developer working in the FinTech industry, a common task is to map [ISIN numbers](https://en.wikipedia.org/wiki/International_Securities_Identification_Number) of stocks.
Today's GitHub Copilot not only retrieves this number automatically in the IDE, but it can also tell the country for a particular stock, and more associated information as prompted.
This capacity to search faster and more accurately makes AI extremely useful for routine coding tasks.

[GitHub Next](https://githubnext.com/) is setting what would be the standard for the next generation of software development tools.
Some are starting to believe that AI will very soon go beyond assisting developers, and start firing them.[^8]
The idea is not that crazy.
If AI will make pull requests, review code, and create documentation... the question is: What [30+ million worldwide developers](https://www.griddynamics.com/global-team-blog/number-software-developers-world) are going to do with all this extra time? Will they even be necessary?


# Our survival backdoors

To survive the AI revolution, we need to focus on the skills that make us unique as humans, and at the same time are still valuable in the job market.
It is these very skills, grounded in our innate human attributes, that pose a substantial challenge for machines to mimic or automate, thereby standing as our defense against potential obsolescence. The following is a list of 10 skills that I believe will not just be beneficial but absolutely vital in the next years:[^6]

[//]: # (---------------------------------------------------------------)
**Getting understanding.**
First off, it's really important to deeply understand what AI can do right now.
For the moment, these systems can't work without people telling them what to do.
We are the ones in control (for now), giving them all the necessary instructions.
Managers, who make big decisions, often don't have the ~~knowledge~~ and time to work directly with these AI systems.
Consequently, developers who understand AI technology will be able to serve as a communication bridge between thinkers and makers, and this is a skill that's already becoming more and more important.
Looking back at history, during the Industrial Revolution, we can see a similar pattern where machines boosted how much we could get done, but they still needed people to operate them.
That's why, to make the most of what AI can offer now, it's key to learn about all the different things it can do.
This is key not just to keep up, but to lead the way in using this technology wisely and effectively.

[//]: # (---------------------------------------------------------------)
**Thinking critically.**
LLMs today provide factual answers based on existing knowledge or through the analysis of large amounts of data.
However, there is a large set of problems that are not clearly defined and that require special [critical thinking](https://www.criticalthinking.org/pages/defining-critical-thinking/766), which is an almost unique human skill.
For example, designing scalable systems for a particular use case, or deciding on the correct data migration strategy for a particular company is not something that can be solved by AI today because they require multiple layers of abstraction and a deep understanding of the problem domain.
We need to learn how to make better questions and formulate them clearly and precisely in a way that AI can help us solve them.
Issues such as ethical concerns, privacy, and security are also areas where AI is not yet capable of making absolutely correct decisions.[^14]

[//]: # (---------------------------------------------------------------)
**Staying opinionated.**
Empirical research on the use of LLMs shows that the ability to critique will be a key skill needed in the future.[^11]
In other words, if you are a passive conformist developer who just follows orders, you are in trouble today because machines can already do that better than you.
On the other hand, I believe that human opinions will remain valuable in the future simply because AI will never take full responsibility for its mistakes.
Moreover, I think we humans love opinions, and we will always prefer to hear them from other humans.
Taking the example of Linus Torvalds, the guy has not only improved Linux continuously through his opinionated (and often hardly criticized) architectural decisions.
Linus has not only made controversial decisions but has also shaped discussions in the software development field at large.
This kind of personal touch, coupled with sharp observations and responsibility is a space that AI is unable to reach at the moment.

[//]: # (---------------------------------------------------------------)
**Being creative.**
AI currently struggles greatly with understanding and generating human humor, a task that demands a deep-rooted understanding of nuanced emotions, sarcasm, and cultural references, all of which are intrinsic to our nature.
The capacity to create, to conceive something from nothing, or to find unexpected solutions to problems is a distinctly human trait that goes beyond the capabilities of LLMs.
Being a font of originality, much like innovators such as Steve Jobs, can foster environments ripe for groundbreaking advancements.
Jobs’ unique approach to technology, which fused functionality with artistry, revolutionized personal computing and the mobile phone industry.
Similarly, developers nurturing their creativity can become irreplaceable assets, bringing a depth of vision and a personal touch to projects that no AI can replicate.
Thus, safeguarding our innate creativity is not just essential, it's the cornerstone of innovation, steering us toward uncharted
territories and fostering truly revolutionary developments.

[//]: # (---------------------------------------------------------------)
**Taking initiative.**
Right now, AI can't take the first step on its own, it needs humans to guide it.
Even though AI can help find solutions, it can't fully replace programmers because creating a program involves deeply understanding a problem and then breaking it down step by step to solve it, which requires a human touch and personal initiative.
Knowing what problems to solve is a huge part of the battle.
For example, humans have the ability to uncover product market fit in areas where AI can't just because they can't understand new human needs.
Let me say again: programming isn't just about asking AI to solve problems,
it's about programmers using their expertise and drive to find new problems and their respective solutions themselves.
This means that the ability to take initiative will remain a vital skill in the years to come.

[//]: # (---------------------------------------------------------------)
**Showing empathy.**
AI is better than humans at writing code, just as a calculator is better at math.
You will never get in love with a calculator (unless you're really weird).
The same applies to AI, it will never be able to understand the human condition, and therefore it will never be able to empathize with us in the same way another human will do.
Empathy is a uniquely human trait that allows us to understand and share the feelings of others, and it is a key component of our social interactions.
Future developers will need to be able to empathize with their users and managers, and understand their needs and desires.
I don't mean being a clown, but learning how to make the difference w.r.t. AI in the human side of the business will become more important than the ability to write boilerplate code for sure.

[//]: # (---------------------------------------------------------------)
**Staying curious.**
We have a potential problem in the tech industry: the loss of curiosity!
In the past, solving a coding issue meant reading many Stack Overflow posts and doing a lot of experiments on your own.
But now, AI can hand over the solution instantly.
While this allows us to do things we couldn't do before, it unfortunately removes the excitement of figuring things out ourselves.
To really benefit from AI, we have to stay curious, willing to try new things, learn, and even fail (something AI is not motivated to do).
It means asking questions like, "What happens if I change this parameter here?" or "What if we approach the problem from a different angle?"
Moreover, information overloading is already an issue that will only get worse due to AI-based demotivation.
There is so much to learn nowadays that choosing a focus area can be daunting, and there is going to be a perception that AI will do everything better than us.
That's why we'll likely need more mentors to help package knowledge neatly and guide our learning journeys.
Cultivating curiosity will be a key skill for developers in the future.

[//]: # (---------------------------------------------------------------)

**Nurturing storytelling.**
Machines lack a couple of things we all have: a natural understanding of time and a catalog of personal memories.
This means they can't tell stories that truly connect with people the way we can. Even though artificial agents might learn to understand physical space through sensors and to measure time, truly grasping the concept of time is a much harder task for them.
I think being able to tell a good story is a vital skill for developers. It lets us explain complex ideas simply and engagingly.
What happened one year ago when the server went down? How did you solve it? Why my previous post on this same topic was so criticized on Hacker News?
As you see, the ability to craft passages as a good storyteller is a fuel of engagement and a craft that AI will struggle to master.

[//]: # (---------------------------------------------------------------)
**Understanding causality.**
Right now, talking to an AI is like chatting with someone who knows a lot of facts but doesn't really understand what they mean or how they connect. For example, if a software developer is dealing with a server crash caused by too many people visiting a website at once, an AI might be able to help find the exact moment the server failed. However, it wouldn't be possible to naturally understand that a real-world event, like a viral marketing campaign just released, was the cause of the sudden increase in website visitors and ultimately the crash. Basically, AI has a hard time understanding cause-and-effect relationships, which is something that comes naturally to humans.

[//]: # (---------------------------------------------------------------)
**Becoming researchers.**
AI can help you find answers to common questions easily because it uses as a basis of its reasoning information that already exists.
However, when asked about creating something totally new or predicting future trends, it struggles because it can't think or imagine as humans do.
For example, it can suggest well-known tools for building a website but can't help much with innovative ideas for a machine learning algorithm that's never been made before.
So, in the future, being able to perform research and find solutions to new problems will be a really important skill.
This might even lead more developers to choose research jobs over positions at big tech companies to stand out in their field.

# The unpredictable future

Software development is in constant evolution.
In the past few decades, revolutionary tools like IDEs, VCS, and Cloud Computing have changed the way we create and maintain software.
However, AI seems to be something different.
It not only performs many programming tasks better than us but also creates new tasks by exploring a space of possibilities.[^17]
Unlike existing tools, AI can synthesize answers to questions and generate new content while prompted.
Thus, we are now entering an uncertain era of AI-augmented software development.
This brings new challenges and possibilities.

I'm particularly amazed by the capabilities of Generative AI for complex problem-solving.
Recent research has shown that through the use of [Socratic questioning](https://en.wikipedia.org/wiki/Socratic_questioning), AI can introspect itself, learning from its own mistakes, and provide guidance on how to solve deep human unknowns, such as proving P &#8800; NP.[^12]
AI can not only explain but also provide rigorous mathematical proofs (and code) to address such problems.
In the future, it will assist us with every single practical decision, and eventually we will trust it more than our own intuition.
For instance: "What would be the impact of changing the database schema in this or that way?"
We'll soon start shifting to AI-based decision-making, and the question is: At what cost?

Automated software engineering will keep expanding.[^16]
In the future, AI will improve code quality, transpile to different languages, and even create new DSLs.
This is very important since many critical systems are written in COBOL and other outdated programming languages.
Such kind of legacy poses challenges for companies, especially in the financial sector where it is critical to find developers with the necessary skills to maintain them.
Generative AI will not only explain how cryptic COBOL code works but also translate it to modern languages such as Python or JavaScript.
However, we need to be careful with current AI systems.
If your code handles sensitive data, like in a bank, be aware that it is not safe to use AI-based as your code is being sent to third-party servers.
Very soon companies will deploy their own open-source models and be able to protect their data.

From the business perspective, AI is expected to become a game changer.
Business stakeholders are betting on AI to be a miracle solution, reducing costs by 10x or more.
They believe it will lessen their dependence on highly paid developers, making the business more cost-efficient.
This development could bring new challenges to the software development workforce.
As in the traditional economy, everything is about price once a certain quality is achieved.
But AI seems to be revolutionizing the tech industry, where the cost of an engineer becomes irrelevant, overshadowed by the potential for high productivity and innovation.
Consequently, a highly productive developer could create significantly more value than a less productive one, despite higher hiring costs.

A limitation of current AI technology is that it is neither deterministic nor explainable, sometimes restricting its adoption in critical systems.
The motto "Don't trust, verify" is still relevant at present for AI-assisted developers.
This means that to use these models properly, one needs to be a senior engineer.
Senior developers get a big boost from this technology because they understand the response of an AI.
For example, if you are a junior you don't know exactly what to ask, and you don’t understand the response.
However, the usual path to becoming a senior  (i.e., learning from mistakes under the guidance of a mentor)  might be disrupted as companies replace junior roles with AI.
This raises the question: What happens if we no longer have seniors mentoring juniors?

Note that in the last decade, contrary to their initial intentions, social networks have eroded genuine social connections and trust among people.
Spending several hours a day on these platforms has been linked to alarming declines in mental health and critical thinking abilities.
Societies in many countries are deeply polarized due to the pervasive “fake news,” consumed without critical evaluation.
Similarly, AI could emerge as the new opium for the masses.
Tools like ChatGPT could potentially replace professional independent media, propagating untraceable and inexplicable fake news.
As developers, we must actively engage in addressing these risks.
I hope history will become different this time, and a more explainable AI will offer more transparency instead of becoming a tool for better manipulation and social disengagement.
In any case, the future of AI will be shaped by developers.

What is next? Nobody knows, but there is no doubt that AI will keep grounding in power and experience.
We are currently at the phase of AI’s learning the written world, next it’ll move towards gaining a better perception of the world through vision, audio, touch, etc.
Next step AI systems will be able to interact with the world through physical actions, becoming sociable agents, indistinguishable from humans that learn from experience, autonomously.
Eventually, AI could outsmart people, taking power.
But this is not going to happen in the next 10 years.
Or at least, I hope so.

# Conclusion

Due to their new capabilities, AI has become an indispensable tool for us as software developers.
It's something we can use as both a source and transfer of value, without even understanding it.
For me, it is disruptive to see how current AI models are better than humans at most coding tasks, reducing implementation efforts by several orders of magnitude.
Thus, Generative AI will accelerate software development.
Yet we need to be aware of all the marketing hype and false shortcuts, promising us building secure, resilient software based on a technology currently packaged in a shiny black box that most people (including me) don't understand.

In a world of generative AI and low code, it's hard to imagine a future where software engineers are as highly paid as today.
Many traditional roles, such as programmer, will change.
With the current evolution speed, we can expect that within the next three years, most software companies will have an AI-augmented development and testing strategy, up from very few today.
Most internet content and mobile apps will be fully or largely supercharged by generative AI.
Software developers will need new competencies, such as maintaining automatically generated software, feeding machine learning algorithms, and exploring behaviors that are not explainable with AI.

With AI, everything that is boring to do and takes time becomes very very fast, as long as you know the subject.
It makes you many times more productive.
For example, they can suggest the full specification to design an API in seconds (this normally takes days).
Drawing a parallel to the science fiction novel "[The Forever War](https://en.wikipedia.org/wiki/The_Forever_War)" (1974), where humans are fighting an interstellar war against an alien civilization, and the soldiers are sent to the front line at near light speed, only to return to Earth decades later, we can see how AI is changing the rules of the game for developers.
We might find that it is more beneficial to start anew with updated methods, rapidly advancing and potentially surpassing those who began later, due to the fast pace of AI development.

Yet, for now, AI can only provide a mathematically driven synthesis of results, generative AI does not have a "real" understanding of human matters.[^18]
In fact, it does not know the real world.
The language model produces its “facts” with nice-to-read text or code, but it is the user's responsibility to verify these statements.
As a developer, things such as getting a good understanding of how AI works, developing critical thinking, staying strong with personal opinions, creativity, empathy, initiative, and curiosity are the most important characteristics that distinguish you and your outputs from those produced by the most powerful AI.

# Footnotes

[^1]: I decided not to edit or improve the original article to avoid losing the context of the discussion.

[^2]: See ["Training language models to follow instructions with human feedback"](https://arxiv.org/abs/2203.02155)

[^3]: See ["GPT-4 Technical Report"](http://arxiv.org/abs/2303.08774v3)

[^4]: See ["Sparks of Artificial General Intelligence: Early experiments with GPT-4"](https://arxiv.org/abs/2303.12712)

[^5]: Eventually AI will know practically everything. It will include references to where the information was taken so that we can fact-check the validity of the information.

[^6]: This guide is for < 10 years only, as nobody can predict what will happen after that.

[^7]: See ["How Close is ChatGPT to Human Experts? Comparison Corpus, Evaluation, and Detection"](http://arxiv.org/abs/2301.07597v1)

[^8]: See ["How Soon AI Will Start Firing Programmers?"](https://cacm-acm-org.focus.lib.kth.se/blogs/blog-cacm/276029-how-soon-ai-will-start-firing-programmers/fulltext)

[^9]: See ["LLaMA: Open and Efficient Foundation Language Models"](http://arxiv.org/abs/2302.13971v1)

[^10]: Regarding Google's Ba~~r~~d, I can't think of a worst name for a product: Levenshtein's distance to "Bad" = 1.

[^11]: See ["Taking flight with copilot: Early insights and opportunities of AI-powered pair-programming tools"](https://dl.acm.org/doi/10.1145/3582083)

[^12]: See ["Large Language Model for Science: A Study on P vs. NP"](https://arxiv.org/abs/2309.05689)

[^13]: At the time of writing, the subscription for ChatGPT 4.0 is of $25/month.

[^14]: See ["ChatGPT is not all you need. A State of the Art Review of large Generative AI models"](http://arxiv.org/abs/2301.04655v1)

[^15]: See ["A Survey of Large Language Models"](http://arxiv.org/abs/2303.18223v11)

[^16]: You can read the proceedings of the [Automated Software Engineering](https://conf.researchr.org/home/ase-2023) (ASE) conference to get a sense of what is coming.

[^17]: See ["Theory of Mind May Have Spontaneously Emerged in Large Language Models"](http://arxiv.org/abs/2302.02083v3)

[^18]: See ["A Multitask, Multilingual, Multimodal Evaluation of ChatGPT on Reasoning, Hallucination, and Interactivity"](http://arxiv.org/abs/2302.04023v2)

[^19]: See ["HuggingGPT: Solving AI Tasks with ChatGPT and its Friends in Hugging Face"](http://arxiv.org/abs/2303.17580v3)
