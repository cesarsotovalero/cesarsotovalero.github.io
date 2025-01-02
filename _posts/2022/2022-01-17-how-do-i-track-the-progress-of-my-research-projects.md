---
layout: post
title: How to Track the Progress of a Research Project
subtitle: My methodology based on the weekly delivery of verifiable artifacts
tags: science
description: Academic research is a demanding activity in constant change and evolution. Consequently, tracking the progress of a research project is challenging. This post describes my methodology to address this particular problem. 
keywords: research artifact,verifiable artifacts,scientific career,research methodology,PhD student
image: ../img/posts/2022/globe_cover.jpg
share-img: ../img/posts/2022/globe_cover.jpg
show-avatar: false
toc: true
date: 2022/01/17
author: cesarsotovalero
published: true
---

Academic research is a very intense and mentally demanding activity subject to constant change and evolution.
At the beginning of a research project, there is often [no clear path](https://www.cesarsotovalero.net/blog/book-review-the-phd-grind.html) to follow.
Consequently, researchers have to figure out a good plan to take in order to achieve their objectives.
But a research project typically lasts between 3 and 12 months, so there is no infinite ~~money~~ time, and progress should be made and reported consistently.
This situation usually creates tension and a sense of urgency that most researchers have to live with.
From the supervisor's perspective, the status of the project should be monitored to make sure that it is not heading into a dead end.
For the student, it is crucial to demonstrate the progress being made and deliver enough results to fulfill the supervisor's expectations.
To this end, research is a coordinated effort that works better when a sound progress tracking system is established and followed by all the involved parties.
What mechanism is good to keep track of the progress being made?
This post explains my methodology to address this particular problem. 
It is based on the weekly delivery of verifiable research artifacts.
Let me show you what I mean. 

<figure class="jb_picture">
{% responsive_image path: img/posts/2022/globe.jpg alt: "Research is a handcrafting activity that produces unique and beautiful artifacts. ." %}
  <figcaption class="stroke"> 
&#169; Research is a handcrafting activity that produces unique and beautiful artifacts. Photo from <a href="https://goo.gl/maps/j8GC4KtHEXoKxLpB8">Tekniska Högskolan station</a>.
</figcaption>
</figure>

# The Problem With Tracking Research Progress

[//]: # (Meta explanation of theh problem)
Supervision is usually a one-to-one activity carried out by the student and her supervisor.
In the beginning, there are kick-off meetings and some raw ideas of what would be the ideal outcome to be accomplished.
There is a _what_ but not a _how_.
Therefore, intense research exploration and further communication are needed to bring light to the nascent work.
This exploration leads to a seemingly endless cycle of experimentation followed by scheduled discussions. 

One drawback of this one-to-one back and forth is that it sometimes creates a feeling that it is not necessary to document everything. 
After all, tasks do not need to be partitioned and distributed among several people. 
Also, it is challenging to determine what results will finally end up being valuable for the project, and which other results will be thrown away the next day. 
A lot of work is intended to be ephemeral, and that’s just how good research works. 
So, it is not clear what results constitute real progress and what do not.

<aside class="quote">
    <em>“The creative and complex nature of the research labor leads to non-linear progress.”</em>
</aside>

[//]: # (Practical explanation of the problem)
Supervisors are typically very busy people. They don’t have the time to analyze all the details of an investigation. Students, on the other hand, are more excited about moving fast because they have more pressure to show up the progress being made. However, research is an iterative process. The goal and scope of an investigation may change over time. This can cause some inexperienced students to feel like they are making something wrong or simply lose their motivation and initial enthusiasm. For example, it is very common to suffer from [writer's block](https://www.cesarsotovalero.net/blog/how-i-overcome-writer-block-when-preparing-a-research-paper.html) or imposter syndrome.

<aside class="quote">
    <em>“Imposter syndrome is a concept describing individuals who are marked by an inability to internalize their accomplishments and a persistent fear of being exposed as a fraud.”</em>
</aside>


[//]: # (Some good practices that exist to remediate)
There are some good practices to mitigate the stress.
It is important to always keep a record of what was discussed in every single meeting (e.g., using a Google Doc or writing comments directly in the working paper).
I used to add a [MoM](https://en.wikipedia.org/wiki/Minutes) file named `minutes.md` along the LaTeX sources of paper on [Overleaf](https://www.overleaf.com/) to keep track of every meeting.
These guidelines are good for orienting the work, but don't help with the student's motivation. 
In this regard, there is nothing as gratifying and motivating as the sense of seeing something concreted being delivered. 

# Research Artifacts

[//]: # (Motivate the solution)
Motivation is key when doing research. But keeping momentum is hard if progress is not quantified. Some metrics exist to measure the quality of research output. Typical examples are the number of papers published and their number of citations. However, the amount of effort spent to produce a publication is tough to measure in practice. Consequently, there is a need to establish an agreement between the supervisor and the student, for the first to measure the progress, for the latter to show it.

[//]: # (Explain the proposed solution)
I come up to the realization that anything that is not verifiable and quantifiable has little value. 
For example, opening an issue on GitHub or answering a question on Stack Overflow are valuable activities because they let a persistent trace of the value being produced (i.e., a link that you can keep for yourself or share with others). On the contrary, asking a question on Slack or discussing it with a colleague in the corridor is quick and easy but does not have the same value. I avoid ephemeral work and instead focus my energy on producing valuable research artifacts.


<aside class="quote">
    <em>“A research artifact is a concrete, traceable and verifiable piece of work that adds value to a research project.”</em>
</aside>


Research artifacts should revolve around some specific research project with a clear goal, such as producing a research paper or witting a thesis.
They can be considered as ~~expendable~~ critical pieces of the research puzzle, which are very necessary to deliver the final output. 
Here are some typical examples of research artifacts:

- A summary of related work is elaborated, i.e., one paragraph per revised paper
- A new section of a paper is written
- A new dataset is collected
- A new feature or bugfix is done on a research tool
- A new experiment showing new results is carried out

[//]: # (Explain the advantages of this solution)

The advantages of thinking and working based on research artifacts are diverse. From the student's perspective, she will feel (and proofs) that some work and progress have been made over time. In this regard, it turns out to be very difficult to dismiss the work produced by somebody who is constantly delivering tangible results. Over time, this approach can also help the student to [build a second brain](https://amzn.to/3u5fsR1) with all relevant pointers that will ~~probably~~ enhance her productivity in the future (I use a GitHub repository as a project’s knowledge archival for this). On the other hand, the supervisor has a concrete piece of work to look at and build upon, which ultimately results in advancing the project goals.

# Friday Reports

Research artifacts should be produced and reported regularly. I use minimalistic Friday reports for this purpose.
The principal intention of these reports is to communicate the research artifacts being produced.
It also helps the supervisor to grasp a minimalistic and clear view of research status.
The supervisor must be able to find all necessary details for each item without asking the student.
Once the artifacts and outcomes are reviewed, it is easier to readjust the goals and coordinate the new tasks.

I have a template for the Friday report. 
Here is an example:

```
From: Student
To: Supervisor
CC: Co-authors and Co-supervisors
Subject: [`WEEK11`] Progress Report

Hi, 

DONE this week:
- Wrote three paragraphs in Section 2 of the paper (`link`)
- Added a new figure in Section 2 (`link`)
- Submitted two pull requests in project `X` (`link` and `link`)

TODO next week:
- To complete the first draft of Section 2
- To collect new data for Section 3
- To summarize the new collected data in a figure or table

QUESTIONS:
- Do we want to discuss `Y` in Section 2?
- Is `Z` relevant for Section 3?
- Should we cite `W` in this paper? 

Cheers,
Student
```

[//]: # (One paragraph about the header)
The email is sent to the supervisor/s, all collaborators should be added in CC (e.g., co-authors and co-supervisors).
The subject starts with the calendar week of the current year (e.g., `[WEEK11]`).
This allows the message to be easily searchable and sorted by most email clients.

[//]: # (One paragraph about the DONE)
The fist section is a set of bulled points listing the achievements `DONE` in the previous week (i.e., the artifacts delivered).
Every individual point should start with a verb in past tense form (e.g., "wrote", "analyzed", "submitted").
The list must not tell _how_ or _why_ the achievement was completed, but only declare what was done.
Note that each point in the list must include a verifiable hyperlink pointing to each artifact.
For example, links to the submitted pull requests on GitHub, or links to a dataset or figure hosted in some external file provider such as Google Drive.

[//]: # (One paragraph bout the TODO)
The second section is a `TODO` list of tasks planned to be completed by the end of next week. 
Every individual point must start with a verb in infinitive form (e.g., "to collect," "to summarize," "to compare"). 
The content of this list is normally discussed in a meeting and both parties, student and supervisor, should agree on the next steps to be taken. 
There should be not more than three tasks in the list. 
Each point must result in a single deliverable artifact.
Ideally, each task in the `TODO` list will appear as  `DONE` in the next Friday report, but not necessarily.

[//]: # (One paragraph bout the QUESTIONS)
Finally, the third section is a list of `QUESTIONS` elaborated by the student about the remaining work to be done.
The intent of the questions is to clarify the tasks for next week.
There must be not more than three questions per report.
The student must frame the questions in a way so that a short answer can be made by the supervisor.
Good questions are those whose responses consist of a simple “yes” or “no” answer.  

# My Results So Far

This approach has proved to work very well for me so far.
From a student's position, I have been able to make [substantial progress](https://www.cesarsotovalero.net/publications) in my research career. As a supervisor, the Friday reports help me to sync quickly on the research topic and guide the student more effectively, which has resulted in some successful [research projects](https://www.cesarsotovalero.net/service). 

# References

- [SIMBA: Simplified Management by Artifacts](https://youtu.be/2IwBc9UI4Sg), by Yegor Bugayenko.
- [:earth_americas: How to do a master's thesis in my group](https://www.monperrus.net/martin/kth-master-thesis), by Martin Monperrus. 
