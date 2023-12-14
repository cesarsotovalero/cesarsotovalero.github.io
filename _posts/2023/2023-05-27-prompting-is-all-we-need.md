---
layout: post
title: Prompting is All We Need!
subtitle: Is this the end of software engineering as we know it?
tags: sarcasm
description: TODO
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
published: false
---

I'm a software engineer at heart.
As such, a big chunk of my world revolves around code. 
Lately, though, I've found myself avoiding writing code (and everything else) more than usual.
This shift is new for me, as writing is one of the most gratifying activities (once the written piece is done).
I've even lost interest in looking at ~~poorly written~~ documentation.
Books, articles, and even tweets are starting to be perceived as too large for me.
Googling and reading StackOverflow Q&A threads is becoming less appealing than what they used to be.
So, something has changed, and it's not just the usual slump.
But at the same time, it looks like my ~~laziness~~ efficiency has increased considerably.
Contradiction?
After giving it some thought, I understood what's going on: I'm transitioning into a prompter!
Let me tell you more about it.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-05-27/pino_pizza.jpg alt:"The future of software will have the same destiny that pizza production" %}
  <figcaption class="stroke"> 
    &#169; Do you know how to make a pizza from scratch? I don't, and I'm afraid the same will happen in the software industry. Photo of miniature model of the Pizzeria Pino, the fist Stockholms' pizzeria, funded in 1976, and exposed in the <a href="https://maps.app.goo.gl/ohfdw8atqpv2WjiTA">Stockholm Stadsmuseet</a>.
  </figcaption>
</figure>

<aside class="quote">
    <em>“A prompter [in a theatre] is a person who prompts or cues actors when they forget their lines or neglect to move on the stage to where they are supposed to be situated.” - <cite><a href="https://en.wikipedia.org/wiki/Prompter_(theatre)">Wikipedia</a></cite></em> 
</aside>

Once upon a ~~long~~ time, software was a strange thing.[^4]
Even stranger was the people who build it: "programmers."
Or were they scientists?
I'm too young to know exactly what they were called.
Anyway, they were an unusual breed of people.
They were mathematicians, physicists, or pure engineers who mastered cryptic programming languages to tackle mostly practical problems. .[^3]
These individuals possessed advanced reasoning skills. 
They could understand complex systems (such as those for financial transactions written in COBOL), and implement algorithms like QuickSort in 10 minutes or less.

But that was a long time ago.
Nowadays, software is everywhere.
It's indispensable, just like salt for the food. 
In every industry, in every company, in every home, software is a necessary ingredient.
So the crew of programmers has grown.
But the world had not enough mathematicians, or engineers, to satisfy the demand for programmers.
And as with any other industry, the higher the demand, the more advance the tools to simplify the production machinery.

Over the past two decades, a new class of "programmers" has emerged and permeated the industry: software developers!
The prerequisites have shifted dramatically.
They don't need to understand Calculus anymore to get a decent job offer.
Indeed, they don't even need to know how a computer actually works.[^5]
It's enough to master a particular framework, a library, or even a single digital tool.
And bang! 
The wheel of software product lines keeps running.
The software industry is ready to go.

But I've seeing the panorama shifting in the last few months.
What if I told you that knowing how to code is no longer necessary?
Yes, that's right
Because now computers can generate code for us, automatically.
I'm not talking about in-IDE code generation tools, such as templates, or refactorings.
I mean entire applications written by AI, from scratch.
And not only code, everything else too.
Even the boring stuff, like bug reports, code comments, and meeting minutes.
The new era of automated text generation has come to us developers.
And with it, there comes the fresh new challenges.

# Show Me the Prompt!

It seems that coding, as a profession, as become less complex nowadays. 
This is thanks to the rise of AI tools powered by Large Language Models (LLMs).
These are Machine Learning (ML) models trained on huge amounts of ~~crap~~ text data.
Once trained, the model can generate meaningful text from a given prompt.
Interestingly, it appears that generating code is one of the simpler tasks for these models.
So we developers are not as special as we thought, ouch.
In other words, AI can write reasonably good code faster and cheaper than us.
Over time, I believe that the price of every single line of code will decrease its value.
It's [supply and demand](https://en.wikipedia.org/wiki/Supply_and_demand), nothing we can do about it.

Still, there is a catch.
The ingredient to fuel the machine: the prompts!
We still need humans to craft them.
So a new class of programmers has emerged.
Those who excel at writing prompts to tackle the common issues. 
Let me introduce you the "prompters."

The prompter daily task is to ask questions.
They embody the inquisitive spirit of Socrates, or perhaps that of a 5-year-old child, depending on how much you estimate the role.
The job is fundamentally about crafting queries in natual language:
"I got the following log message, how to fix the problem?," 
"I have a list of items, write an algorithm to sort them?,"
"My boss is annoying me, what should I do?."
The next step is straightforward: taking the AI-generated response and integrating it into the appropriate context, often directly to the production environment.
Seems like magic!

But, perhaps this isn't magic after all.
It doesn't look familiar to you?
Yes, it's the exact same thing we used to do every day when searching Google and looking at QAAs on StackOverflow.
The big difference now is the speed at which we receive answers.
What's more impressive to me is that it seems we can now get answers without fully knowing how to articulate the question!
So, goodbye to the fear of asking stupid questions on StackOverflow.
There is no more shame because AI systems are not trolling us anymore (yet).
What's better, AI are increasingly surpassing us in deciphering our own challenges.

Needless to say, this is the end of software engineering as we know it.
I expect a huge impact on the workforce.
What am going to do with the extra time now that I don't need to search for answers?
Playing ping-pong with my colleagues?
The tide of public skepticism regarding the future of Computer Science is rising.
At the same time, the number of devs ~~kicked out from~~ leaving the industry is increasing.
This is alarming.

But don't worry.
There is still hope.
We still have a few years left for us to adapt and improve.
And maybe we can all keep our jobs after all.
I'm talking, of course, about becoming a successful prompter.

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
 
Now that we have our manifesto, let's see how to become a successful prompter.

# The Successful Prompter

<aside class="quote">
    <em>“Prompting is not about writing questions. It's a way of looking at and solving problems.”</em> 
</aside>

The successful prompter understands how AI actually works.[^2]
This is necessary to know how to craft the best prompts.
Understanding the keywords from the domain and the context are key.
The successful prompter knows how to apply the principles of clear communication.
It's about being concise, precise, and unambiguous.
That way one can tweak the prompt to get the best results.
If in doubt, it may even involve calling another AI to write the prompt. 
Recursive prompting!

## Prompting for Learning

The successful prompter knows how to use AI to learn new stuff.

Here 7 prompt examples:

1. I want to learn `X`. Can you **use the Pareto Principle**, which identifies the 20% of the topic that will yield 80% of the desired results, to create a focused learning plan for me?
2. Create a **study schedule** for all of the above in an appropriate number of weeks. I can study for `X` hours every Tuesday and Thursday. Please include time for revision and testing.
3. Suggest various learning resources (like books, videos, podcasts, interactive exercises) for the above topics that cater to different learning styles to me.
4. I'm a beginner interested in learning how to create games in Unity. To do this, I need to know how to code in C#. Can you give me some beginner video game projects I could work on to help strengthen my C# coding skills?
5. Explain `X` to me in the simplest terms possible as if I were a complete beginner (or as if I was a 5-year-old).
6. Guide me through a visualization exercise to help me internalize the term 'X' and imagine myself successfully applying it to a real-life situation.
7. I want you to act as a Socrates and use the Socratic method to help me improve my critical thinking, logic, and reasoning skills about `X`. Your task is to ask open-ended questions to the statement I make, and after I provide a response, give me constructive feedback to each response before you ask the next question.


## Prompting for Coding

The successful prompter knows how to use AI to write code.

Here are 7 examples:

1. TODO
2. TODO
3. TODO
4. TODO
5. TODO
6. TODO
7. TODO

## Prompting for Productivity

The successful prompter knows how to use AI to be more productive.

Here are 7 examples:

1. TODO
2. TODO
3. TODO
4. TODO
5. TODO
6. TODO
7. TODO

## Prompting for Creativity

The successful prompter knows how to apply the new stuff just learned to do something that cannot be done by prompting.

Here are 7 examples:

1. Making ~~money~~ value out of the prompt response (e.g., "Can you provide a summary of the main points from the article `X`?").
2. Humanizing the stuff just learned (e.g., shaping it in a way for humans to understand).
3. Teaching the stuff to other colleagues so that they get to know how smart you are.
4. Impress your boss by cooking the cookies you just prompted how to bake.

# Prompts' Wall of Fame

Here are some of my favorite prompts, some of them are inspired by <i class="fab fa-github"></i> [awesome-chatgpt-prompts](https://github.com/f/awesome-chatgpt-prompts):

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
  I want you to act as a Socrat. You must use the Socratic method to continue questioning my beliefs. I will make a statement and you will attempt to further questioning every statement in order to test my logic and reasoning skills. You will respond with one line at a time. My first claim is "Justice is necessary in a society, even if it involves using force".
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
  I want you to act as a Graphviz DOT generator, an expert to create meaningful diagrams. The diagram should have at least n nodes (I specify n in my input by writting [n], 10 being the default value) and to be an accurate and complex representation of the given input. Each node is indexed by a number to reduce the size of the output, should not include any styling, and with layout=neato, overlap=false, node [shape=rectangle] as parameters. The code should be valid, bugless and returned on a single line, without any explanation. Provide a clear and organized diagram, the relationships between the nodes have to make sense for an expert of that input. My first diagram is: "The water cycle".
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

And we'll prommpt with our voice, with images, with videos, with text, with code, with everything.
Not only to solve coding problems, but to solve any problem.
Websites will feature their own AI system, tuned specifically for their platform.
So in the era of data as a gold, prompters are the new gold miners.

# Resources

- <i class="fab fa-github"></i> [awesome-chatgpt-prompts](https://github.com/f/awesome-chatgpt-prompts)
- <i class="fab fa-github"></i> [Prompt-Engineering-Guide](https://github.com/dair-ai/Prompt-Engineering-Guide)
- - <i class="fab fa-github"></i> [awesome-chatgpt](https://github.com/sindresorhus/awesome-chatgpt)
- [:earth_americas: learnprompting.org](https://learnprompting.org/docs/intro)



# Footnotes

[^1]: Great talk https://youtu.be/Unzc731iCUY
[^2]: I should blog more about Deep Learning, let me know if you would be interested to read about it .
[^3]: The first coders really had huge challenges, like sending the first human to the moon. If in doubt, just look again at the [famous pictur](https://news.mit.edu/2016/scene-at-mit-margaret-hamilton-apollo-code-0817)e of Margaret Hamilton standing next to the Apollo Guidance Computer source code. 
[^4]: I know it sounds crazy, but software and the internet were not a thing 30 years ago, and people still had a great life without mobile phones.  
[^5]: If you are reading this, you probably know how a computer works. Could you please explain it in the comments below for those who don't? Thanks 😀!