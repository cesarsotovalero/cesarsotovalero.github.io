---
layout: post
title: The Most Relevant Technical Skill in My Career
subtitle: It might not be what you think
tags: career
description: |
  TODO
keywords:
  - productivity
  - career success
  - software engineering
  - exploratory data analysis
  - research
image: ../img/posts/2023/2023-11-19/paint-cover.jpg
share-img: ../img/posts/2023/2023-11-19/paint-cover.jpg
show-avatar: false
toc: true
date: 2023/11/19
author: cesarsotovalero
published: false
---

In 2013, I was at the last year of my undergraduate studies in Computer Science.
I was working on my thesis, and realized that I needed to collect, analyse, and present data to get the diploma. 
None of these skills were taught in the 5 years curriculum.
Later on I started my Master's in Computer Science and went into academic research. 
I started reading papers and doing my own research projects.
I realize that the same type of data analysis was necessary to validate the research hypothesis.
The need for the same skill repeated in my PhD, and later in my professional career.
It doesn't matter how advanced the technology is, or how sophisticated the algorithms are, it looks like Exploratory Data Analysis (EDA) is the most important technical skill in my career so far.
It allowed me to understand data, to visualize my results, to find patterns, or help to prove or disprove my viewpoints to take informed decisions.  
Thus, I consider EDA a necessary skill for any engineer, and in particular, for any job that involves decision-making.
This post is about my journey, the lessons learned, and the resources I use to improve my EDA skills.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-11-19/paint.jpg alt: "artwork made by my son when he was 3 years old" %}
  <figcaption class="stroke"> 
    &#169; There is something special about expressing ourselves through art. The picture shows an artwork made by my son when he was 3 years old.
  </figcaption>
</figure>

# What is EDA?

The main purpose of an [Exploratory Data Analysis](https://en.wikipedia.org/wiki/Exploratory_data_analysis) (EDA) is to aggregate, analyze, summarize, and visualize data with the purpose of finding and showing valuable information.
EDA is great at the beginning of a project, when you want to quickly understand and explain the data before diving into more sophisticated analysis or modeling techniques.

I believe that EDA is a ~~fundamental~~ necessary skill for any engineer.
In particular, EDA is key for any job that involves decision-making, because it allows seeing the big picture in the data by doing visualizations, find patterns, and empirically take decisions.
Here are some questions that EDA helps to answer:

- What is the **distribution** of the data?
- What are the **relationships** between variables?
- Are there any **outliers**?
- What are the **patterns** in the data?
- What are the **trends** in the data?
- What are the **missing** values?
- What are the **correlations** between variables?
- What are the **causal** relationships between variables?
- What are the **implications** of the data?
- What are the **predictions** based on the data?
- What are the **opportunities** in the data?

To answer these questions, in a typical EDA we start by defining a hypothesis (or question) that we want to answer, then we collect the relevant data, explore it, clean it, visualize it, and finally build a report. The process is straightforward, as shown in the following diagram:

[//]: # (see https://mermaid-js.github.io)
{% mermaid %}
%%{init: {'theme':'base'}}%%
flowchart TB;
subgraph EDA ["."]
A(["🛢 Data Collection"])
B(["🔍 Data Exploration"])
C(["🧹 Data Cleaning"])
D(["🛠️ Data Visualization"])
E(["📈 Report Building"])
A --> B
B --> C
C --> D
D --> E
end
I(["🤔 Hypothesis"])
F(["💁️ User"])
I --> A
E --> F
{% endmermaid %}

So, coming from a software engineering background, I see EDA as a way to understand the data before building any software system that handles it.

# EDA as a Technical Skill

I've been using EDA for over 12 years.
I started using EDA during my undergraduate studies in Computer Science, and later during my PhD in Software Engineering.
In the following, I explain why I consider EDA the most important technical skill in my career so far.

## The Swiss Army Knife in Academia

During my undergraduate studies in Computer Science, I received a lot of heavy Maths subjects, including several semesters of Calculus, Linear Algebra, Discrete Mathematics, Advanced Geometry, Optimization Models, and so on.
Among the Math courses I took, there was one about statistics.
I remember that the lectures were very theoretical and focused on the formulas, rather than the practical aspects.
It was not until I had to write my thesis that I realized the importance of EDA.
There I was introduced to SPSS and R.
After looking at examples of the other thesis, I understood that a EDA was something that they all had in common. 
A good EDA is the foundation of a good thesis.

<aside class="quote">
    <em>“EDA is a fundamental skill at all levels of high education.”</em> 
</aside>

I understood that I had to collect data and apply statistical tests to prove or disprove a scientific hypothesis if I wanted to get graduated.[^2]
So I started learning EDA, and started looking at code examples in [Kaggle](https://www.kaggle.com/) where there are many datasets and a lot of notebooks. 
My [bachelor's thesis](https://dspace.uclv.edu.cu/handle/123456789/1935) was about applying time series classification models to the problem of accurately forecasting rainfalls. There I used EDA in SPSS to understand the data and to find patterns.

A couple of years after graduation, I started my Master's in Computer Science and went into sport analytics.
I knew that if manage to collect enough data, formulate the right hypothesis, and use a completely new technique, I could manage to get a paper published.
So I did.
I analyzed all the historical data publicly available of the MLB and applied a technique called [Dynamic Time Warping](https://en.wikipedia.org/wiki/Dynamic_time_warping) to find patterns in the data.
I publish a few papers on sport analytics, and I realized that EDA was the most important skill to get the data and find patterns, and that having high-quality figures was key to get the papers accepted.[^3]

Later during my PhD, I started working on [empirical software engineering research](../blog/empirical-software-engineering-research-is-harder-than-you-think.html).
Then, I realized that EDA was the most important skill to understand the data stored in software repositories.
I started working on a project called [DepClean](), and I used EDA to understand the data stored in Maven repositories.
The scale of the experiments and complexity of the data increased, but the fundamentals of EDA remained the same.

## A Superpower Beyond Academia

After my PhD, I started working as a software engineer. 
I find out the motto "data driven decisions," and I realized that EDA was the most important skill to understand the data and take decisions.
It turns out that my academic skills are great to impress managers, or support my arguments with data.
This not only makes me more effective at work, also makes my ideas more convincing, so it resonates with my colleagues and managers.
After all, what could you argue against a well-done Wilcoxon's Signed-Rank Test?

<aside class="quote">
    <em>“Data backed proposals makes new ideas more convincing and are more likely to caught the attention of decision-makers.”</em> 
</aside>

Most large companies today rely on built-in tools for conducting EDA, such as Elasticsearch, Tableau, and PowerBI.
Yet, these platforms, despite their capabilities, often fall short.
There are instances where delving deeper into the data through custom coding is imperative to leverage cutting-edge data analysis methodologies and statistical tests.
This is where R and Python come into play, offering a plethora of libraries and tools that enable the execution of complex EDA tasks.
On top of that, you can combine the data analysis with front-end development to create interactive dashboards.

While AI continues to revolutionize how we interpret and utilize data, these technologies often stumble when it comes to EDA. 
The primary challenge lies in the contextual understanding required to effectively approach the business. 
This is because at the moment, AI systems lack the research contexts that humans have.
EDA is inherently exploratory and subjective, relying on the analyst's intuition and domain knowledge to guide the analysis.
This human touch allows for the identification of meaningful insights that AI, in its current state, struggles to replicate. 

# The Craft of Good EDAs

In this section, I share some insights on how I structure my EDA projects in R (I use RStudio), the facts I uncover, the narratives I craft, the aesthetics I strive for, and the tools I use.

## Structure

Before diving into the data, it is crucial to establish a clear structure for the EDA project.
I host my projects on GitHub, and structure them in R as follows:

```markdown
example_eda_project_in_R/
│
├── data/
│   └── raw_data.csv
│
├── docs/
│   ├── project_overview.pdf
│   └── README.md
│
├── notebooks/
│   ├── RQ1.Rmd
|   ├── RQ2.Rmd
│   └── RQ3.Rmd 
│
├── R/
│   └── data_processing.R 
│
├── .gitignore
└── README.md
```

The `data` directory contains the raw data, while the `docs` directory houses the project overview and a README file.
In the `notebooks` directory, I create separate R Markdown files for each research question.
I prefer notebooks to scripts, as they allow for a more interactive and engaging analysis.
However, I also include a `R` directory for data processing scripts that are common to multiple notebooks, which I import using the following code:

```R
source("R/data_processing.R")
```

This superstructure helps me keep my projects organized and easily accessible.

## Hypotheses

I always start my EDA projects by defining clear hypotheses.
Finding the relevant hypothesis to test is crucial, as it guides the entire analysis.
It is important for the hypothesis to provide a clear value proposition.
For example, in a marketing project for a new product, the hypothesis could be "The new product will increase sales by 20% in the first quarter."
It could be also to dispel a myth, such as "Any publicity is good publicity," or to disprove a certain claim, such as "Investing more money in marketing platform X will increase sales."

## Narratives

We all love stories. 
This is something we adquired since we were kids listening to our moms beside our beds.
Stories are powerful tools to convey information and make it memorable.
In EDA, the narrative is the story you want to tell with your data.
It is the message you want to convey to your audience.

Here's an example:

> I was sitting in the library, going through recent journal articles when, to everyone's surprise, Donald Knuth walked in. I can now say that the average number of citations of all researchers in the library, including myself, is now in the thousands. This is a perfect example of how to lie with statistics. Be careful when using averages; they can be mean to you. Outliers can wreck your conclusions.

Packaging statistics into a narrative is an art in itself.
It requires a deep understanding of the data, the context, and the audience.
In academia, as well as in industry, the ability to craft compelling narratives from data is a highly sought-after skill.

## Aesthetics

It is said that a picture is worth a thousand words.
This is especially true in EDA.
The aesthetics of your plots can make or break your analysis.
In a study on visual information in scientific literature, it was found that higher-impact articles had more diagrams per page and a higher proportion of diagrams, but a lower proportion of photos[^1].
This underscores the importance of visualizations in conveying complex information.

Here are some tips to make a plot better:

- Use vector graphics for publication-quality plots (use SVG or PDF).
- Remove all unnecessary elements (including gridlines legends if possible).
- Use a consistent color palette (I like `#00cd6c`, `#ffc61e`, `#a0b1ba`, `#ff1f5d`, `#009ade`, `#af58ba`, `#f28522`, and `#a6761d`).
- Use a caption to synthesize the message, not the chart itself (I try to summarize the key takeaway in one sentence).
- Check for message bias using a third party (just ask another person what does she understand from the figure, if it takes more than 1 min to figure out, then there's something wrong)
- Do the last retouches in a vector graphics editor (e.g., Inkscape).

## Tools

I use R and RStudio for my EDA projects.
In particular, I leverage the [ggplot2](https://ggplot2.tidyverse.org/) package (part of the [tidyverse](https://www.tidyverse.org/) ecosystem) for creating beautiful visualizations.
`ggplot2` is a powerful tool that leverages the Grammar of Graphics to create complex plots with ease.
I start by loading the data, then I create a plot layer by layer, adding aesthetics, scales, and labels.

For example, to create the plot in Figure #1 in [this paper](), I used the following code:

```R
// TODO
``` 

As you can see, it's about the small details and micro optimizations that make a plot better, but overall chosing the right chart type, the right colors, and the right message is what makes a plot great.

# Examples

I have used EDA in various projects, from analyzing sports statistics to academic research and professional work. 

Here are some examples of real-world projects where I have applied EDA for my research papers:

- <a href="https://github.com/ASSERT-KTH/deptrim-experiments/tree/main/notebooks/R"><i class="fab fa-github"></i></a> [deptrim-experiments](https://github.com/ASSERT-KTH/deptrim-experiments/tree/main/notebooks/R)
- <a href="https://github.com/ASSERT-KTH/jdbl-experiments/tree/master/notebooks"><i class="fab fa-github"></i></a> [jdbl-experiments](https://github.com/ASSERT-KTH/jdbl-experiments/tree/master/notebooks)
- <a href="https://github.com/ASSERT-KTH/depclean-experiments/tree/master/notebooks"><i class="fab fa-github"></i></a> [depclean-experiments](https://github.com/ASSERT-KTH/depclean-experiments/tree/master/notebooks)
- <a href="https://github.com/chains-project/ethereum-ssc/tree/main/r_notebooks"><i class="fab fa-github"></i></a> [ethereum-ssc](https://github.com/chains-project/ethereum-ssc/tree/main/r_notebooks)
- <a href="https://github.com/cesarsotovalero/msr-2019s"><i class="fab fa-github"></i></a> [msr-2019s](https://github.com/cesarsotovalero/msr-2019s)
- <a href="https://github.com/cesarsotovalero/ijcss-comp-balance-laliga"><i class="fab fa-github"></i></a> [ijcss-comp-balance-laliga](https://github.com/cesarsotovalero/ijcss-comp-balance-laliga)

# Summary

I'm solving the problem of people not knowing what is technical skills are the most important in their career.
This is important because it can help people to focus on the right skills.
The benefits are various: better job opportunities, better salary, better work-life balance, better mental health.

The utility of EDA extends far beyond its foundational role in data science, proving to be a valuable asset in various fields and applications. From impressing managers with insightful findings that can influence strategic decisions, to applying it in sports analytics for performance improvement, or leveraging it in academic research to unearth novel discoveries, EDA's applications are boundless. Personally, my journey with EDA has spanned from utilizing it to analyze sports statistics, to employing it as a critical tool in my research endeavors, and eventually integrating it into my professional work. Moreover, EDA's versatility shines in software development, particularly in analyzing project dependencies, thereby enhancing project management and efficiency. The examples underscore EDA's transformative potential not only within the industry but also as a personal analytical superpower, capable of elevating one's approach to problem-solving and decision-making across a myriad of contexts.

# Resources



# Footnotes

[^1]: See [Viziometrics: Analyzing Visual Information in the Scientific Literature](https://ieeexplore.ieee.org/abstract/document/7888968/?casa_token=-X0UVsB4pJoAAAAA:DgGkzsGt_6c-SovMKCFQvalKU5_I4bpqmjfVqQQTbmHQSeQPw3XzooyrcHM0hIFUL1IYnC4dyg), in _IEEE Transactions on Big Data_, 2017

[^2]: I find the table in [this page](https://help.xlstat.com/6443-which-statistical-test-should-you-use) handy to determine which statistical test to use.

[^3]: I recommend reading the latest papers published in the [Journal of Statistical Software](https://www.jstatsoft.org/index) and the [Journal of Machine Learning Research](https://www.jmlr.org/).

