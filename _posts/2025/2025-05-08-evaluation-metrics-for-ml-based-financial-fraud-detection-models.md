---
layout: post
title: Evaluation Metrics for ML-based Financial Fraud Detection Models
subtitle: An overview
tags: ai
description: |
  After training a real-time financial fraud detection model, the next step is to evaluate its performance. This post provides an overview of the most common evaluation metrics and considerations for fraud detection models, including confusion matrix, precision, recall, F1-score, AUC-ROC, AUC-PR, and more.
keywords:
  - financial fraud
  - fraud detection
  - machine learning
  - deep learning
  - survey
image: ../img/posts/2025/2025-05-08/kungstradgarden_cover.jpg
share-img: ../img/posts/2025/2025-05-08/kungstradgarden_cover.jpg
show-avatar: false
toc: true
mathjax: true
date: 2025/05/08
author: cesarsotovalero
published: true
---

After training an ML model for [real-time financial fraud detection](../blog/real-time-financial-fraud-detection.html), the next step is to evaluate its performance. Fraud detection models face unique challenges during evaluation, including class imbalance, where suspicious transactions are vastly outnumbered by legitimate ones, and the relative costs of false positives vs. false negatives. False positives, which flag legitimate transactions as fraudulent, can lead to customer dissatisfaction, while false negatives, where fraudulent transactions go undetected, can result in significant financial losses.

Below are the most common metrics and considerations for evaluating fraud detection models while keeping these unique challenges in mind.

# Confusion Matrix

Every fraud detection system generates a binary output: a prediction indicating whether a transaction is fraudulent (1) or genuine (0).
Leveraging this universal approach to binary classification, we can establish standard evaluation methodologies to assess the performance of fraud detection systems.

The confusion matrix is a widely used tool for summarizing and visualizing the performance of a classification model in a tabular format.
It provides a clear breakdown of predictions versus actual outcomes. In this matrix:

- The *x*-axis represents the ground-truth labels (actual outcomes).
- The *y*-axis represents the predictions made by the classification model.

Both axes are divided into two categories: positive (fraudulent) and negative (genuine).
The positive class corresponds to the minority class (fraud), while the negative class corresponds to the majority class (genuine).

<img src="/img/posts/2025/2025-05-08/confusion-matrix.svg" alt="Confusion Matrix" />

The confusion matrix includes the following metrics:

- **True Positives (TP):** The number of fraudulent transactions correctly identified as fraud.
- **True Negatives (TN):** The number of genuine transactions correctly identified as genuine.
- **False Positives (FP):** The number of genuine transactions incorrectly flagged as fraudulent.
- **False Negatives (FN):** The number of fraudulent transactions missed by the system (predicted as genuine).

By analyzing these metrics, the confusion matrix provides a comprehensive view of the model's strengths and weaknesses, enabling informed decisions for further optimization.

# Precision

Precision is the fraction of transactions that were actually fraud among all transactions the model flagged as fraud (predicted positive).

For example, if a model flagged 100 transactions as fraud, and 80 of those were indeed fraudulent, then:

$$
\text{Precision} = \frac{TP}{TP + FP} = \frac{80}{100} = 0.8
$$

High Precision means few false positives, so it is crucial for operational efficiency.

Low Precision means investigators waste time on many false alarms, and customers suffer unnecessary declines.

Many top systems aim for very high Precision (e.g., 0.9+) at low fraud rates, but there’s a trade-off with Recall.

Precision is often reported at a certain operating point or as an average if multiple thresholds are considered.

An example interpretation: “Of the transactions our system blocked, 95% were indeed fraudulent”, that’s a Precision of 95%.

# Recall

Recall is the fraction of actual fraud cases that the model correctly predicts as fraud (true positives) out of all actual fraud cases.

For example, if there were 100 actual fraud cases and the model caught 80 of them, then:

$$
\text{Recall} = \frac{TP}{TP + FN} = \frac{80}{100} = 0.8
$$

High Recall means few false negatives, which is critical in fraud detection because missing a fraudulent transaction can lead to financial losses.

Low Recall means many frauds slip through and cause losses.

However, one can usually increase Recall by lowering the detection threshold at the cost of Precision. So there’s a balance.

A Recall of 0.80 means 80% of fraud instances were detected (20% missed).

In practice, businesses may set a Recall target like “catch at least 70% of fraud” and then maximize Precision under that constraint.

# F1-Score

F1-Score is the harmonic mean of Precision and Recall, so it gives a single-figure balance of both metrics.

For example, if Precision is 0.8 and Recall is 0.6, then:

$$
F_1 = \frac{2 \times Precision \times Recall}{Precision + Recall} = \frac{2 \times 0.8 \times 0.6}{0.8 + 0.6} = \frac{0.96}{1.4} \approx 0.686
$$

High F1 means both Precision and Recall are reasonably high.

Low F1 means either Precision or Recall is low, which is undesirable in fraud detection.

F1-Score is useful when we want a combined score for model selection or when class distribution is skewed.

In extremely imbalanced data, even F1 can be dominated by one side if not handled carefully.

F1 is much better than accuracy for fraud.

For instance, if a model has Precision = 0.6 and Recall = 0.6, then F1 = 0.6. If another has Precision = 0.7 but Recall = 0.4, F1 $$ \approx 0.50 $$, telling us the first model is overall better balanced.

F1 is a popular metric in Kaggle competitions and papers to compare models, ensuring they are not just optimizing one at the expense of the other.

# FPR and FNR

False Positive Rate (FPR) is the fraction of legitimate transactions that were incorrectly flagged as fraud (false positives) out of all legitimate transactions.

For example, if there were 1000 legitimate transactions and the model flagged 50 of them as fraud, then:

$$
\text{FPR} = \frac{FP}{TN + FP} = \frac{50}{1000} = 0.05 \text{ or } 5\%
$$

False Negative Rate (FNR) is the fraction of fraudulent transactions that were missed (false negatives) out of all actual fraud cases.

For example, if there were 1000 actual fraud cases and the model missed 20 of them, then:

$$
\text{FNR} = \frac{FN}{TP + FN} = \frac{20}{1000} = 0.02 \text{ or } 2\%
$$

Sometimes businesses set FPR requirements to control false alarms.

For example:

- “We can only review 0.5% of transactions, so FPR must be ≤ 0.5%.”
- “We cannot tolerate missing more than 10% of fraud, so FNR ≤ 10%,” which implies Recall ≥ 90%.

These constraints often drive the choice of operating thresholds more directly than Precision or Recall alone.

# TNR

True Negative Rate (TNR) or Specificity measures how well the system correctly identifies legitimate transactions as non-fraud.

For example, if there were 1000 legitimate transactions and the model flagged 50 of them incorrectly as fraud (FP), the calculation would be:

$$
\text{TNR} = \frac{TN}{TN + FP} = \frac{950}{950 + 50} = 0.95 \text{ or } 95\%
$$

TNR is often overlooked in fraud detection because it’s essentially the complement of the False Positive Rate (FPR):

$$
\text{TNR} = 1 - \text{FPR}
$$

TNR is typically very high in fraud detection systems because the number of legitimate transactions (TN) is much larger than the number of frauds or false positives.

Since Precision already focuses on avoiding false positives, and we typically assume we want to approve as many legitimate transactions as possible, TNR doesn’t usually take center stage.

However, in some contexts, like regulatory requirements or customer experience, it’s important to keep FPR below a certain threshold, such as “FPR ≤ 0.1%,” which directly relates to maintaining high TNR.

# AUC-ROC

The Area Under the ROC Curve (AUC-ROC) measures a model’s ability to distinguish fraud from non-fraud across all possible thresholds.

The ROC curve (Receiver Operating Characteristic) plots True Positive Rate (Recall) against False Positive Rate (FPR).

The AUC is the area under this curve:

- AUC = 0.5 means random guessing.
- AUC = 1.0 means perfect discrimination.

It's computed as follows:

$$
\text{AUC} = \int_0^1 \text{TPR}(FPR) \, dFPR
$$

An intuitive interpretation:

“If I randomly pick a fraud and a legitimate transaction, AUC is the chance the fraud gets a higher risk score.”

AUC is threshold-independent: it summarizes performance across all thresholds, and it’s less sensitive to class imbalance than accuracy.

# AUC-PR

The Area Under Precision-Recall Curve (AUC-PR) plots Precision vs. Recall and focuses squarely on the minority class (fraud), so it tells us how well the model catches fraud while keeping false positives low.

In highly imbalanced data such as fraud detection, AUC-PR is more informative than AUC-ROC because it answers how well the model balances Precision and Recall where it matters.

For instance, a model could have AUC-ROC = 0.98 and still have AUC-PR = 0.10, which means that the model detects fraud more often than non-fraud, but when it comes to real-world detection, Precision at high Recall isn’t stellar.

AUC-PR is the go-to metric when fraud cases are rare, and we care about catching as many as possible without overwhelming the system with false alarms.

## Threshold for AUC-PR

Once we have chosen the best model as per AUC-PR, we need to decide a threshold, denoted as $$ \tau $$, to convert this model’s fraud probability output into a concrete binary decision (fraud or not fraud).

If we look at the Precision-Recall (PR) curve in the figure below, different values of $$ \tau $$ correspond to different trade-offs between Precision and Recall.

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "1px solid #808080" path: img/posts/2025/2025-05-08/AUPRC.png alt: "Sample Precision-Recall curves for two models A and B." %}
  <figcaption class="stroke">
    Fig 2. Sample Precision-Recall curves for two models A and B. Model B is superior to model A as is reflected in the AUC-PR values of the two models. Different points on the PR curve represent different threshold values and different trade-offs between Precision and Recall metrics.
  </figcaption>
</figure>

We ultimately need to choose the right trade-off that suits our use case.
The threshold $$ \tau $$ determines the decision boundary for classifying transactions as fraudulent or genuine. Mathematically, this can be expressed as:

$$ \text{Decision: Fraud if } P(x) > \tau $$

Where:

- $$ P(x) $$ is the predicted probability of fraud for transaction $$ x $$.
- $$ \tau $$ is the threshold value.

With the above framework in mind, we can decide the threshold value $$ \tau $$ based on the value of $$ k $$, where $$ k $$ represents the minimum Precision we want to maintain.

For example, if we want to maintain a minimum Precision of 90%, then $$ k = 90 $$. Using the Precision-Recall curve, we can derive the threshold value $$ \tau $$ as well as the equivalent Recall value at 90% Precision.

This strategy allows us to calculate the optimal threshold $$ \tau $$ while evaluating our trained model on the test set. Once the threshold is determined, it can be used to classify transactions during deployment:

$$
\text{Fraud if } P(x) > \tau, \text{ otherwise Genuine.}
$$

By adjusting $$ \tau $$, we can balance Precision and Recall to meet specific business objectives and constraints.

# Detection Latency

Latency is the time it takes for the system to process a transaction and respond, and it is crucial for real-time systems.
These metrics ensure the model not only has good statistical performance but also operates quickly enough to be actionable.

It is commonly measured in two ways:

1. **Online decision latency (ODL):** How long it takes to score a single transaction and respond (which affects user experience and fraud blocking effectiveness).
2. **Time-to-detection for fraud patterns (TTD):** If an attack starts at time `T`, how long before the system detects and flags it.

ODL is usually measured in milliseconds.
For example, a payment system might have an end-to-end latency budget of 200ms for authorization, out of which fraud checks get 20–30ms.
Modern systems often aim for fraud model inference under ~50ms.
Feedzai (a vendor) suggests looking at 99th percentile latency (e.g., 99% of transactions scored in <500ms), to ensure worst-case delays are bounded.

TTD is more about monitoring and measuring the resilience of the system to detect an emerging fraud *modus operandi*.
For example: “Did we catch the new fraud ring the first day it appeared, or did it go undetected for weeks?”
This is harder to quantify but important in evaluating adaptive systems.

Real-time systems strive for instant detection—meaning as soon as the first few events of a fraud pattern occur, the system raises an alert.

# Summary

In practice, evaluating a fraud detection model involves:

1. Analyzing the confusion matrix at the operating point.
2. Reviewing AUC-PR, AUC-ROC, and F1.
3. Choosing thresholds that satisfy business constraints (e.g., max false positives).

But evaluation doesn’t stop at metrics.

Weighting fraud by transaction amount matters: catching a 10,000 USD fraud is more impactful than catching ten 1,000 USD cases.

And finally: metrics on static test sets aren't enough.

Perform [backtesting](https://en.wikipedia.org/wiki/Backtesting) (simulate past performance) and [sandbox testing](https://en.wikipedia.org/wiki/Sandbox_(computer_security)) (simulate deployment).

Observe how fraud patterns change: Do attackers evolve? Do false positives creep up?

Or even better: run [A/B tests](https://en.wikipedia.org/wiki/A/B_testing).

Put the new model in production in [shadow mode](https://en.wikipedia.org/wiki/Shadowing_(computing)) and compare it to the previous version, on real dollars and real users.

This way, you'll be properly taking data-driven decisions.
