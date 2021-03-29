---
layout: post
title:  Empirical software engineering research is harder than you think
subtitle: Trust me 
tags: research
published: true
image: ../img/posts/children-gardening-squared.png
share-img: ../img/posts/children-gardening-squared.png
show-avatar: false
date: 2020/10/15
---

You are a very talented researcher. Perhaps you come from a favored field, e.g., from the popular machine learning (ML) research community. But now, you have decided to expand your horizons and solve software engineering (SE) problems. Hence, for the next years, you will be working as an empirical SE researcher. "This job is going to be a piece of cake", you may think and even dare to say. Well... not really. Let me tell you why.

<figure class="jb_picture">
    <img src="https://cf.jare.io/?u=https//www.cesarsotovalero.net/img/posts/children-gardening.jpg" 
    alt="Seeds planted by children at Rosenlundsparken, Stockholm"
    longdesc="#c13e1390" />
    <figcaption class="stroke">
    &#169; Seeds planted by children at Rosenlundsparken, Stockholm
    </figcaption>
</figure>

Empirical SE is just one of the many players within the SE research arenas. In a nutshell, it is all about applying the [scientific method](https://en.wikipedia.org/wiki/Scientific_method) through so-called empirical studies with the objective of obtaining useful knowledge for researchers and practitioners in the SE field.
 
Today, journals like [Empirical Software Engineering](https://www.springer.com/journal/10664) (EMSE) or conferences such as [Mining Software Repositories](http://www.msrconf.org) (MSR) are ranking very high. They are within the top ten venues in the category of software systems, according to the number of citations in [Google Scholar](https://scholar.google.com/citations?view_op=top_venues&hl=en&vq=eng_softwaresystems). One of the reasons for this success is the uncertainty inherent to the practice of software development, which can only be studied empirically.
 
Let me give you an example. Suppose that you are working on a project. To speed up its development, you want to reuse the functionality provided by some external libraries. To do so, you need to declare a dependency. It seems an easy task. However, _i)_ What if there are several libraries out there that provide similar functionality? _ii)_ What if each of these libraries has different versions available? As a developer, you have to dive deep into this diversity of implementations if you want to make the right decision before declaring the dependency. The answer to _i)_ is subtle since there is still no clear consensus about what makes a library good (Is it its code quality? Is it the status of its maintainers? Is it the readability of its documentation?). The answer to _ii)_ is also tricky since [it is known](https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=8721084) that not everybody follows semantic versioning conventions principles. Also, Who knows which version has fewer bugs
? Which is the most stable? What is their difference? There are too many questions that need to be answered before picking a dependency. Hence, for you, as a developer, the only way to make a reasonable decision seems to be by relying on the wisdom of the crowds, aka popularity and global adoption. However, what if someone could provide you with the necessary data and analysis to make a decision backed up by facts instead of common sense and intuition?
  
Empirical SE research comes to the rescue. It is there to provide the answer to the fundamental questions about the practice of software development. Those kinds of questions do not need to be a gimmicky dilemma. They could be an everyday unexplored assumption. For example: Are [AGILE](https://en.wikipedia.org/wiki/Agile_software_development) development practices really effective? Is [TDD](https://en.wikipedia.org/wiki/Test-driven_development) really a game-changer in terms of bug catching? For researchers, it is enough to have a solid software-related unresolved argument for which nobody knows the answer for sure. The more provocative the argument is, the more exciting the results will be. 

<aside class="quote">
    <em>Empirical software engineering research provides answers to the fundamental questions about the practice of software development.</em>
</aside>

It is the uncertainty and lack of formalisms, at the core of the research methods, what makes empirical SE research difficult to do. Let me dissect a typical empirical SE paper to help you understand its complexity. This is a typical structure for such a paper:
 
 1. Proposal of a relevant **hypothesis**  
 2. Collection of representative **data** 
 3. **Analysis** of the data to validate or reject the hypothesis
 4. Interpretation of the **results** and discussion
 5. Derivation of a sound **conclusion**      

In the following, I will explore each step in more details. For the sake of comparison, let me contrast the research challenges in this field with its similar in the ML research field. 

### 1. Hypothesis

The hypothesis is the backbone of any empirical SE research paper. Before start writing, you should have answered a precise set of questions in your mind. Ask yourself: Is it useful to answer this? Is it novel? Is it really unknown? If the answer is yes, then you are on the right track. 

In opposition to other research fields, such as ML research, in SE, the hypothesis does not follow any pre-determined standards. In ML, your hypothesis could be, for instance, comparing the performance of a new model with respect to the state-of-the-art. However, in relevant empirical SE research, such previous work may no exist. Therefore, you end up having an additional task: to convince everyone about the relevance of your hypothesis.   

### 2. Data 

Data is what makes your results sound when claiming conclusions. Today, the tremendous adoption of open-source software has facilitated the acquisition of software-related data as never before. However, to collect such rich data, it is almost sure that you will need to implement your own software tools. This process implies additional implementation effort and data mining time for the researcher. The lack of standard data benchmarks in the field is a well-known problem. One of its causes is due to the rapid advance of software development techniques: the tools that are useful for researchers today may become useless in a couple of years. Therefore, you not only have to collect the data properly, but also to convince everyone that it is a representative subset of the real world. 

On the other hand, ML researchers deal with a completely different kind of data problem. The so-called datasets are almost a perpetual source of ground truth. For example, the [iris dataset](https://archive.ics.uci.edu/ml/datasets/iris), introduced in 1988, is still used to compare the performance of standard ML learning algorithms, while the [MNIST dataset](http://yann.lecun.com/exdb/mnist/) is considered the baseline to explore the performance of deep learning models, since 1998. In contrast, the lack of standard datasets for testing the research hypothesis adds a burden to empirical SE researchers.

### 3. Analysis

In empirical SE, to properly analyze your data, you have to perform a comprehensive design of your experiments. This implies using existing research protocols in some cases. In other cases, such protocols simply do not exist. Of course, there are gems out there that can help you with the first cases, such as the book [Guide to Advanced Empirical SE](https://www.springer.com/gp/book/9781848000438). However, if you are dealing with the second scenario, the challenge stands at an entirely different level. If your experiment is unique in some manner, then you will have to convince everyone that your procedure is scientifically correct. Those who are done science for real know very well that this is a major issue.

In the case of ML researchers, the analysis and statistical validation of the results is a straight forward process. Those researchers know exactly what type of statistical test they need to use in each scenario. For example, if you test your model against another one, then you use the non-parametric [Wilcoxon signed-rank test](https://en.wikipedia.org/wiki/Wilcoxon_signed-rank_test); whereas if you need to compare your results with respect to several models, then the  [Friedman NxN test](https://en.wikipedia.org/wiki/Friedman_test) is the standard choice. However, in empirical SE research, there is no such standards. The data analysis approach is up to you. The protocol employed may be part of your contribution. It is simply more work to do for the same paycheck. 

### 4. Results

Once you analyze the data, you get some results in exchange. These results are the meaning of the data, the knowledge behind your experiments. Numbers are essential to validate your research, but, in reality, nobody cares about exact values. It is the interpretation of such values that matters most. The factual result. In qualitative studies, the results may be subject to your personal criteria, which make it more difficult for the community to accept them. Here there are some questions you should ask yourself: Are my results comprehensive and well explained? Represent my results valuable knowledge to researchers and practitioners? Am I making the correct interpretation? You better make sure to answer yes to these questions. 

Interpreting ML results, on the other hand, is a more concise task. Your proposed approach is whether significantly better than the rest, or it is not. A spoiler here: your results must outperform the state-of-the-art for the datasets at hand if you want your paper to be published. Therefore, it is the sum of several factors which makes hard interpreting empirical SE results: the novelty of the hypothesis, the lack of similar data to compare with, and the uniqueness of the experiments.     

### 5. Conclusion

The conclusion of an empirical SE paper should be a substantial claim based on the interpretation of the results obtained. It is the last gift for the reader who took the time to open and read your paper. Having not more than a single number is important here. The more general the number is, the better. However, if you used case studies, you should make sure not to generalize your claim.

If you have done your homework, then the conclusion of a ML paper is solid and hard to disprove. In this case, your dataset is available,  your experiments are standard and reproducible, your results are statistically demonstrated. These are key ingredients for success in the science arenas. In contrast, in a good SE paper, all these ingredients are almost impossible to have in practice. 

---

The following table summarizes the points discussed above:

| **Tasks** | **In ML research** | **In SE research** |
| ------ | ------ | ------ |
|**Hypothesis**  | Pre-defined in most cases | Needs to be formulated from scratch |
| **Data** | Datasets are available | Needs to be collected and cleaned |
| **Analysis** | Standard statistical methods are well-known | Protocols for the design of experiments may no exist |
| **Results** | Interpretation is based on factual statistical outcomes | Interpretation are prone to personal interpretation |
| **Conclusion** | A solid claim, hard to argue against | A claim based on observation, hard to generalize and prone to be biased |
| ------ | ------ | ------ |
{: .border-bottom-on-table  }

In conclusion, empirical SE research is not easy at all. It imposes a diverse set of unique challenges to researchers, from the formulation of the hypothesis to the argumentation of a relevant conclusion. If you think this is not true, then try to publish in a top journal in the field. Do it first, then we can talk about it :smirk:.
