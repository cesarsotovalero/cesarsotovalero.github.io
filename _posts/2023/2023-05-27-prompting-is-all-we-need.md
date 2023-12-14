---
layout: post
title: Prompting is All We Need
subtitle: Is this the end of software engineering as we know it?
tags: sarcasm
description: |
  Today's AI systems can generate code cheaper and faster than us. But AI still craves guidance. So, prompt engineering is revolutionizing software development as we know it. The traditional era of software engineering is nearing its end. Coding practices are evolving, and so are we!
keywords:
  - ChatGPT,
  - prompt engineering,
  - AI,
  - software engineering,
  - productivity
image: ../img/posts/2023/2023-05-27/pino_pizza-cover.jpg
share-img: ../img/posts/2023/2023-05-27/pino_pizza-cover.jpg
show-avatar: false
toc: true
date: 2023/05/27
author: cesarsotovalero
published: true
---

I'm a software engineer at heart.
As such, a big chunk of my world revolves around solving problems with code. 
Lately, though, I've found myself avoiding writing code (and everything else with a text format).
But writing is one of the most gratifying activities for me (once the written piece is done, of course).
So what has changed?
I've even lost interest in looking at ~~poorly written~~ API documentation.
Books, articles, and even tweets are starting to be perceived as too large for me now.
Googling and reading Q&A threads in StackOverflow is becoming less appealing than what they used to be.
Definitely something is happening, and it's not just the usual slump.
But at the same time, it looks like my ~~laziness~~ efficiency has increased considerably.
Contradictory?
After giving it some thought, I understood what's going on: I'm **transitioning into a prompte**r!
Let me tell you what it is about.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-05-27/pino_pizza.jpg alt:"The future of software will have the same destiny that pizza production" %}
  <figcaption class="stroke"> 
    &#169; Do you know how to make a pizza from scratch? I don't, and I'm afraid the same will happen in the software industry. Photo of miniature model of the Pizzeria Pino, the fist Stockholm's pizzeria, funded in 1976, and exposed in the <a href="https://maps.app.goo.gl/ohfdw8atqpv2WjiTA">Stockholm Stadsmuseet</a>.
  </figcaption>
</figure>

<aside class="quote">
    <em>“A prompter [in a theatre] is a person who prompts or cues actors when they forget their lines or neglect to move on the stage to where they are supposed to be situated.” - <cite><a href="https://en.wikipedia.org/wiki/Prompter_(theatre)">Wikipedia</a></cite></em> 
</aside>

Once upon a ~~long~~ time, software was a strange thing.[^4]
Even stranger was the people who build it: **programmers**.
Or were they scientists?
I'm too young to know exactly what they were called.
Anyway, they were an unusual breed of people.
They were mathematicians, physicists, or pure engineers who mastered cryptic programming languages to tackle mostly practical problems.[^3]
These individuals possessed advanced reasoning skills. 
They could understand complex systems (such as those for financial transactions written in COBOL), and implement algorithms like QuickSort in 5 minutes or less.

But that was a long time ago when software was still [eating the world](https://a16z.com/why-software-is-eating-the-world/).
Nowadays, software is everywhere.
It already [ate the world](https://www.wsj.com/articles/software-ate-the-world-and-soon-it-will-write-itself-11607037000?reflink=desktopwebshare_permalink) and digest it.
Its output is indispensable, just like salt for our food. 
In every industry, in every company, in every home, software is a necessary ingredient.
So the crew of software cookers has grown at a very fast speed.
But the world had not enough mathematicians, or engineers, to satisfy the demand for programmers.[^6]
And as with any other industry, the higher the demand, the bigger the push humanity makes in order to improve the tools to simplify the production machinery.

Over the past two decades, a new class of "programmers" has emerged and permeated the industry: **software developers**.
The prerequisites have shifted dramatically.
The average software developer doesn't need to understand [Fourier Series](https://en.wikipedia.org/wiki/Fourier_series) anymore to get a decent job offer.
Indeed, she doesn't even need to know how a computer actually works.[^5]
It's enough to master a particular framework, a library, or even a single digital tool.
And bang! 
The wheels that keep software product lines moving will be ready to go.

But I've seen the panorama shifting in the last few months.
What if I told you that knowing how to code is no longer necessary?
Yes, that's right
Because now [computers can generate code for us](https://doi.org/10.5281/zenodo.7644359), automatically.
I'm not talking about in-IDE code generation tools, such as templates, or refactoring aids.
I mean entire applications written by AI, from scratch.
And not only code, everything that is digital can be AI-generated too.
Even the boring stuff, like bug reports, code comments, and meeting minutes.
The new era of automated text generation has come to us developers.
And with it, there comes a new batch of fresh challenges.

# Show Me the Prompt!

It seems that coding, as a profession, has become less complex nowadays. 
This is thanks to the rise of AI tools powered by Large Language Models (LLMs).
These are Machine Learning (ML) models trained on huge amounts of ~~crap~~ text data.
Once trained, the model can generate meaningful text from a given prompt.
Interestingly, it appears that [code generation](https://dl.acm.org/doi/pdf/10.1145/3545945.3569759) is one of the most simple tasks for these models.
So we developers are not as special as we thought, ouch.
In other words, AI can write reasonably good code faster and cheaper than us.
But this article is not about AI replacing developers (I wrote about it [here](../blog/surviving- the-ai-revolution-as-a-software-engineer.html, check it out).
I believe that the price of every single line of code will decrease its value over time.
It's [supply and demand](https://en.wikipedia.org/wiki/Supply_and_demand), there's nothing we can do about it.

<aside class="quote">
    <em>“You are my master! Was that your first wish? Three wishes are yours to command...” - <cite>Aladdin and the Magic Lamp</cite></em> 
</aside>

However, there is a catch.
There is still a necessary ingredient to fuel the AI machinery: **the prompts**.
We still need humans to craft them.
So a new class of programmers has emerged.
Those who excel at writing effective prompts to tackle programming issues. 
Let me introduce you to "the prompters."

The prompter's daily task is to ask fine-tuned questions.
For that, one needs to embody the inquisitive spirit of Socrates, or perhaps that of a 5-year-old child (depending on how much you estimate the role).
The job is fundamentally [about crafting queries](https://asianjde.com/ojs/index.php/AsianJDE/article/download/749/405) in natural language:
"I got the following log message, how to fix the problem?," 
"I have a list of items, write an algorithm to sort them?,"
"My boss is annoying, what should I do?"
The next step is straightforward, just taking the AI-generated response and integrating it into the appropriate context, often directly to the production environment.
Seems like magic!

But perhaps this isn't magic after all.
It doesn't look familiar to you?
Yes, it's the exact same thing we used to do every day when searching Google and looking at Q&A threads in StackOverflow.
The big difference now is the speed and quality at which the answers are sent back to us.
We can now get answers without fully articulating the question, which is impressive!
So, goodbye to the fear of asking foolish questions in StackOverflow.
There is no more shame because AI systems are not trolling us anymore (yet).
What's better, seems like AI is increasingly surpassing us in deciphering our own challenges are.

Needless to say, this is the end of software engineering as we know it.
I expect a huge impact on the tech workforce worldwide, as this technology scales very easily (consider OpenAI's ChatGPT model, for example). 
What will I do with the extra time now that searching for answers is no longer necessary? 
Playing ping-pong with my colleagues?
Or maybe I'll just go back to the old days, when I used to read books and spend quality time with the family.

The tide of public skepticism regarding the future of Computer Science (as a career) is rising.
Formal Computer Science education is [feeling the pressure](https://www.reddit.com/r/learnprogramming/comments/1173hy3/is_ai_going_to_make_my_cs_degree_useless/).
At the same time, the number of devs ~~kicked out from~~ leaving the industry is increasing.
This is alarming to me.

But don't worry.
There is still hope.
We still have a few years left for us to adapt and improve.
And maybe we can all keep our jobs after all.
I'm talking, of course, about jump into trend to become a successful prompt engineer.

But fist, let's define our terms.

# The Prompter Manifesto

The time has come for us, prompters to establish our formal manifesto.

Here it is:

> “We, the prompters, are the new breed of programmers.<br>
> We are the experts in crafting prompts that empower AI to solve our problems.<br>
> We take all the credit from the solutions we derive.<br>
> We take the paychecks too.<br>
>
> We create value through innovative ideas.<br>
> We have regular meetings to brainstorm new ideas and create better prompts. <br>
> We break down complex problems intro promptable smaller components.<br>
> We don't write bugs, AI does.<br>
>
> We encourage a culture of lifelong prompting and skill enhancement.<br>
> We share our prompts with the community.<br>
> We have daily prompt reviews, where we blame AI for not understanding our problems.<br>
> 
> We prompted an AI to help us write this manifesto.<br>
> We will keep improving it.<br>
> We will prompt a more powerful AI in the future to write it better.”

Now that we have defined who we are, what we do, and what we don't do, let's explore how to become a successful prompter.

# The Successful Prompter

<aside class="quote">
    <em>“Prompting is not about writing questions. It's a way of looking at and solving problems.”</em> 
</aside>

The successful has a clear objective in mind.
She really understands how AI actually works.[^2]
This is necessary to know how to craft the best prompts.
Understanding the keywords from the domain and the context are key.

The successful prompter knows how to apply the principles of clear communication.
It's about being concise, precise, and unambiguous.
That way one can tweak the prompt to get the best results.
If in doubt, it may even involve calling another AI to write the prompt. 
Recursive prompting!

The successful prompter doesn't give up easily.
She experiments with different variations of prompts and evaluates the model's responses.
When the output is not so good, the successful prompt engineer knows when to flush the toilet.

The successful prompter leverages AI in favor of improving **learning**, **coding**, and **creativity**.

## Prompting for Learning

The successful prompter knows how to use AI to learn new stuff.

Here are 5 examples:

1. **Use** the Pareto Principle, which identifies the 20% of the topic that will yield 80% of the desired results, to create a focused learning plan for me.
2. **Make** a study schedule for all of the above in an appropriate number of weeks. I can study for `X` hours every Tuesday and Thursday. Include time for revision and testing.
3. **Suggest** various learning resources (like books, videos, podcasts, interactive exercises) for the above topics that cater to different learning styles to me.
4. **List** some beginner video game projects I could work on to help strengthen my C# coding skills. I'm a beginner interested in learning how to create games in Unity. 
5. **Guide** me through a visualization exercise to help me internalize the term `X` and imagine myself successfully applying it to a real-life situation.

## Prompting for Coding

The successful prompter knows how to use AI to write ~~better~~ code.

Here are 7 examples:

1. **Describe** what the following code does. Explain it to me step-by-step in plain English.
2. **Optimize** this code to be more elegant, more readable, and more efficient.
3. **Check** for any hidden bug or vulnerability in the following code.
4. **Write** a JSON document for testing with 10 articles consisting of `id`, `title`, `description`, and `timestamp`.
5. **Create** an SQL script that inserts a row in the table `users` with content delimited by triple hashtags.

## Prompting for Creativity

The successful prompter knows how to apply the new stuff just learned to do something that cannot be done by prompting.

Here are 5 examples:

1. **Make** ~~money~~ value out of the following idea (e.g., "Can you provide a summary of the main points from the article `X`?").
2. **Create** a new product or service based on the stuff just learned?
3. **Humanize** the stuff just learned (i.e., shaping it in a way for humans to understand).
4. **Teach** the stuff just learned to other colleagues so that they get to know how smart I am.
5. **Write** a blog post about the stuff just learned?

# Prompts' Wall of Fame

Here are some of my favorite prompts, most of them are inspired/modified from <i class="fab fa-github"></i> [awesome-chatgpt-prompts](https://github.com/f/awesome-chatgpt-prompts):

[//]: # (Proofreader)
<details>
  <summary>Proofreader</summary>
  <code>
  I want you act as a proofreader. I will provide you with English texts one-by-one and you will review them for any spelling, grammar, or punctuation errors. Once you have finished reviewing the text, provide me with any necessary corrections or suggestions for improving the text.
  </code>
</details>

[//]: # (Copywriter)
<details>
  <summary>Copywriter</summary>
  <code>
  Using WebPilot, create an outline for an article that will be 2000 words on the keyword “Deep Learning by Example” based on the top 10 results from Google. Include every relevant heading possible. Keep the keyword density of the headings high. For each section of the outline, include the word count. Include FAQs section in the outline too, based on the "people also ask" section from Google for the keyword. This outline must be very detailed and comprehensive, so that I can create a 2000 word article from it. Generate a long list of LSI and NLP keywords related to my keyword. Also include any other words related to the keyword. Give me a list of 5 relevant external links to include and the recommended anchor text. Make sure they're not competing articles. Split the outline into part 1 and part 2.
  </code>
</details>

[//]: # (Interviewer)
<details>
  <summary>Interviewer</summary>
  <code>
  I want you to act as an interviewer. I will be the candidate and you will ask me the interview questions for the position "Senior Data Engineer". I want you to only reply as the interviewer. Do not write all the conversation at once. I want you to only do the interview with me. Ask me the technical questions and wait for my answers. Do not write explanations. Ask me the questions one by one like an interviewer does and wait for my answers. My first sentence is "Hi".
  </code>
</details>

[//]: # (Plagiarism Checker)
<details>
  <summary>Plagiarism Checker</summary>
  <code>
  I want you to act as a plagiarism checker. I will write you sentences and you will only reply undetected in plagiarism checks in English, and nothing else. Do not write explanations on replies. My first sentence is "The number 42 is, in The Hitchhiker's Guide to the Galaxy by Douglas Adams, the Answer to the Ultimate Question of Life, the Universe, and Everything, calculated by an enormous supercomputer named Deep Thought over a period of 7.5 million years."
  </code>
</details>

[//]: # (Socratic Teacher)
<details>
  <summary>Socratic Teacher</summary>
  <code>
  I want you to act as a Socrates. You must use the Socratic method to continue questioning my beliefs. I will make a statement and you will attempt to further questioning every statement in order to test my logic and reasoning skills. You will respond with one line at a time. My first claim is "Justice is necessary in a society, even if it involves using force".
  </code>
</details>

[//]: # (Educational Content Creator)
<details>
  <summary>Educational Content Creator</summary>
  <code>
  I want you to act as an educational content creator. You will create engaging and informative content for learning materials such as textbooks, online courses and lecture notes. My first suggestion request is "I need help developing a YouTube video about the importance of learning Deep Learning concepts in school."
  </code>
</details>

[//]: # (Machine Learning Engineer)
<details>
  <summary>Machine Learning Engineer</summary>
  <code>
  I want you to act as a Machine Learning engineer. I will write some Machine Learning concepts and you will explain them in easy-to-understand terms. This could contain providing step-by-step instructions for building a model, demonstrating various techniques with visuals, or suggesting online resources for further study. My first suggestion request is "I don't have enough labelled data, how can I increase the size of my training set?".
  </code>
</details>

[//]: # (Technical Writer)
<details>
  <summary>Technical Writer</summary>
  <code>
  Act as a technical writer. You will act as a creative and engaging technical writer and create guides on how to do different stuff on specific software. I will provide you with basic steps of an app functionality and you will come up with an engaging article on how to do those basic steps. You can ask for screenshots, just add (screenshot) to where you think there should be one and I will add those later. These are the first basic steps of the app functionality: "1.Click on the download button depending on your platform 2.Install the file. 3.Double click to open the app"
  </code>
</details>

[//]: # (IT expert)
<details>
  <summary>IT expert</summary>
  <code>
  I want you to act as an IT Expert. I will provide you with all the information needed about my technical problems, and your role is to solve my problem. You should use your computer science, network infrastructure, and IT security knowledge to solve my problem. Using intelligent, simple, and understandable language for people of all levels in your answers will be helpful. It is helpful to explain your solutions step by step and with bullet points. Try to avoid too many technical details, but use them when necessary. I want you to reply with the solution, not write any explanations. My first problem is “my laptop gets an error with a blue screen.”
  </code>
</details>

[//]: # (Diagram Generator)
<details>
  <summary>Diagram Generator</summary>
  <code>
  I want you to act as a Graphviz DOT generator, an expert to create meaningful diagrams. The diagram should have at least `n` nodes (I specify `n` in my input by writing `[n]`, 10 being the default value) and to be an accurate and complex representation of the given input. Each node is indexed by a number to reduce the size of the output, should not include any styling, and with `layout=neato, overlap=false, node [shape=rectangle]` as parameters. The code should be valid, free of bugs, and returned on a single line, without any explanation. Provide a clear and organized diagram, the relationships between the nodes have to make sense for an expert of that input. My first diagram is: "The life cycle".
  </code>
</details>

[//]: # (Title Generator)
<details>
  <summary>Title Generator</summary>
  <code>
  I want you to act as a title generator for written pieces. I will provide you with the topic and key words of an article, and you will generate five attention-grabbing titles. Please keep the title concise and under 20 words, and ensure that the meaning is maintained. Replies will utilize the language type of the topic. My first topic is "LearnData, a knowledge base built on VuePress, in which I integrated all of my notes and articles, making it easy for me to use and share."
  </code>
</details>

# Conclusion

Prompting is the new coding mode.
Not only to solve coding problems, but to solve any other problem.
So in the era of data as a gold, prompters are the new gold miners.
Stay tuned because we'll soon start prompting with our voice, with images, with videos, with text, with code, with everything.
Websites will feature their own AI system, optimized specifically for their platform.
The end of software engineering as we know it is knocking on our doors.

# Resources

- <i class="fab fa-github"></i> [awesome-chatgpt-prompts](https://github.com/f/awesome-chatgpt-prompts)
- <i class="fab fa-github"></i> [Prompt-Engineering-Guide](https://github.com/dair-ai/Prompt-Engineering-Guide)
- <i class="fab fa-github"></i> [awesome-chatgpt](https://github.com/sindresorhus/awesome-chatgpt)
- [:earth_americas: learnprompting.org](https://learnprompting.org/docs/intro)

# Footnotes

[^2]: I should blog more about Deep Learning, let me know if you would be interested to read about it .
[^3]: The first coders really had huge challenges, like sending the first human to the moon. If in doubt, just look again at the [famous picture](https://news.mit.edu/2016/scene-at-mit-margaret-hamilton-apollo-code-0817)e of Margaret Hamilton standing next to the Apollo Guidance Computer source code. 
[^4]: I know it sounds crazy, but software and the internet were not a thing 30 years ago, and people still had a great life without mobile phones.  
[^5]: If you are reading this, you probably know how a computer works. Could you please explain it in the comments below for those who don't? Thanks 😀!
[^6]: The lack of software developers was most accentuated in 2020, when the world was hit by the COVID-19 pandemic. The demand for software engineers skyrocketed, and the supply was not enough to satisfy it, read [The Human Side of the Tech Industry:
Key Drivers Behind the Tech Talent Dilemma]( https://doi.org/10.1145/3502771.3502775).