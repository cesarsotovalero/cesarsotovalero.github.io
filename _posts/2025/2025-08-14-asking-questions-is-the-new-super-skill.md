---
layout: post
title: Answers Are Cheap, Questions Are Gold.
subtitle: In a world full of answers, be the one who asks better
tags: ai
description: |
  In a world where knowledge is abundant, the ability to ask insightful questions is becoming increasingly valuable. I believe that mastering the art of questioning can unlock new opportunities and get the most of the current AI landscape. This post dives into techniques, patterns, and anti-patterns I've learned over time from top questioners. It covers real-world examples and best practices targeting both humans and AI alike.
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

I remember, in my infancy, I had access to only a few old books at home.
The new ones either weren’t available or were too expensive to acquire.
If I wanted to read good content back then, I had to walk to the local library and have it on-site.

Later on in my 20s, I observed that university professors had read a lot of books.[^3]
They were respected for the sheer amount of knowledge they had accumulated over a lifetime.
We valued professors because their knowledge and expertise were scarce.

Now, in my 30s, reading books is not as trendy as before, and knowledge is available from anywhere.
Getting access to information is cheaper than ever, and even the latest scientific advances move at lightspeed.
A curious 10-year-old today can access cutting-edge tools and learn from the latest research papers, right from home!

More remarkably, AI has drastically changed the way we value knowledge in the last few years.
Everyone can now prompt an AI assistant (like ChatGPT) for free and get almost instant answers to practically any imaginable question.
I believe AI represents an optimization milestone in the way we search for human knowledge.
The impact could be even more than what the Google search engine did in the early days of the internet.

AI has made answers abundant and general knowledge intuitively accessible.
However, current AI models still struggle to figure out how to apply, synthesize, and adapt existing knowledge to create something genuinely new.
This limitation is a consequence of the way current language models operate.

With the rise of more advanced reasoning models, the ability to formulate the right questions to drive AI in the right direction is a skill we need to incorporate into our everyday lives.
AI has shifted our focus from trying to find answers to thinking about *what* and *how* to formulate the right questions.

I’d argue that as the value of getting answers goes down, the value of formulating new original questions that drive actual action should go up.
So, coming up with original and relevant questions represents a real competitive edge.

What’s more, I believe that the perceived value of those who have mastered the “art of asking questions” will increase accordingly.
Just look at the rise of professions that rely heavily on questioning skills such as podcasters and interviewers.
These guys have mastered the ability to ask good questions and extract value for their audience.

Day by day, I'm doing a conscious effort at becoming better at the art of asking questions.
This post is about techniques, patterns and anti-patterns I’ve learned over time from top questioners.
It covers real world examples and best practices targeting both humans and AI alike.

👉 Check out my compilation of [Job Interview Questions](../files/posts/2025/2025-08-14/tech-interview-questions.md).

# When to Ask Questions?

<!-- Video from Veritasium: "The Blender Question Everyone Gets Wrong"  -->
<div class="container-youtube">
  <iframe width="560" height="349" src="https://www.youtube.com/embed/dFVrncgIvos" title="YouTube video player" frameborder="1" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

Short answer: every time you can!

Back in the day, asking frequent and awkward questions was considered an annoying practice in many cases.
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

<aside class="quote">
    <em>“A problem well stated is a problem half-resolved.”</em>
    <cite><br> ― <a href="https://en.wikipedia.org/wiki/Charles_F._Kettering">CF Kettering</a></cite>
</aside>

Good questions have purpose and "make sense" (in general).[^1]
They are unambiguous, give just enough context, and set limits.

Scope is reduced so that answer feel smaller.
The question itself must strip away everything irrelevant.
As a rule of thumb, if a the question doesn’t make any difference to the argument, it needs to be sharpened.

There are three techniques to improve question formulation:

* Aim, scope, and payoff (ASP)
* Clarity, context, and constraints (3C)
* Falsifiability and measurability (FM)

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

<aside class="quote">
    <em>“Good questions turn meetings into decisions, incidents into root causes, and hunches into hypotheses.”</em>
</aside>

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

1. **First-principles** (“What are the primitives?”): Strip away jargon and complexity until you get to the most basic truths. From there, rebuild your understanding. This works because reality is easier to reason about than opinions.

2. **Inversion** (“How could this fail?”): Instead of only asking how to succeed, flip the question and look for ways it could go wrong. Anticipating failure is often the fastest way to avoid it.

3. **Disconfirming evidence** (“What would prove me wrong?”): Ask what would make your current belief false. This keeps you from cherry-picking facts that only confirm your view.

4. **Assumption audit** (“What am I taking for granted?”): List the things you believe are true without checking.
Questioning assumptions often reveals the weakest part of your thinking.

5. **Constraint lens** (“What if we had half the time/budget?”): Imagine having fewer resources. Constraints force creativity, sharpen priorities, and surface shortcuts you might have missed.

6. **Comparative calibration** (“Compared to what?”): Numbers and claims mean little without context.
Always anchor them to a baseline, a competitor, or a past result.

7. **Decomposition** (“Can we split this into 3 parts?”): Break a big problem into smaller, more manageable chunks.
Solving each piece separately is often faster and less overwhelming.

8. **Time travel** (pre-mortem/post-mortem): Jump forward in time. In a pre-mortem, imagine the project has failed and ask why. In a post-mortem, imagine it has succeeded and trace back the steps that led there.

# Anti-Patterns

Some questions don’t just fail to help but actually backfire.
They actively distort the truth or shut down useful discussion.

Here are three common traps to avoid:

1. **Loaded and leading questions:** These questions sneak in assumptions or push the respondent toward a certain answer. For example, “Why is our onboarding so bad?” assumes it *is* bad. Instead, ask neutrally: “How does our onboarding compare to expectations?”

2. **Double-barreled and vague scope:** Two questions in one confuse people and muddy the answer.  “How do we improve onboarding and reduce churn?” is really two separate discussions. Similarly, asking with no clear scope, like “What’s the best database?”, leads to endless “it depends.” Split them and define the boundaries.

3. **Why-blame vs. how-fix framing:** Asking “Who messed this up?” shifts focus to defending reputations instead of solving problems. “How can we prevent this next time?” keeps the discussion forward-looking and solution-oriented.

4. **Scope creep:** Two questions in one confuse people and muddy the answer. “How do we improve onboarding and reduce churn?” is really two separate discussions.  Similarly, asking with no clear scope (like “What’s the best database?”) leads to endless “it depends.” Split them and define the boundaries.

# How to Train

For me, one of the best ways to learn the art of asking great questions is by listening to the best podcasters out there.
Think about it for a second, their entire job revolves around asking the right questions at the right time.

What I usually do is keep track of the best questions they ask (I even have a [Notion](https://www.notion.com/) template for this).
I note down the exact wording, the follow-up questions, and even the flow of their thought process.
Over time, this has helped me sharpen my own questioning skills a lot.

Here are some of my favorite podcasters who have an interview-first format:

* [The Diary Of A CEO](https://www.youtube.com/@TheDiaryofACEO)
* [The Tim Ferriss Show](https://www.youtube.com/playlist?list=PLuu6fDad2eJyWPm9dQfuorm2uuYHBZDCB)
* [The Lex Fridman Podcast](http://www.youtube.com/@lexfridman)
* [The Joe Rogan Experience](https://www.youtube.com/@PowerfulJRE)

# External Resources

- I read ["Who"](https://amzn.eu/d/3J43pVi) by [Geoff Smart](https://www.linkedin.com/in/drgeoffsmart/) some moons ago, based on 1300 hours of interviews with CEO’s on the hiring topic. NY times bestseller. Great questions and mental models. Recommended!

# Footnotes

[^1]: I know, if something makes or not is extremelly subjective, but let's say it should make sense for the answerer at last.

[^2]: Note that in the case of humans, we tolerate less quality answers. In many cases, the exact answer is not as important as the method through which you came to that answer.

[^3]: Turns out I was on the right track when I was a child: reading was important!
