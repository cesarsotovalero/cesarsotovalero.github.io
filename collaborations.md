---
layout: page
title: Topics
subtitle: Open to Collaborations | Master Thesis | Internships
published: true
---

## 1. Debloat of mobile apps

### Motivation

The size of mobile apps keeps increasing, reaching tens of MB on average. This happens because app companies hope to grow their market with more and more features. However, this is a significant issue for users. Users of smartphones can run these apps because their phones have the necessary power (a recent smartphone is orders of magnitude more powerful than Apollo 11 [1]). Still, they regularly remove them to save memory [2]. Yet, the issues are even more significant for the millions of users who do not have access to smartphones and cannot even install the apps because of a lack of resources.

### Approach

We use an aggressive approach to debloat mobile apps. Ideally, it would be based on actual usage traces rather than test cases.

### Validation

Select a set of Android applications for which we have the source code and that have test cases (we can start from the collection of applications collected by Matias [3]. Compare tool with ProGuard, concerning the size of the final binary, number of classes in the final binary, number of dependencies in the final dependency tree. Check that some of the debloated versions can be installed on cell phones that have limited resources compared to modern smartphones.


### References

[1] [https://www.zmescience.com/research/technology/smartphone-power-compared-to-apollo-432](https://www.zmescience.com/research/technology/smartphone-power-compared-to-apollo-432)

[2] [https://techjury.net/stats-about/app-usage](https://techjury.net/stats-about/app-usage)

[3] Bruno Gois Mateus and Matias Martinez. An empirical study on quality of Android applications written in Kotlin language. CoRR, abs/1808.00025, 2018.