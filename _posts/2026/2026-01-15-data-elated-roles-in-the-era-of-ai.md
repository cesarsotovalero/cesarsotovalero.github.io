---
layout: post
title: Projections for Data-Related Roles in The AI Era
subtitle: From Building Models to Owning Systems
tags: career
description: |
  Models are getting easier to train and easier to copy. The scarce skill is owning the whole system: data, deployment, monitoring, governance, and the business outcomes that fall out of it.
keywords:
  - mlops
  - production machine learning
  - data drift
  - monitoring
  - model governance
  - data mesh
  - model cards
image: ../img/posts/2026/2026-01-15/fatbursparken.jpg
share-img: ../img/posts/2026/2026-01-15/fatbursparken.jpg
show-avatar: false
toc: true
mathjax: true
date: 2026/01/15
author: cesarsotovalero
published: true
---

{% youtube U06hExVnVbw %}

I worked as a data scientist in 2025.
From what I can see, data-related roles might quietly mutate this year without an official memo.

Today, machine learning models are faster to build and easier to replicate than ever before.
We have cloud infrastructure, mature libraries, and powerful AI code assistants.
However, keeping models running in production (and tethered to real decisions) is harder than ever.
Which means that these are the skills companies will pay for in 2026: owning production systems end to end.

The shift is already underway.

So, my aim with this post is threefold:

1. To map how data roles are drifting from “model builder” to “system owner.”
2. To define this kind of ownership in practical terms (pipelines, monitoring, governance, and business outcomes).
3. To outline a career path that increases leverage for data professionals without chasing shiny tools.

Let’s dive in!

# From Artifacts to Outcomes

You'll probably not gonna get a email titled "tell me what system do you own or pack your desk", but you might already feel the shift in expectations.
The interview questions are changing, the the job descriptions are changing, and performance metrics are changing.
You deliver a model, then get asked about latency, drift, real-world performance, and whether the metric moved or misled.

Eventually, you realize the model artifact was never the deliverable.

In real-world machine learning, the model is a small part of the system.
Most production cost comes from the surrounding machinery.[^1]
The first version ships fast, and the second version becomes a maintenance job.
The scoreboard is not the model’s accuracy, but whether _business outcomes_ improved.

So the winning move changes: impact beats elegance and reliability beats cleverness.
From artifacts to outcomes.
A model you can’t operate is just a well-formatted opinion.

# Which Model Is The Best Now Matters The Less

Model training is no longer the bottleneck.
Better defaults, [AutoML](https://www.automl.org/automl/), [awesome ML Python libraries](https://github.com/lukasmasuch/best-of-ml-python), and cheaper compute make "getting a model working" the easy part.
Even when modeling is actually hard, the path is increasingly well-paved.

But the truth is: most real failures aren't from weak models but from systems that lie because the input data shifted or the business process changed.

Production systems often see performance drops not because the architecture was wrong, but because the system around it failed to react to distribution changes.[^2]

So the job will evolve:

- From "_Do you know the latest DL architecture?_" to "_Can you run this in production, from end to end?_"
- From "_Do you know the newest library?_" to "_Do you know what breaks first?_"
- From "_Do you know how to tune hyperparameters?_" to "_Do you know how to monitor drift?_"

The most valuable skill is the ability to own the whole chain. That's ownership.

# Production System Ownership

Owning a system means you run a decision-making business process, not a Jupyter notebook.

Ownership forces you to think beyond code and offline metrics.
It forces you to care about failure modes, feedback loops, and incentives.
To accept that data is not stable and users are not rational.
That acceptance is a career booster.

In practice, ownership spans five surfaces:

1. **Data:** quality, contracts, lineage.
2. **Model:** evaluation, documentation, intended use.
3. **Delivery:** deployment, latency, rollback.
4. **Monitoring:** drift, performance, cost.
5. **Governance:** risk, logs, compliance.

If you ignore any one of them, the system will eventually ignore you back.
Because for most real-world sytems the model is a component, not the whole product.

For example, if you build [a financial fraud detection model](./blog/from-classical-ml-to-dnns-and-gnns-for-real-time-financial-fraud-detection) but ignore data quality, you’ll get garbage in and garbage out.
If you ignore monitoring, you’ll miss drift and degrade [key evaluation metrics](./blog/evaluation-metrics-for-real-time-financial-fraud-detection-ml-models) silently.
This could lead to lost revenue, regulatory fines, or customer churn.

So the overall system is the product.
The business outcome is the scoreboard.
And it's my believe that the best way to stay relevant in the coming years is _to own that scoreboard_.

## Skills, Metrics and Problem Framing

You don't need to learn everything.
You need to learn the parts that keep working when tools change (i.e.,the parts that compound across projects and years).

For example, if you're tasked with improving customer churn prediction, you dig in and find:

- The training data excluded users who churned in the first week (survivorship bias).
- The model predicts churn probability, but no one defined what action to take at which threshold.
- Predictions aren't logged, so you can't measure whether high-risk users were actually contacted.
- The feature pipeline breaks silently when a new product launches, because no schema validation exists.

You fix the system:

1. Add schema checks and drift monitoring on input features.
2. Work with the product team to define intervention thresholds (e.g., contact users with >70% churn risk).
3. Log predictions and outcomes to measure intervention effectiveness.
4. Set up a weekly dashboard tracking both model performance and business impact (retention lift).

Six months later, retention improves by 8%, and you can prove causality. That's ownership. The model didn't change, the system did!

## Success Definition

A metric that is observable and attributable is worth more than a sophisticated loss function.
If you can’t articulate how your metric ties to a decision, you’re optimizing a shadow.
Make the metric boring, then make it true.

Here's how:

- Ask this question relentlessly: “_What decision will this change?_”
- Then ask the second question: _"How will we know it changed for the right reason?_"

That is problem framing!

## Data as a Product

In most large companies, data is treated like an interface with clear ownership, contracts, and checks.

Modern [data mesh thinking](https://en.wikipedia.org/wiki/Data_mesh) emphasizes delivering analytical data as a product with interfaces and ownership, not as a byproduct of engineering work.[^3]
In my experience, better engineering around data often beats endless model tweaking.

For me, it works well starting small: add schema contracts, simple checks that fail loudly, and lineage so "what changed?" becomes a quick answer, not a week-long hunt.
That's what professionals call _reliability_, and it's a career booster.

## Testing and Production Readiness

Many ML teams under-test because they over-believe the capacity of their models.

A principle from production ML readiness: ["it works locally" is not a phase of software development](https://en.wikipedia.org/wiki/List_of_publications_in_data_science).
Production-ready models have tests, monitoring, rollback plans, and observability.

In the eyes of stakeholders, a model without monitoring is a demo, a pipeline without tests is a riss, and a system without rollback is an incident waiting for its calendar invite.
As a data professional, be the person who prevents that invite.

## Real World ML

Reality changes, then your model follows, then your dashboard lies and the business gets a hit.
[Concept drift](https://en.wikipedia.org/wiki/Concept_drift) is the default state of deployed systems.
You need monitoring for input distributions, outputs, and business KPIs—and a playbook for what to do when drift hits.

Here’s a tiny practical pattern: log predictions and the features that drove them.
Track a drift signal per feature (e.g., [PSI](https://www.geeksforgeeks.org/data-science/population-stability-index-psi/)) with thresholds.
Alert on change and define a response.

Here's a simple PSI implementation in Python:

{% highlight python linenos %}
import numpy as np

def psi(expected, actual, bins=10, eps=1e-6):
quantiles = np.quantile(expected, np.linspace(0, 1, bins + 1))
quantiles[0], quantiles[-1] = -np.inf, np.inf

    def hist(x):
        counts, _ = np.histogram(x, bins=quantiles)
        p = counts / max(counts.sum(), 1)
        return np.clip(p, eps, 1)

    e = hist(expected)
    a = hist(actual)
    return np.sum((a - e) * np.log(a / e))

{% endhighlight %}

The point: measurable signal, threshold, and response, so that when drift hits (and will do), you're ready to act.

## LLMs Add a New Failure Mode (Non-Determinism)

LLMs make capability cheap and behavior slippery.
Nondeterminism is baked into the architecture: sampling settings like `temperature` exist because outputs vary across runs, even with identical inputs.
Your system becomes probabilistic even when your code isn't.

Once integrated, new failure modes appear:

- **Prompt regressions:** A small wording change can flip the output.
- **Silent degradation:** The model changes under you (version updates, temperature drift), and you don't notice until users complain.
- **Cost spikes:** Token counts explode because the model got chattier or a prompt was rewritten poorly.

Here's what helps:

1. **Version prompts like code.** Store them in Git (not a Notion doc). Track changes, review diffs, and tie versions to deployments.
2. **Test prompts systematically.** Use a fixed eval set with known inputs and expected outputs. Measure pass rate, not vibes.
3. **Monitor output distributions.** Track length, sentiment, keyword frequency, any signal that catches behavioral drift before it cascades.
4. **Track cost per call.** Set alerts when average token counts spike. LLMs are elastic infrastructure; cost is a signal, not just a bill.

The pattern is the same as classic ML: make behavior observable, drift detectable, and regressions catchable.
The difference is that LLMs fail in new ways, silent, stochastic, and expensive.
So you add new defenses: prompt tests, output monitoring, and cost tracking.

That's ownership in the LLM era.

## Governance Is Part of the Job

If your system influences people, money, or risk, governance shows up.

The [European Union’s AI Act](https://en.wikipedia.org/wiki/Artificial_Intelligence_Act) mandates quality, transparency, human oversight, and safety obligations for high-risk AI systems.
Deployers are expected to monitor and log behavior, assign human oversight, and ensure input data relevance.[^5]
Compliance is insurance: auditability, explainability of intent, and clarity when things go wrong.

# Role Shifts To Expect

Here's how I see data-related roles evolving in 2026:

- **Analytics roles** are becoming more decision-shaped. Dashboards are cheap once data is available, so value moves to interpretation and “what should we do next?” If you can’t recommend action, you’re doing archaeology.

- **Applied ML roles** are becoming more end-to-end. The center of gravity shifts from model building to operating the full loop: definition, deployment, monitoring, and iteration. Accountability becomes the differentiator.

- **Research roles** still exist, but they aren’t the default. Only a handful of organizations push the frontier; most companies are trying to turn capabilities into reliable products. That gap is widening, so pick your lane intentionally.

# Career Advice

Optimize for ownership.
Pick one production system and own the loop: define the metric, ship the pipeline, add monitoring, write a runbook, and measure impact.
Ownership is the fastest teacher.

Learn “just enough engineering.”
You don’t need to become a backend polyglot.
You do need deployment basics, monitoring, versioning, and incident response.
Knowing how work ships turns you from “the data person” into “the person who makes things happen.”

Translate your work into business outcomes.
Accuracy is interesting; outcomes are persuasive.
Speak in revenue, cost, risk, retention, and customer experience.
Then decision-makers stop seeing you as technical support, and start seeing you as a partner.

# Summary

In 2026, the folks who struggle in data roles aren't the ones missing the newest tool.
They're the ones who stop at analysis and hand off reality.
They ship a model, deliver a slide deck, and say "I'm done."
But reality laughs and shifts the distribution.

The people who thrive do something simpler and rarer.
They stay curious when systems get messy.
They lean in when production contradicts the notebook.
They care about outcomes, not artifacts.

When building models become easier, shifting towards complexity becomes the right move.
And it's my belief that owning systems end to end is that move.

# Footnotes

[^1]: D. Sculley et al., [[_Hidden Technical Debt in Machine Learning Systems_](https://papers.neurips.cc/paper/5656-hidden-technical-debt-in-machine-learning-systems.pdf)] (NeurIPS 2015).
[^2]: Aria Khademi et al., [_Model Monitoring and Robustness of In-Use ML Models: Quantifying Data Distribution Shifts Using Population Stability Index_](https://arxiv.org/abs/2302.00775) (arXiv 2023).
[^5]: Article 26, [_Obligations of Deployers of High-Risk AI Systems_](https://artificialintelligenceact.eu/article/26/) (AI Act detail).
