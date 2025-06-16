---
layout: post
title: Evaluation Metrics for Financial Fraud Detection
subtitle: A survey
tags: ai
description: |
  This survey reviews the current state-of-the-art in evaluation metrics for real-time financial fraud detection, spanning both academic research and industry practice.
keywords:
  - financial fraud
  - fraud detection
  - machine learning
  - deep learning
  - survey
image: ../img/posts/2025/2025-04-03/justitiabrunnen_cover.jpg
share-img: ../img/posts/2025/2025-04-03/justitiabrunnen_cover.jpg
show-avatar: false
toc: true
mathjax: true
date: 2025/05/08
author: cesarsotovalero
published: false
---

# Evaluation Metrics

Evaluating fraud detection models requires metrics that account for very particular challenges such as:

- **Class imbalance:** Transactions labeled as suspicious may be significantly lower of total historical transactions.
- **Relative costs of false positives vs. false negatives:** False positives (legitimate transactions flagged as fraud) can lead to customer dissatisfaction, while false negatives (fraudulent transactions not detected) can result in financial losses.

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "1px solid #808080" path: img/posts/2025/2025-04-03/conf_matrix.png alt: "Confusion matrix of a financial fraud binary classifier." %}
  <figcaption class="stroke"> 
    Confusion matrix of a financial fraud binary classifier.
  </figcaption>
</figure>

Below are the most common metrics and considerations.

## Precision

Precision is the fraction of transactions that was actually fraud among all transactions the model flagged as fraud (predicted positive).

For example, if a model flagged 100 transactions as fraud, and 80 of those were indeed fraudulent, then:

$$
\text{Precision} = \frac{TP}{TP + FP} = \frac{80}{100} = 0.8
$$

High Precision means few false positives, so it is crucial for operational efficiency.
 
Low Precision means investigators waste time on many false alarms, and customers suffer unnecessary declines.
 
Many top systems aim for very high Precision (e.g., 0.9+) at low fraud rates, but there’s a trade-off with Recall.

Precision is often reported at a certain operating point or as an average if multiple thresholds are considered.

An example interpretation: “Of transactions our system blocked, 95% were indeed fraudulent,” that’s a Precision of 95%.

## Recall

Recall is the fraction of actual fraud cases that the model correctly predicts as fraud (true positives) out of all actual fraud cases.

For example, if there were 100 actual fraud cases and the model caught 80 of them, then:

$$
\text{Recall} = \frac{TP}{TP + FN} = \frac{80}{100} = 0.8
$$

High Recall means few false negatives, which is critical in fraud detection because missing a fraudulent transaction can lead to financial losses.

Low Recall means many frauds slip through and cause losses. 

However, one can usually increase Recall by lowering the detection threshold at the cost of Precision. So there’s a balance. 

A Recall of 0.80 means 80% of fraud instances were detected (20% missed). In practice, businesses may set a Recall target like “catch at least 70% of fraud” and then maximize Precision under that constraint.

## F1-Score

F1-Score is the harmonic mean of Precision and Recall, so it gives a single-figure balance of both metrics.

For example, if Precision is 0.8 and Recall is 0.6, then:

$$
F_1 = \frac{2 \times Precision \times Recall}{Precision + Recall} = \frac{2 \times 0.8 \times 0.6}{0.8 + 0.6} = \frac{0.96}{1.4} \approx 0.686
$$

High F1 means both Precision and Recall are reasonably high.

Low F1 means either Precision or Recall is low, which is undesirable in fraud detection.

F1-Score is useful when we want a combined score for model selection, or when class distribution is skewed. 

In extremely imbalanced data, even F1 can be dominated by one side if not careful. 

F1 is much better than accuracy for fraud. For instance, if a model has Precision 0.6 and Recall 0.6, F1 = 0.6. If another has Precision = 0.7 but Recall = 0.4, F1 $$ \approx 0.50 $$, telling us the first model is overall better balanced. 

F1 is a popular metric in Kaggle competitions and papers to compare models, ensuring they are not just optimizing one at the expense of the other.

## False Positive Rate (FPR) and False Negative Rate (FNR)

FPR is the fraction of legitimate transactions that were incorrectly flagged as fraud (false positives) out of all legitimate transactions. FNR is the fraction of fraudulent transactions that were missed (false negatives) out of all actual fraud cases.

For example, if there were 1000 legitimate transactions and the model flagged 50 of them as fraud, then:

$$
\text{FPR} = \frac{FP}{TN + FP} = \frac{50}{1000} = 0.05 \text{ or } 5\%
$$

Sometimes businesses set FPR requirements to control false alarms.

For example:

- “We can only review 0.5% of transactions, so FPR must be ≤ 0.5%.”
- “We cannot tolerate missing more than 10% of fraud, so FNR ≤ 10%,” which implies Recall ≥ 90%.

These constraints often drive the choice of operating thresholds more directly than Precision or Recall alone.

## Specificity (True Negative Rate)

Specificity measures how well the system correctly identifies legitimate transactions as non-fraud.

For example, if there were 1000 legitimate transactions and the model flagged 50 of them incorrectly as fraud (FP), the calculation would be:

$$
\text{Specificity} = \frac{TN}{TN + FP} = \frac{950}{950 + 50} = 0.95 \text{ or } 95\%
$$

Specificity is often overlooked in fraud detection, because it’s essentially the complement of the False Positive Rate (FPR):

$$
\text{Specificity} = 1 - \text{FPR}
$$

Specificity is typically very high in fraud detection systems because the number of legitimate transactions (TN) is much larger than the number of frauds or false positives.

Since Precision already focuses on avoiding false positives, and we typically assume we want to approve as many legitimate transactions as possible, Specificity doesn’t usually take center stage.

However, in some contexts, like regulatory requirements or customer experience it’s important to keep FPR below a certain threshold, such as “FPR ≤ 0.1%,” which directly relates to maintaining high Specificity.

## AUC-ROC (Area Under the ROC Curve)

AUC-ROC measures a model’s ability to distinguish fraud from non-fraud across all possible thresholds.

The ROC curve (Receiver Operating Characteristic) plots True Positive Rate (Recall) against False Positive Rate (FPR). 

The AUC is the area under this curve:

- AUC = 0.5 means random guessing.
- AUC = 1.0 means perfect discrimination.

An intuitive interpretation:
“If I randomly pick a fraud and a legitimate transaction, AUC is the chance the fraud gets a higher risk score.”

AUC is threshold-independent: it summarizes performance across all thresholds, and it’s less sensitive to class imbalance than accuracy.

## AUC-PR (Area Under Precision-Recall Curve)

AUC-PR plots Precision vs. Recall and focuses squarely on the minority class (fraud), so it tells us how well the model catches fraud while keeping false positive low.

In highly imbalanced data, AUC-PR is more informative than AUC-ROC because it answers how well the model balances Precision and Recall where it matters.

For instance, a model could have AUC-ROC = 0.98 and still have AUC-PR = 0.10, which means that the model detects fraud higher than non-fraud most of the time, but when it comes to real-world detection, Precision at high Recall isn’t stellar.

AUC-PR the go-to metric when fraud cases are rare, and we care about catching as many as possible without overwhelming the system with false alarms.

## Detection Latency

Latency is the time it takes for the system to process a transaction and respond, and it is crucial for real-time systems.
These metrics ensure the model not only has good statistical performance but also operates quickly enough to be actionable.

It commonly measured in two ways:

1. **Online decision latency (ODL):** How long it takes to score a single transaction and respond (which affects user experience and fraud blocking effectiveness)
2. **Time-to-detection for fraud patterns (TTD):** If an attack starts at time `T`, how long before the system detects and flags it.

ODL is usually measured in milliseconds.
For example, a payment system might have an end-to-end latency budget of 200ms for authorization, out of which fraud check gets 20–30ms.
Modern systems often aim for fraud model inference under \~50ms or faster.
Feedzai (a vendor) suggests looking at 99th percentile latency (e.g., 99% of transactions scored in <500ms), to ensure worst-case delays are bounded.

TTD is more about monitoring and measuring the resilience of the system to detect an emerging fraud _modus operandi_.
For example: “did we catch the new fraud ring the first day it appeared, or did it go undetected for weeks?”.
This is harder to quantify, but important in evaluating adaptive systems.

Real-time systems strive for instant detection, meaning as soon as the first few events of a fraud pattern occur, the system raises an alert.

## Summary

In practice, evaluating a fraud model during development involves looking at the AUC-ROC and AUC-PR curves and then choosing one or two operating points to report Precision, Recall, F1, etc.
Often a confusion matrix at a chosen threshold is reported to the business to show how many alerts per day that yields (false positives) vs. how many frauds are caught.
The threshold might be chosen to meet a business constraint, such as a fixed review capacity or a false positive rate limit.

Additionally, specific business metrics may be used.
For example, dollars of fraud caught and dollars of false positive customer sales lost, which is essentially weighing each transaction by its amount.
If a model catches more high-value fraud, that’s more impactful than catching many low-value frauds.

Finally, beyond metrics on historical data, it’s important to do [backtesting](https://en.wikipedia.org/wiki/Backtesting) or [sandbox testing](https://en.wikipedia.org/wiki/Sandbox_(software_development)).
This means running the model on a period of historical transactions day by day, and simulating the decisions to see how it would have performed (how quickly fraud would be stopped, how many genuine transactions would be falsely declined, etc.).
This can reveal the capacity of the model to adapt to fraudsters or to detect data drift: Did fraud drop after some were caught? Did they try a different strategy?

In an online evaluation, one might do an A/B test with a new model vs. old model to directly measure improvement.
For example, comparison based on money loss prevented and false positive rate with real transactions.
In any scenario, offline metrics like Precision, Recall, and AUC are the starting point to qualify a model for deployment.
