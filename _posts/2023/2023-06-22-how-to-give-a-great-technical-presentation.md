---
layout: post
title: How to Give a Great Technical Presentation
subtitle: Here's what I've learned
tags: soft-skills
description: Over the past five years, I've given deep thought to the power of effective public speaking. In this article, I share the tips and tricks I've gleaned from the best speakers. I hope this helps you to excel in your next technical presentation.
keywords:
  - presentation skills,
  - public speaking,
  - delivering technical content,
  - insights from an speaker
image: ../img/posts/2023/2023-03-22/circus-cover.jpg
share-img: ../img/posts/2023/2023-03-22/circus-cover.jpg
show-avatar: false
toc: true
date: 2023/06/22
author: cesarsotovalero
published: true
---

Public speaking has never been my forte.
As a child, I often preferred blending into the crowd rather than standing out.[^1]
However, I've since realized that in the pursuit of professional excellence, there is no way to avoid the public eye.
Talent and hard work doesn't really matter if I can't properly package and present my work to the masses.
I recently [defended my PhD thesis](https://youtu.be/Ub684G_aM5Q) (it went well, if you ask me), so I want to take this time to reflect on what I've learned over the years while delivering a few [technical talks](../talks.html).
Upon reflection, I notice that the last 5 years of PhD have made me going from shaky voice and incoherent ramblings, to the point in which I sort of feel confident at public speaking.
In this article, I sit over the shoulders of giants to tell you about some of the tricks I've learned from my own experience and also from others.
I'll walk you through some effective strategies for technical presentations.
If you follow me, I've no doubts you'll be able to nailing your next one.

**TL;DR:** The secret to delivering a great presentation is feeling in control, which enables the necessary confidence to be perceived as an expert.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-03-22/circus.jpg alt:"Public speaking is a circus" %}
  <figcaption class="stroke"> 
    &#169; Public speaking success is, like in a circus, about providing a unique and memorable experience to your audience. Photo of <a href="https://en.wikipedia.org/wiki/Cirque_du_Soleil">Cirque du Soleil</a> in Stockholm, 2023.
  </figcaption>
</figure>

# Why is this important?

Professionals shouldn't go out into life without the ability to communicate.
This is because success in life is largely determined by our ability to **speak** ($$S$$), **write** ($$W$$), and the quality of our **ideas** ($$I$$), in that order.

$$Success(S, W, I) = a * S + b * W + c * I $$, where $$a > b > c$$.

The quality of $$S$$, $$W$$, and $$I$$, is largely determined by how much **knowledge** ($$K$$) we have, how much **practice** ($$P$$) with that knowledge, and our inherent **talent** ($$T$$).

$$Quality(S, W, I) = f(K, P, T) = x * K + y * P + z * T$$, where $$x > z \& y > z$$.

You want to get the maximum opportunity to have your ideas valued and accepted by the people you speak with.
One of the best ways to do that by delivering excellent technical presentations.

> **Corollary:** You can get a lot better than people who may have inherent talents if you have the right amount of knowledge and the ability to transmit your own ideas.

# Definition

BTW, what is a technical presentation?

Here's what I think it is:

> "A technical presentation is a communication session in which a speaker delivers specialized information, explanations, or demonstrations on a specific technical topic to an audience."

The following are the important keywords in the definition above:

- **"communication session"**: It refers to the format of the presentation. For example, a conference talks, tech workshops, webinars, product sales pitches, and even job interviews are all examples of technical presentations.
 
- **"delivers specialized information, explanations, or demonstrations"**: It refers of the type of content that is delivered. In this article I focus on technical context in the area of Computer Science and Technology. Technical presentations often involve the use of visual aids such as slides, diagrams, code snippets, demonstrations, or multimedia elements to support and enhance the content delivery experience.
 
- **"audience"**: The audience is the speaker's target. It can be a small group of people or a large group of people. I assume the people is already familiar with the topic of the presentation, and is interested in learning more about it.

**NOTE:** The rest of this article is written from the perspective of the speaker.

[//]: # (- Don't be obvious!)
[//]: # (- Don't exaggerate with jokes!)
[//]: # (- Don't be too informal, be serious!)
[//]: # (- Don't give the same presentation more than once!)
[//]: # (- Don't bring kitties!)
[//]: # (- Don't finish without a Q&A!)

# How to start

The best way to start is with a **promise**. 
You want to tell people what they're going to know at the end of your presentation something new they didn't know at the beginning.
For example, you can say something like: "At the end of this `X` minutes, you will know things about `Y` you didn't know, and something among those new things will make a difference for you in `Z`."
This is statement simple and powerful.
Make sure to craft a clear hook for your audience, so they know exactly the reason for being there. 

Alternatively, you can start with a **story**.
The easiest subjects to start with are stories about your practical experience with some modern technology or tool.
For example, something like “How Docker Helps Us Optimize Delivery” or “Apache Spark Issues We Have Dealt With.”
Describe what you've done on a recent project and what you've learned from it.
The most important aspect of the story is the problem you've faced and why it's important to solve it. 
Remember, it doesn't really matter the details of the story.
What matters is that there is a problem out there that needs to be solved.

I suggest putting in the **first slide** a title, as well as a list of collaborator or institutions that made your work possible.
The **second slide** should contain a picture linked to the promise or the story you're talking about.
I don't like the idea of showing an outline with bullet points about the whole content, some people do, but it's boring.
Instead, announce the structure out loud, multiple times during the presentation.

⚠ Don't start the presentation with a joke.
The reason is that, in the beginning of a talk, people are still putting their laptops away.
They're becoming adjusted to your speaking parameters, to your vocal parameters, and they're not ready for a joke.
So early jokes doesn't work very well.

# Time and place

The best **time** for delivering a technical presentation is the morning, usually around 11:00.
The reason is that most people are awake by then, people aren't fatigued from this or that.
The worst time is after lunch, because people are tired and sleepy.

The best **place** is a theater with at least 100 seats.
I've noticed that the most people are in the room, the easier job is for me as the speaker.
Large audiences make me feel like I'm giving a discourse.
Also, it's less likely that I'll be interrupted by some unexpected question.

It is important to turn on the lights in the room, and making sure there is a clock visible somewhere. 
The reason for the first is that we humans, whenever the lights go down, it signals that we should go to sleep. 
The reason for the latter is that time is super important, and you want to make sure you're not going over time.

I recommend going to see the place before the actual talk to make sure you know about any potential issue in advance.
This way there will be no surprises.
Sometimes adjusting the place might require some intervention from you. 
Sometimes, it just might require to understand what the challenges are.

# Instruments

There are three key instruments you can use:

| Instrument | Purpose       |
|------------|---------------|
| Boards     | Informing     |
| Slides     | Exposing      |
| Props      | Demonstrating |

<aside class="quote">
    <em>“The good presentations have code, the excellent talks have running code.”</em> 
</aside>
We all know about boards and slides, but sometimes we forget about props.
There are tools or accessories that you can use to make sure your talk is memorable.
Props are ofter useful for showing the importance of looking at the problem in the right way.
For example, a demo is a powerful prop you can use.
I firmly believe that there's nothing like running code to enhance the quality of a presentation.
By running code, the people in the audience will feel that you're actually doing something real.
It's not just a bunch of slides.

[//]: # (Quote by Steve Jobs)
<aside class="quote">
    <em>“People who know what they're talking about don't need PowerPoint.” ―  <cite>Steve Jobs</cite></em> 
</aside>
Regarding slides, there's always too many.
And they have always too many words.

I recommend going over the following list after you have prepared your slides:

- **Don't use many words on each slide.** How many? I'd say no more than 42 words per slide :) By reducing the number of words on the slide, I'm allowing you to pay more attention to me and less to what's written on the slide. Remember that we have only one language processor, and we can either use it to read stuff or to listen to the speaker. And so if we have too many words on the slide, it forces people in the audience to read this stuff and not listen.
- **Don't read.** People in your audience know how to read, and reading will just annoy them. The slides to be condiments to what you're saying, not the main event or the opposite way around.
- **Don't use any background junk**, logo, title, not even bullets.
- **Don't use any kind of laser pointers**, those are distracting because you loose the contact with your audience, instead, use animations, e.g., put a little arrow on their tell the audience to look at that.
- **Don't forget having at least one complex slide** (ideally showing some code). That's what [Hapax legomenon](https://en.wikipedia.org/wiki/Hapax_legomenon) is about.

# Four tricks

Make sure you make good use of the following four tricks:

<aside class="quote">
    <em>“So cycling is one of the things that I always think about when I give a talk.”</em> 
</aside>

1. **Originality**. Explain you core idea in a way that it's not confused with somebody else's idea. So, in a more technical sense, I might say: "Well, my algorithm might seem similar to Bob's algorithm, except his is exponential, and mine's linear." That's putting a fence around your idea so that people can not be confused about how it might relate to something else.
 
2. **Repetition**. Tell what you want to tell and go around it. Tell it again, and then tell it a third time, as if people weren't smart enough to understand it. The point is that, at any given moment, about 80% of the audience will be fogged out no matter what. Therefore, if you want to ensure that the probability that everybody gets it is high, you need to say it three times. 
 
3. **Emphasis**. People will occasionally fog out and need to get back on the bus, so you need to provide some landmark places where you're announcing that it's a good time to get back on, e.g., an outline enumerating the key ideas to provide a sense that there's a structure in the talk, and you can get back on anytime. 
 
4. **Questions**. Prepare a few provocative questions, not so easy because people will be embarrassed to answer it, no so hard because then nobody will have anything to say. Throw one question at the time and wait, not say anything for 7 seconds (that's the standard amount of time you can wait for an answer). If nobody answers (red flag), then you can answer it yourself.

# Personal style
[//]: # (a quote)
<aside class="quote">
    <em>“Talk to your audience, not at them.”</em> 
</aside>
Watch the speakers you admire and feel are effective, then ask yourself why they're successful.
Copy them first, the way they move, the way they talk, the way they use their hands, and so on.
Then, you can start to modify it and make it your own style.
Your personal repertoire of gestures and movements will grow over time.

> Many people who are novices at speaking find themselves suddenly aware of their hands.
 
Here are some personal tricks that caught my attention from the professors I had around:

- The way Martin Monperrus uses pauses to create suspense ([Example](https://youtu.be/shvacehl2U0)).
- The way Benoit Baudry uses his hands to explain things ([Example](https://youtu.be/EsUGeWnGZfg)).
- The way Andreas Zeller uses stories to support a flow of arguments ([Example](https://youtu.be/U5jLjcxnwfU)).
 
# How to inspire 

Turns out that people are inspired by different things depending on their age or current status. 
For example, graduate students were often inspired by some high school teacher who told them they could graduate.
Professors are often inspired by someone who helped them see a problem in a new way.
Entrepreneurs are inspired by self-made millionaires.
And so on. 
Something common from everyone is that they are inspired when someone exhibited **passion** about what they were doing.

[//]: # (TODO: Put an example of someone that got inspired by somethind thad I did/said)

[//]: # (TODO: Write an example of something cool that I expressed with passion)

One way to inspire people is by telling **personal stories**.
The story needs to be ~~true~~ reliable.
These stories can help them understand different situations and emotions, learn lessons, and get ideas.
Also, people are curious. 

Another way is by creating a **situation**.
It's important to talk about your topic in context. 
For example, say something like "This is a problem that's being pursued all over the world, here hasn't been any progress before me in the past `X` years, so everyone is looking for a solution because it will have impact on `Y` and `X`."
Everyone will be interested.

# Getting recognized

> **Q:** Why do you want to be recognized for what you do?<br>
> **A:** The answer is that no one gets used to being ignored.

Your ideas are like your children.
And you don't want them to go into the world in rags.
So what you want to do is to be sure to use the right techniques to present them so that they're recognized for the value that is in them. 

<aside class="quote">
    <em>“Admittedly, most people give technical presentations because we want self-promotion.”</em> 
</aside>

You will get recognized by being remembered.
How do you get remembered? 
One of the things you need to do is to make sure that you have some kind of **symbol** associated with your presentation. 
Next thing you need is some kind of **slogan**, a kind of phrase that provides a handle on your work. 
And now we need a **surprise**. 
Next item was a **salient idea**. 
An idea that sticks out. 
Some theses, funnily enough, have too many good ideas, and you don't know what it's all about because which one is it? 
So you need an idea that sticks out. 
And finally, you need to **tell the story of how you did it, how it works, why it's important**.

# Practice

You know that practice is important, but here's some extra advice:
**Don't show your slides to the people you will present to**. If they know what you're doing, they will hallucinate that there's material in your presentation that isn't there if it isn't there. 
A variation on the scene, by the way, is your faculty supervisor is not a very good person to help you debug a talk because she, in fact, knows what you're doing. 
So he may hallucinate there's material in your presentation that isn't there. 
The best way is to get together with some friends who don't know what you're doing and practice with them.
 
> Start your practice session by saying: "If you can't make me cry, I won't value as a friend anymore."

Here's another nugget:
**The amount of feedback you'll get from somebody is proportional to age**. 
The older somebody is, the more they understand where they are in the world.
But the young people are trying to show the old people how smart they are, so it's subtly vicious. 
So whenever you have an opportunity to have an examining committee that's full of people with gray hair, that's what you want. 

# Job presentations 

This type of presentation deserves a special section because they are so important.
It's basically a sales pitch in which you have to quickly convince a few people (hopefully your potential managers) that you are the right person for the job.

If the market needs you, the employer will trust you more.
That's exactly what you need in order to request a higher pay.
You need to tell them about your **vision**, and that you've already **done something**.
If you cannot make these two points in 5 minutes, you've already lost. 

Concretely, you have **5 minutes** to:

1. **Show you have some kind of vision**. Show you want to work on a problem that somebody care about and that there's something new in your approach. 

2. **Show you have done something to solve a problem**. Provide a list with the steps that need to be taken in order to realize the vision. You don't have to have done all of those steps. But you can say something like: here's what needs to be done.

Here's an example:

| Problem                     | Approach                                                                                                                                                                                               | Done                                                                                                                                                                                                                               |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Maintaining large codebases | To develop and integrate AI-powered tools into the software development process to automatically suggest how to isolate pieces of code and repackage them as independent components (a.k.a libraries). | We need to 1) choose the right AI technique giving the problem's constraints, 2) specify when to split the codebase, 3) build the system, 4) showcase a PoC of such a system, and 5) ~~optionally~~ enumerating your contributions |

[Here](../collaborations.html) is a list of research topics that I've compiled.  

# How to finish

One of the best ways to finish is by **telling a joke**.
By the time you're done, people have adjusted themselves to your voice parameters.
They're ready for a joke, and that way, people think they've had fun the whole time.

As Prof. Patrick Winston says, finishing with **"Thank you" is a weak move**.
When you say thank you, it suggests that everybody has stayed that long out of politeness and that they had a profound desire to be somewhere else.
But you are not taking their time, you are giving them something.
So don't say thank you before the wild applause.

Your **final slide** is an opportunity for you to tell people who you are and what you have done. 
And that's why your final slide should be labeled "Contributions".

Finally, the last thing you could do is to **salute** the audience.

# Good examples

Here are some of the best presentations I've seen:

- [_"The Future of Programming"_](https://youtu.be/8pTEmbeENF4), by Bret Victor (32 min)
- [_"The Mess We're In"_](https://youtu.be/lKXe3HUG2l4), by Joe Armstrong, creator of Erlang (45 min)
- [_"The Art of Code"_](https://youtu.be/2jyPBjlKhtk), by [Dylan Beattie](https://dylanbeattie.net/) (1h)
- [_"The Deep Synergy Between Testability and Good Design"_](https://youtu.be/4cVZvoFGJTU), by [Michael Feathers](https://michaelfeathers.silvrback.com/) (50 min)
- [_"Steve Jobs Introduces iPhone in 2007"_](https://youtu.be/MnrJzXM7a6o) (10 min)

# Summary

**The way you present and how you package your ideas is a fundamental skill**.
It measures your caliber as a professional.
As a result, a big chunk of life's success depends on it.

The quality of communication is determined by knowledge, practice, and inherent talent, with talent being the less important factor.
Effective communication involves clear explanations, using appropriate language, and ensuring that the audience understands the message.
For this you can use slides, props, and gestures, but nothing is better that language to deliver communication and aid understanding.
The use of slides in presentations should be optimized by reducing text, using larger fonts, eliminating clutter, and focusing on conveying key information.
Develop your own style.
For example, by incorporating storytelling and asking thought-provoking questions can stimulate curiosity and enhance engagement.
The use of personal stories can inspire and connect with the audience.
It also helps to study carefully what the best speakers do.

That's all from me, the rest you can probably only learn it by doing it.

# Resources

- [How to Speak](https://youtu.be/Unzc731iCUY), by Patrick Winston
- [Speaker Cheat Sheet](https://www.yegor256.com/2018/12/25/speaker-cheat-sheet.html), by Yegor Bugayenko

# Footnotes

[^1]: Feeling ridiculous seems to be a **big** problem at young ages.

[//]: # (Enable Latex support, see https://zjuwhw.github.io/2017/06/04/MathJax.html)
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  tex2jax: {
    inlineMath: [['$','$'], ['\\(','\\)']],
    processEscapes: true
  }
});
</script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>