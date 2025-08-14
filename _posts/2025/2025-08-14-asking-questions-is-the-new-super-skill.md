---
layout: post
title: When Answers are Cheap, Questions are Gold
subtitle: Learning to ask is the new competitive edge
tags: ai
description: |
  TODO
keywords:
  - job interviews
  - job applications
  - behavioral inteview
  - technical inteview
  - job search
image: ../img/posts/2025/2025-08-14/TODO
share-img: ../img/posts/2025/2025-08-14/TODO
show-avatar: false
toc: true
mathjax: true
date: 2025/08/14
author: cesarsotovalero
published: false
---

I remember, when I was 10, I had only a few old books at home.
The new ones either weren’t available or they were too expensive for my budget.
If I wanted to read good stuff, I had to walk to the local library and sit down there to read.
Ten years later, on my 20s, I observed that university professors were respected for the sheer amount of knowledge they had accumulated over a lifetime.
We valued them because their skills and expertise were scarce.
Now, in my 30s, knowledge is everywhere.
It’s cheaper than ever and moves at lightspeed.
A curious 10-year-old today can access cutting-edge tools and learn from the latest research papers, from home!

More remarkable, AI has drastically changed the value of knowledge in the last few years.
Everyone can now prompt an AI assistant for free and get almost instant answers to most imaginable questions.
This has optimized the search of human knowledge ever more.

AI has made answers abundant.
However, current models still struggle to figure out how to apply, synthesize, and adapt existing knowledge to create something genuinely new.
With the rise of reasoning models, the ability to formulate the right questions has shifted the real differectiator from answering to formulating questions.

I’d argue that as the value of getting answers goes down, the value of formulating new questions that drive action should go up.
So, coming up with key questions represents the real competitive edge.

What is more, I believe that the perceived value of those people who have master the "art of asking questions" must increase accordingly.
 (e.g., podcast inverviewers, software engineers who know _what_ to put in a prompt, etc.).

This post is about strategies and techiniques that I've learn over time to become better at the art asking questions.

# When to Ask?

Short answer: every time you can!

Back in the days, asking frequent questions was considered an annoying practice in most circles.
Why?
Because of our inherent human laziness.
Leaving a question in the air meant that somebody had to squizze her brain to find an answer.
Otherwise, an uncorfortable void of uncertainty threated to emerge.
This is not longer the case aymore.

AI has completely removed the fear of "feeling stupid", for both sides: the asker and the responded.
The more with use AI, the more confortable we are with the idea of questioning everything.
In meetings or events, asking is a signal of attention, and in an era where AI can respond fast, it also signals the capacity to questioning the _status quo_ and having a personal opinion.

The more questions you ask, the better prepared you will be for whatever is coming next.

# What Makes a Question “Good”?

Good questions describe what are we doing, where, and what will we do with the answer.
They are unambiguous, give just enough backstory, and set limits.
Great questions feel smaller, not bigger, because they carve away the irrelevant.
If the question doesn’t change your next action or your metric, keep sharpening.

## Aim, scope, and payoff (ASP)

**Core idea:** Say what you’re trying to achieve (aim), how wide you’ll look (scope), and what you’ll do with the answer (payoff).

**Why it works:** Without aim you wander, without scope you boil the ocean, without payoff you can’t act. A “good” question changes what happens in the next 10 minutes.

**Mini-template (ASP):**

* **Aim:** “We want to \_\_.”
* **Scope:** “Within \_\_ (data/time/users/tools).”
* **Payoff:** “So we can \_\_ (decision/action/experiment).”

**Examples (before → after):**

* Vague product: “How do we improve onboarding?” →
  **Aim:** increase week-1 activation. **Scope:** mobile iOS, signup flow only. **Payoff:** decide which of 3 changes to A/B test.
  **Question:** “What single change in the iOS signup flow would most increase week-1 activation, and which 3 options should we A/B test first?”

* Research/analysis: “Is our model good?” →
  **Aim:** choose to ship or retrain. **Scope:** fraud model v2 on last 30 days. **Payoff:** go/no-go.
  **Question:** “Given the last 30 days, does fraud-v2 beat fraud-v1 on precision\@top1% by ≥2pp at equal recall, so we ship or retrain?”

* Personal: “How can I get healthier?” →
  **Aim:** improve sleep. **Scope:** next 14 days, bedtime routine only. **Payoff:** adopt one habit.
  **Question:** “Which single bedtime habit should I try for 14 days to raise average sleep by 30 minutes?”

**5-minute drill:** Before you ask, write ASP in one sentence. If you can’t name the **payoff**, you don’t have a question—just a topic.

## Clarity, context, and constraints

**Core idea:** Make the question unambiguous, include the background that matters, and set limits that force trade-offs.

**Why it works:** Clarity prevents misreads, context prevents wheel-reinvention, constraints prevent infinite “it depends.”

**The 3C pre-flight:**

* **Clarity:** Define terms, units, and success. Prefer nouns and verbs over adjectives.
* **Context:** Give the minimum viable backstory: objective, prior attempts, relevant data.
* **Constraints:** Time, budget, tools, risk tolerance, guardrails.

**Quick rewrites (before → after):**

* “What’s the best database?” →
  “For a write-heavy workload (\~5k writes/sec), 99.9% latency <10ms, EU-only, managed service—what database should we evaluate first and why?”
* “How should I learn LLMs?” →
  “With 5 hours/week for 6 weeks and access to GCP, what learning plan gets me from zero to fine-tuning a small model on our support tickets?”

**Context sandwich (one sentence):**
“Because **\[situation]**, I need **\[specific ask]**, under **\[constraints]**.”
Example: “Because churn is up 3% in SMB, I need the top 3 drivers from last quarter’s usage logs, under the constraint that we ship findings to Sales by Friday.”

**AI angle:** When using a model, include **role**, **data**, **format**, **limits**.
Example: “Act as a data analyst. Using the attached CSV (30 days of transactions), list the top 5 features by SHAP for fraud-v2, in a markdown table, in <150 words.”

**Red flags to cut:** adjectives without units (“fast,” “cheap”), plural asks in one sentence, undefined audiences (“users”), and scope creep (“and also…”).

## Falsifiability and measurability

**Core idea:** Phrase questions so answers can be *tested*. If it can’t be wrong, it can’t be right.

**Why it works:** Decisions stick when they survive an attempt to disprove them. Measurement turns opinion into feedback.

**Turn questions into testable claims:**

* **Hypothesis form:** “We believe **X** will cause **Y** by **Z** amount for **group G** within **T**.”
  Example: “We believe shortening the signup form from 7 to 4 fields will raise iOS activation by 3–5% for new users within 14 days.”

* **Acceptance criteria:** “We proceed only if **metric ≥ threshold** under **condition**.”
  Example: “Ship if precision\@top1% ≥ 0.92 with recall ≥ 0.55 on June data.”

* **Disconfirmers first:** Ask, “What observation would *disprove* this?”
  Example: “If activation does not increase by ≥1% after 7 days with 95% CI, we abandon the change.”

**Measurability checklist:**

* Named metric (not vibes).
* Baseline value and target delta.
* Time window and sample size.
* Data source and method (how you’ll calculate).
* Decision rule (go/stop/iterate).

**Before → after (testable):**

* “Will the new pricing work?” →
  “In a 50/50 geo split for 21 days, does new pricing increase gross margin per user by ≥4% with no more than 1pp drop in conversion?”

**AI angle (evaluation):**
“Draft 3 alternative questions that could falsify my current belief, and for each, specify the metric, data needed, and a pass/fail rule.”

**Reality check (one-line litmus test):**
If two informed people would compute different answers from the same data, your question isn’t measurable yet.


# Question Patterns You Can Steal

Reusable structures help to think sharper, reduce bias, and get cleaner answers faster.

   * 3.1 First-principles (“What are the primitives?”)
   * 3.2 Inversion (“How could this fail?”)
   * 3.3 Disconfirming evidence (“What would prove me wrong?”)
   * 3.4 Assumption audit (“What am I taking for granted?”)
   * 3.5 Constraint lens (“What if we had half the time/budget?”)
   * 3.6 Comparative calibration (“Compared to what?”)
   * 3.7 Decomposition (“Can we split this into 3 parts?”)
   * 3.8 Time travel (pre-mortem/post-mortem)

1. **The Podcaster Playbook** — Learn how elite interviewers engineer depth, warmth, and precision—and borrow their templates.

   * 4.1 Lex Fridman: patient depth and precision prompts
   * 4.2 Tim Ferriss: operational drills and unusual angles
   * 4.3 Steven Bartlett: emotional truth and narrative unlocks
   * 4.4 Transferable templates from their best moments

2. **Work: Questions That Move Projects Forward** — Use questions to turn meetings into decisions, incidents into root causes, and hunches into hypotheses.

   * 5.1 Meetings that ship decisions, not opinions
   * 5.2 Incident/debug sessions that find root causes
   * 5.3 Product and research: from hunch to hypothesis
   * 5.4 Hiring and 1:1s that reveal signal
   * 5.5 Strategy: define success metrics before solutions

3. **Life: Questions That Upgrade Daily Choices** — Better questions improve relationships, learning speed, health habits, and money decisions.

   * 6.1 Relationships: curiosity without accusation
   * 6.2 Learning: from “what” to “how will I use this?”
   * 6.3 Health & money: define leading indicators
   * 6.4 Reflection: the nightly two-question review

4. **Anti-Patterns: Questions That Backfire** — Avoid traps like leading, double-barreled, and blame-heavy questions that distort truth.

   * 7.1 Loaded and leading questions
   * 7.2 Double-barreled and vague scope
   * 7.3 Why-blame vs. how-fix framing

5. **The Question Pipeline (A Simple System)** — A lightweight workflow to capture, refine, rank, test, and learn from your questions.

   * 8.1 Capture → Expand → Refine → Rank
   * 8.2 Test with AI → Act → Reflect

6. **Training Regimen (Short, Repeatable Drills)** — Build the muscle with quick, repeatable reps that sharpen clarity under constraints.

   * 9.1 The 5× reframe (five better versions)
   * 9.2 The constraint ladder (halve resources, then halve again)
   * 9.3 The falsifier (write the disproof first)
   * 9.4 The metric check (how will we know?)

7.  **Tools & Templates** — Use simple checklists and prompt structures to make good questioning your default.

    * 10.1 One-page question checklist
    * 10.2 Interview prompts inspired by Lex/Tim/Steven
    * 10.3 AI co-pilot prompts for faster iteration

8.  **Quick Wins & Cheat Sheet** — Deploy high-leverage questions this week and a mini-template to turn vague asks into action.

    * 11.1 Ten questions to use this week
    * 11.2 How to turn any vague ask into an actionable prompt

11. **Closing: A Simple Pact** — Commit to “one better question per day” and let compound curiosity do the rest.

    * 12.1 “One better question per day”
    * 12.2 Where to practice next






<!-- Why communicating is important. -->

For no one is a secret that there is just no carrer progress without strong communication skills.
Language is intrinsically tied to our abilities to convery ideas.
So important it is, that today we're closer than ever to reach true AI capabilities through language.

<!-- Communication at job interviews. -->

Q/A sessions are common in job interviews.
It's a way to assess the abilities of candidates at thinking and answering both technical and non-technical questions.
Doing well at such interviews is a trainable skill that anyone can learn though deliberate training and practice.

<!-- The art of asking questions and why it's important.  -->

I found that most conventional interview questions are quite boring (e.g., [TODO]).
In my opinion, some of the best interview questions focus on a candidate's past experiences, problem-solving skills, and future goals.
Examples include: "Tell me about a time you failed and what you learned," "Describe a situation where you had to adjust your priorities," or "Where do you see yourself in five years?" These questions help assess a candidate's self-awareness, adaptability, and career aspirations

<!-- The art of asking questions and why it's important. -->

With the rise of LLMs, the value of _answering_ questions has significanlty decrease its perceived value.
Today would rather stop being the person finds answers and insted become the person who formulates the right questions.
Those that drive the decisions.
Because admitedly, to really grow, solving technical problem is not enough anymore.
You need to become the person who frames them, implement them, and look at the challenges from multiple dimensions.

<!-- Technical vs. Behavioral questions. -->

For technical questions it's important to shift the focus from otutput to outcomes.
Whatever the question, to get clarity on the business goals and its long-term strategy.

<!-- Why you should read this. -->

The rest of this post is a compendium of some of the more interesting questions that come to my mind.
I add the question, and then explain the rationale behind it later on.d

I like asking things somewhat indirectly to avoid bias or answers to please an interviewer.

More important than what you ask is often the quality of questions a candidate asks YOU.
It gives you a sense of their strategic thinking capabilities, of work ethic (have they done their homework?) but perhaps more importantly, of their empathy and ability to connect and learn from others. Not to mention the size of their ego…

I prefer questions that aren't too broad, that fit to realistic constraints, to avoid a generic response.

<aside class="quote">
    <em>“A problem well stated is a problem half-resolved.”</em>
    <cite><br> ― <a href="https://en.wikipedia.org/wiki/Charles_F._Kettering">CF Kettering</a></cite>
</aside>

Sometimes, the exact answer is not as important as the method through which you came to that answer (especially for questions that ask for an exact number). This is why it’s important to show interviewers how you think, break down your steps, and logically explain each one.

<div class="container-youtube">
  <iframe width="560" height="349" src="https://www.youtube.com/embed/dFVrncgIvos" title="YouTube video player" frameborder="1" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- What side projects are you working on?" -> People who are passionate in my industry don't stop learning and exploring when they get home.

- Show me an example of your written work. Or take take 5 minutes and write down your responce to this email. Why? Interviews are very verbal, most office jobs are not.

- our company values are xyz we're thinking of dropping one, which would you drop and why. You the keep dropping one. You could also be a total douche and ask the question without listing the values.

# Technical

- Describe the most difficult project you’ve worked on to date.
-
- You’re tasked with explaining a basic coding principle—KISS—to a group of kindergarteners. You can use any supplies in the classroom. How do you go about it?

- How easy or difficult it is to change a single field's type, add/remove fields at the platform level? Would clients break? Trying to determine the cascading effects it brings at Platform to Client levels.

Basics: How does the web work?
Taste: Whats your favourite software and why?
Complexity: explain in detail your opus magnum as if I’m a business person then a techs. Then I Go deep
Vision: what does the future look like for <their tech>

What are you afraid of?

My most proud answer was to the interview question ‘why do wheetabix come in packets of 12 or 24’
I was able to say ‘it’s customer centric because whether a consumer likes to have 1,2,3, or 4 wheetabix, they finish the packet cleanly.

You type <YOur company name> into the address bar of your browser and press enter. What happens next?

I also once asked a candidate to explain quantum entanglement in as few words as possible… he put two cups on the table and said ‘you move this, this moves’ as he twisted the cups… technically.. three words… beautiful, he was hired.

What's the thing you've done in your career or life that was the toughest to make happen, that you felt like giving up on, but you made it happen and now it's up there with your proudest accomplishments? Tell me the story

What's your best prompt and why?

"What is the last thing you learned that was not related to your work?"
Looking for curious people that want to grow.

Do you have a favorite model or a tool that you feel is underrated ?

# Random

- Tell me about some adventorous thing that you have done.

- What was the last book you read and what did you learn from it?

- How would you sell ice cream in Alaska?

# Logical

- If you look at a clock and the time is 4:17, what is the angle between the hour and the minute hands?

- How would you figure out the weight of a commercial airplane without a scale?

- How would you escape if you were trapped inside a washing machine?

# Behavioral

- How do you handle unexpected changes or setbacks in a project?
- Can you provide an example of a time when you had to adapt to a significant change in the workplace?
- How do you handle constructive feedback from colleagues or supervisors?
- How do you learn?

# Leadership

- How do you inspire and motivate your team during challenging times?
- Can you describe a situation where you successfully led a team through a challenging project?

# Creative

- How do you approach solving problems that have no clear solution?
- Describe a project where you had to think creatively to overcome a challenge.
- What skill have you always wanted to learn but haven’t had the chance to?
- How would you explain your job to a five-year-old?
- Describe the color yellow to somebody who’s blind.
- If you could invent a new ice cream flavor, what would it be and why?
- Convince me to move to your city.
- What is the biggest problem the world is currently facing and, given a limited amount of resources, what steps would you take to solve it?
- Pitch my business to me as if you were me, and I was an investor interested in buying the company.
- In five minutes, can you explain something to me that you know well?

# Unconfortable

- Tell me about a time when you overpromised and underdelivered.
- What do you do if you realize you’re not going to meet a deadline?
- “Why should we not hire you?”

# Values and Achievements

- Throw your resume aside and tell me what makes you, you.”
- What's something you'd be ecstatic about doing every day for the rest of your professional career?

# Cultural

- Describe the work environment that will help you to contribute most effectively.
- What are the three most important attributes you’ll bring to our company?
- How are you going to continue to develop your professional skills and knowledge?

# To Employer

- “A year from now when you’re looking back on this hire, what would I have done to exceed every expectation?”
- “What are the biggest challenges you expect the person in this role to face?”
- In terms of professional qualities, what do you believe sets apart the most successful employees in this organization?
- “If you had a magic wand and could change anything at this company, what would it be?”
- How does the company measure success for someone in this position, and what are the key metrics for this role?
- What is the biggest challenge your team is currently facing that someone in this role could help address?
- What opportunities for professional growth and development can be expected in this position?
- What does a typical career path look like for someone in this position?
- How does the team celebrate successes and handle setbacks?
- What are the company's long-term goals and how does this position contribute to achieving them?
- Can you share an example of a recent project where the team demonstrated strong collaboration?
- What is the most important thing they need to know about the team dynamics?
- What are the most impactful projects or initiatives that someone in this role would be involved in?
- What are the key goals and deliverables expected in the first few months?
- What level of autonomy and decision-making authority does this position have?
- What is one tip you wish you knew when you first started working at this company?

# Non Technical

- What are your questions for me?
- What question should I ask that will make me want to hire you? -> I ask this at the end of the interview.
- What have you learned in the last six months?
- In what way do people underestimate you?
- I love "teach me about a time you had to learn something in a short time span"

- What kind of person are you?

- What important truth do very few people agree with you on?

- "Why shouldn't I hire you?" -> Tests candidates' Theory of Mind capability, i.e., can the candidates take someone else's perspective, and offers the opportunity for deep, introspective answers.

- "What is the conventional wisdom in [technical field XYZ] that you most strongly disagree with and why?" -> Tests candidates' comprehension of status quo of the technical field and their ability to critically reflect on the status quo.

- If you could replace the office coffee machine with any other dispenser, what would it be?

- If married / in a relationship - what about your partner made you choose them? -> The answer will share what the interviewee values in a person and often times what the interviewee’s self-perceived weaknesses are.

- What’s your favourite fruit. Then ask “why?”. -> It shows you how the interviewee makes an argument around something subjective. I’ve found this can be a lens into how one thinks and communicates when things are ambiguous.

- “What’s your superpower?
- What is the next thing you want to learn?
- What is the hardest problem (each in private life and business context) and share with me in detail on how you conquered it (even when you “failed”)?
- 'Who from your previous company would you bring with you to maximize our chances of success?' -> Found it to be a great way to (1) uncover high-quality referrals, but also (2) a subtle way to surface blind spots or assumptions a candidate may have about their role
- What do people get wrong about you on first impressions? What would they say on day 1 and after 6 months?

- Why should we hire you?
- What makes you suitable for this role?
- Why are you still sitting here after i asked you those questions?

- What energizes you at work? (reveals intrinsic motivation)
- Tell me about something you changed your mind on recently. (shows intellectual humility)
- What would your least favorite coworker say about you? (uncovers self-awareness)

- What’s the best part of your job?

- As a leader, how do you know if you're being effective or having impact? Based on that - how do you prioritize your time?
- As you come in to this position - what are the roles, skills or personalities you need to ensure is around you or in your team for you to succeed?

- How do you build relationships and trust with people in your team ?

If everything goes right in your current company over the next five years, where do you end up? How will you have got there?

What's the boldest decision you've made in the past year that ultimately involved a 'leap of faith' in the absence of good data?

What kind of work makes you lose track of time?

What question would you have wanted me to ask?

Why are you here today?

1. If I were to complement you with another team mate, what personality traits or skillset would be complementary to yours? (A non-obvious way of asking, what are your weaknesses).

2. Which constructive feedback have you received more than once? Did you incorporate change with regard to it or not? Why? (Answer so much more than this specific question)

3. Tell me about a mistake you made and how it affected the broader organization or your team? (Same with this one, especially if the person blames circumstances/team and can't take responsibility for own mistakes)

Other than that, digging into "how do you know that?" "how did you measure that?" "what was the outcome?" gives me a sense of if a person understands the bigger picture of actions or sees themselves as a "coder" alone.

Pick an area you know really well. Take 5 minutes to prepare and then teach me everything I should know about it.

Whats important in your life? Why?

What does resilience look like for you?

what is the worst question I could ask you and why

"Could you walk me through your most important life and career choices, that made you end up here - and why you took them?" -> A good answer here could signal high intentionality, self-reflection, and personal drive. This also indicates if the person can handle life challenges and changes (e.g. kids, sickness, job loss, etc.)

teach me about your favorite topic in the world

If you look back at your time at [X company]/ working on [X project], what would you have done differently?
What did you learn at [X company] /working on [X project] that you didn't know before?

If you could go back in time and give yourself one piece of advice, what would it be?

1. 'What's the most difficult feedback you've received and how did it change you?' - They should be able to say a concrete example which will show that they aren't perfect and are coachable.
2. Who was the best manager you ever had? Why? Worst manager and why? - This will give insight into how they like to be managed and/or how they will manage others. It will also bring red flags to the table in a heartbeat "My old manager was an idiot", yada yada

"What views do you hold almost irrationally?"
"What's an common truth in your industry/function that you strongly disagree with"?

"What have you changed your mind on recently?"

What’s the hardest professional decision you’ve ever had to make?

How do you contribute to a positive and inclusive work environment, especially when the team is under pressure?

Tell me about one professional achievement that you’re particularly proud of.

tell me sth you believe to be true, but that most people would disagree with

What is the hardest problem, both professional and personal you solved, why and how?

What gives you energy?

# External Resources

- https://www.linkedin.com/posts/joel-hellermark_what-are-your-best-interview-questions-activity-7344279466182897664-M48u?utm_source=share&utm_medium=member_desktop&rcm=ACoAAB6LRIYBuuTSPSr7cPtObanXlRytHm6YRb8

- Read ’Who’ by Geoff Smart some moons ago, based on 1300 hours of interviews with CEO’s on the hiring topic. NY times bestseller. Great questions and mental models. Recommeded!

# My favorite podcasts

- [The Tim Ferriss Show](https://www.youtube.com/playlist?list=PLuu6fDad2eJyWPm9dQfuorm2uuYHBZDCB)
- [The Lex Fridman Podcast](http://www.youtube.com/@lexfridman)
- [The Diary Of A CEO](https://www.youtube.com/@TheDiaryofACEO)
