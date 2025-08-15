---
layout: post
title: When Answers are Cheap, Questions are Gold
subtitle: Learning to ask is the new competitive edge
tags: ai
description: |

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

I remember, a long time ago, when I was 10, I had only a few old books at home.
The new ones either weren’t available or were too expensive for my narrow pocket.
If I wanted to read good stuff back then, I had to walk to the local library and read them there.

Ten years later, in my 20s, I observed that university professors had read a lot of books.
They were respected for the sheer amount of knowledge they had accumulated over a lifetime.
We valued them because their skills and expertise were scarce.

Now, in my 30s, reading books is not as trendy as before, and knowledge is available from anywhere.
Getting access to information is cheaper than ever, and even the latest scientific advances move at lightspeed.
A curious 10-year-old today can access cutting-edge tools and learn from the latest research papers, right from home!

More remarkably, AI has drastically changed the way we value knowledge in the last few years.
Everyone can now prompt an AI assistant (like ChatGPT) for free and get almost instant answers to practically any imaginable question.
I believe AI represents an optimization shift in the way we search for human knowledge.
The impact could be even more than what the Google search engine did in the early days of the internet.

AI has made answers abundant and general knowledge intuitively accessible.
However, current AI models still struggle to figure out how to apply, synthesize, and adapt existing knowledge to create something genuinely new.
This limitation is a consequence of the way current language models operate.

With the rise of more advanced reasoning models, the ability to formulate the right questions to drive AI in the right direction is a skill we need to incorporate into our everyday lives.
AI has shifted our focus from trying to find answers to thinking about *what* and *how* to formulate the right questions.

I’d argue that as the value of getting answers goes down, the value of formulating new questions that drive actual action should go up.
So, coming up with original and relevant questions represents a real competitive edge.

What’s more, I believe that the perceived value of those who have mastered the “art of asking questions” will increase accordingly.
Just look at the rise of professions that rely heavily on questioning skills such as podcasters and interviewers.
These guys have mastered the ability to ask good questions and extract value for their audience.

Day by day, I'm doing a conscious effort at becoming better at the art of asking questions.
This post is about techniques, patterns and anti-patterns I’ve learned over time from top questioners.
It covers real world examples and best practices targeting both humans and AI alike.

👉 Check out my compilation of [Job Interview Questions](TODO).

# When to Ask Questions?

Short answer: every time you can!

Back in the day, asking frequent questions was considered an annoying practice in many cases.
Why?
I'd argue that our inherent human laziness had something to do with it.
Leaving a question hanging meant somebody had to squeeze their brain to find an answer (i.e., to work).
Otherwise, an uncomfortable void of uncertainty threatened to emerge.

This is no longer the case.

AI has completely removed the fear of “feeling stupid” for both sides: the asker and the responder.
The more we use AI, the more comfortable we become with the idea of questioning everything.
In meetings or events, asking is a signal of attention, and in an era where AI can respond fast, it also signals the ability to challenge the *status quo* and express a personal opinion.

The more questions you ask, the better prepared you will be for whatever is coming next.

# Techniques

Good questions have purpose and "make sense" in general.[^1]
They are unambiguous, give just enough context, and set limits.

Scope is reduced so that answer feel smaller.
The question itself must strip away everything irrelevant.
As a rule of thumb, if a the question doesn’t make any difference to the argument, it needs to be sharpened.

There are three techniques to improve question formulation:

- Aim, scope, and payoff (ASP)
- Clarity, context, and constraints (3C)
- Falsifiability and measurability (FM)

## Aim, Scope, Payoff

Without aim you wander.
Without scope you boil the ocean.
Without payoff you can’t act.
A good question changes what happens in the next 10 minutes.

So, the core idea is to state what you’re trying to achieve (aim), how far you’ll look (scope), and what you’ll do with the answer (payoff).

| Element    | Description                                            | Template                                       |
| ---------- | ------------------------------------------------------ | ---------------------------------------------- |
| **Aim**    | What you want to achieve.                              | “We want to \_\_.”                             |
| **Scope**  | Boundaries of your inquiry (data, time, users, tools). | “Within \_\_ (data/time/users/tools).”         |
| **Payoff** | What you’ll do with the answer.                        | “So we can \_\_ (decision/action/experiment).” |

Examples:

| ❌ Before (Vague)                             | ✅ After (ASP Applied)                                                                                                                                                                                                                                                              |
| -------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Product:** “How do we improve onboarding?” | **Aim:** Increase week-1 activation. **Scope:** Mobile iOS, signup flow only. **Payoff:** Decide which of 3 changes to A/B test.<br>**Question:** “What single change in the iOS signup flow would most increase week-1 activation, and which 3 options should we A/B test first?” |
| **Research:** “Is our model good?”           | **Aim:** Decide to ship or retrain. **Scope:** Fraud model v2, last 30 days. **Payoff:** Go/no-go.<br>**Question:** “Given the last 30 days, does fraud-v2 beat fraud-v1 on precision\@top1% by ≥2pp at equal recall, so we ship or retrain?”                                      |
| **Personal:** “How can I get healthier?”     | **Aim:** Improve sleep. **Scope:** Next 14 days, bedtime routine only. **Payoff:** Adopt one habit.<br>**Question:** “Which single bedtime habit should I try for 14 days to raise average sleep by 30 minutes?”                                                                   |

## Clarity, Context, Constraints

Clarity prevents misreads, context prevents wheel-reinvention, constraints prevent infinite “it depends.”

The core idea of this principle is to make the question unambiguous, include the background that matters, and set limits that force trade-offs.

| Element         | Description                                                           | Example                                                       |
| --------------- | --------------------------------------------------------------------- | ------------------------------------------------------------- |
| Clarity         | Define terms, units, and success. Prefer nouns/verbs over adjectives. | “Write-heavy workload (\~5k writes/sec), 99.9% latency <10ms” |
| Context         | Minimum viable backstory: objective, prior attempts, relevant data.   | “Churn up 3% in SMB last quarter”                             |
| Constraints     | Time, budget, tools, risk tolerance, guardrails.                      | “EU-only, managed service, must decide by Friday”             |

Quick rewrites:

| ❌ Before                    | ✅ After                                                                                                                                       |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| “What’s the best database?” | “For a write-heavy workload (\~5k writes/sec), 99.9% latency <10ms, EU-only, managed service, what database should we evaluate first and why?” |
| “How should I learn LLMs?”  | “With 5 hours/week for 6 weeks and access to GCP, what learning plan gets me from zero to fine-tuning a small model on our support tickets?”  |

## Falsifiability and Measurability

Decisions stick when they survive an attempt to disprove them.
Measurement turns opinion into feedback.
The core idea is to phrase questions so answers can be tested. If it can’t be wrong, it can’t be right.

| Pattern                 | Description                                   | Example                                                                                                                    |
| ----------------------- | ------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| Hypothesis form     | State belief, expected outcome, magnitude, audience, and timeframe. | “We believe shortening the signup form from 7 to 4 fields will raise iOS activation by 3–5% for new users within 14 days.” |
| Acceptance criteria | Define clear pass/fail metrics.                                     | “Ship if precision\@top1% ≥ 0.92 with recall ≥ 0.55 on June data.”                                                         |
| Disconfirmers first | Identify what would prove the belief false.                         | “If activation does not increase by ≥1% after 7 days with 95% CI, abandon the change.”                                     |

Measurability checklist:

| Requirement               | Description                        |
| ------------------------- | ---------------------------------- |
| Named metric              | Not vibes, actual measurable value. |
| Baseline & delta          | Current value and target change.   |
| Time window & sample size | Duration and amount of data.       |
| Data source & method      | How you’ll calculate the metric.   |
| Decision rule             | Go/stop/iterate conditions.        |

Quick Rewrite:

| ❌ Before                     | ✅ After                                                                                                                                |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| “Will the new pricing work?” | “In a 50/50 geo split for 21 days, does new pricing increase gross margin per user by ≥4% with no more than a 1pp drop in conversion?” |


# Patterns

Reusable question patterns help you think more clearly, spot blind spots, and get better answers faster.

Here are eight you can borrow and use right away.

1. First-principles (“What are the primitives?”)

Strip away jargon and complexity until you get to the most basic truths. From there, rebuild your understanding.
This works because reality is easier to reason about than opinions.

2. Inversion (“How could this fail?”)

Instead of only asking how to succeed, flip the question and look for ways it could go wrong.
Anticipating failure is often the fastest way to avoid it.

3. Disconfirming evidence (“What would prove me wrong?”)

Ask what would make your current belief false.
This keeps you from cherry-picking facts that only confirm your view.

4. Assumption audit (“What am I taking for granted?”)

List the things you believe are true without checking.
Questioning assumptions often reveals the weakest part of your thinking.

5. Constraint lens (“What if we had half the time/budget?”)

Imagine having fewer resources.
Constraints force creativity, sharpen priorities, and surface shortcuts you might have missed.

6. Comparative calibration (“Compared to what?”)

Numbers and claims mean little without context.
Always anchor them to a baseline, a competitor, or a past result.

7. Decomposition (“Can we split this into 3 parts?”)

Break a big problem into smaller, more manageable chunks.
Solving each piece separately is often faster and less overwhelming.

8. Time travel (pre-mortem/post-mortem)

Jump forward in time. In a pre-mortem, imagine the project has failed and ask why.
In a post-mortem, imagine it has succeeded and trace back the steps that led there.

> Use questions to turn meetings into decisions, incidents into root causes, and hunches into hypotheses.

# Anti-Patterns

Some questions don’t just fail to help but actually backfire.
They actively distort the truth or shut down useful discussion.

Here are three common traps to avoid:

1. Loaded and leading questions

These questions sneak in assumptions or push the respondent toward a certain answer.
For example, “Why is our onboarding so bad?” assumes it *is* bad. Instead, ask neutrally: “How does our onboarding compare to expectations?”

2. Double-barreled and vague scope

Two questions in one confuse people and muddy the answer.
 “How do we improve onboarding and reduce churn?” is really two separate discussions.
 Similarly, asking with no clear scope, like “What’s the best database?”, leads to endless “it depends.” Split them and define the boundaries.

3. Why-blame vs. how-fix framing

Asking “Who messed this up?” shifts focus to defending reputations instead of solving problems.
“How can we prevent this next time?” keeps the discussion forward-looking and solution-oriented.

4. Scope creep

Two questions in one confuse people and muddy the answer.
“How do we improve onboarding and reduce churn?” is really two separate discussions.
 Similarly, asking with no clear scope (like “What’s the best database?”) leads to endless “it depends.” Split them and define the boundaries.

# How to Train


Build the muscle with quick, repeatable reps that sharpen clarity under constraints.

Use simple checklists and prompt structures to make good questioning your default.

One-page question checklist

Interview prompts inspired by Lex/Tim/Steven

AI co-pilot prompts for faster iteration

Deploy high-leverage questions this week and a mini-template to turn vague asks into action.

Ten questions to use this week

1. TODO
2. TODO
3. ...

# References




# Footnotes

[^1]: I know, if something makes or not is extremelly subjective, but let's say it should make sense for the answerer at last.
[^2]: Note that in the case of humans, we tolerate less quality answers. In many cases, the exact answer is not as important as the method through which you came to that answer.


<aside class="quote">
    <em>“A problem well stated is a problem half-resolved.”</em>
    <cite><br> ― <a href="https://en.wikipedia.org/wiki/Charles_F._Kettering">CF Kettering</a></cite>
</aside>

 (especially for questions that ask for an exact number).
This is why it’s important to show interviewers how you think, break down your steps, and logically explain each one.

<div class="container-youtube">
  <iframe width="560" height="349" src="https://www.youtube.com/embed/dFVrncgIvos" title="YouTube video player" frameborder="1" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- What side projects are you working on?" -> People who are passionate in my industry don't stop learning and exploring when they get home.
- Show me an example of your written work. Or take take 5 minutes and write down your responce to this email. Why? Interviews are very verbal, most office jobs are not.
- our company values are xyz we're thinking of dropping one, which would you drop and why. You the keep dropping one. You could also be a total douche and ask the question without listing the values.

# Technical

- Describe the most difficult project you’ve worked on to date.
- You’re tasked with explaining a basic coding principle, KISS, to a group of kindergarteners. You can use any supplies in the classroom. How do you go about it?
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
- If everything goes right in your current company over the next five years, where do you end up? How will you have got there?
- What's the boldest decision you've made in the past year that ultimately involved a 'leap of faith' in the absence of good data?
- What kind of work makes you lose track of time?
- What question would you have wanted me to ask?
- Why are you here today?
- If I were to complement you with another team mate, what personality traits or skillset would be complementary to yours? (A non-obvious way of asking, what are your weaknesses).
- Which constructive feedback have you received more than once? Did you incorporate change with regard to it or not? Why? (Answer so much more than this specific question)
- Tell me about a mistake you made and how it affected the broader organization or your team? (Same with this one, especially if the person blames circumstances/team and can't take responsibility for own mistakes)
- Other than that, digging into "how do you know that?" "how did you measure that?" "what was the outcome?" gives me a sense of if a person understands the bigger picture of actions or sees themselves as a "coder" alone.
- Pick an area you know really well. Take 5 minutes to prepare and then teach me everything I should know about it.
- Whats important in your life? Why?
- What does resilience look like for you?
- What is the worst question I could ask you and why

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
- [The Joe Rogan Experience](https://www.youtube.com/@PowerfulJRE)
