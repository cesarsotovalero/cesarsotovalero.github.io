---
layout: post
title: The Most Relevant Technical Skill in My Career
subtitle: Spoiler&#58; It isn't Java coding
tags: career
description: |
  Have you ever wonder which is most relevant technical skill in your career? It's not necessarily a programming language or the latest framework. For me, it is Exploratory Data Analysis (EDA). Why? Because being able to manipulate and find relevant information from various data sources has opened me doors to new opportunities in both academia and industry. This post is about my journey, the lessons learned, and the resources I have used to enhance my EDA skills over time.  
keywords:
  - productivity
  - career success
  - software engineering
  - exploratory data analysis
  - research
image: ../img/posts/2024/2024-03-30/paint-cover.jpg
share-img: ../img/posts/2024/2024-03-30/paint-cover.jpg
show-avatar: false
toc: true
date: 2024/03/30
author: cesarsotovalero
published: true
---

Eleven years ago (do you still remember 2013?), I was in the last year of my undergraduate studies.
I started working on my thesis and soon realized that, to earn my diploma, I had to collect, analyze, and summarize data in a specific way.
Because at the end of the day, a thesis needs content, and content comes from data and some kind of experiment, so it could justify the grade.
However, none of these skills were taught to me during the 5 years of my bachelor's curriculum.
Getting the thesis done was a struggle, but ~~somehow~~ I succeeded.
A couple of years later, I reached the end of my Master's, and the same cycle repeated itself, as it did again when I ventured into academic research.
After three thesis, reading a lot of papers, and undertaking my own research projects, I realize that data analysis skills are essential, regardless of the complexity of the problem I'm addressing.
Not surprisingly, the need for the same skill surfaced again during my professional career.
No matter how advanced the technology or sophisticated the algorithms, the ability to handle datasets is crucial.
Therefore, I think that Exploratory Data Analysis (EDA) has become the most important technical skill in my career.
It has enabled me to understand data, find patterns, visualize results, and support or refute hypotheses to make informed decisions.
I consider EDA an essential skill for any professional, especially for any job involving decision-making.
This post is about my journey, the lessons learned, and the resources I have used to enhance my EDA skills over time.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2024/2024-03-30/paint.jpg alt: "Artwork made by my son when he was 3 years old" %}
  <figcaption class="stroke"> 
    &#169; We collect information, explore our environments, and express ourselves since very early ages. The picture shows an artwork made by my son when he was 3 years old.
  </figcaption>
</figure>

# What is EDA?

The main purpose of [EDA](https://en.wikipedia.org/wiki/Exploratory_data_analysis) is to aggregate, analyze, summarize, and visualize data to find and showcase valuable information.
EDA excels at the start of a project, enabling a quick understanding and explanation of the data before moving on to more sophisticated analysis or modeling techniques.

I believe that EDA is, in essence, **a form of scientific communication**.
As a result, it is a ~~fundamental~~ necessary skill for professionals in any field.
EDA is key for any job that involves decision-making, because it allows making informed decisions after seeing the big picture in the data through visualizations, pattern identification, and causal reasoning.
Specifically, a strong foundation in EDA is essential for scientists and individuals seeking answers to complex questions for which empirical studies are required.

Here are some questions that EDA helps to answer:

- What is the **distribution** of the data?
- How do variables **relate** to each other?
- Are there any **outliers**?
- What **patterns** emerge from the data?
- What **trends** can be observed?
- Where are the **missing** values?
- How do variables **correlate**?
- What **causal relationships** exist between variables?
- What are the **implications** suggested by the data?
- Based on the data, what **predictions** can be made?
- What **opportunities** does the data reveal?

To answer these questions, in a typical EDA we begin by defining a hypothesis (or a series of questions around a particular subject) that we want to answer.
Next, we collect the relevant data, explore it, clean it, visualize it, and finally build a report. 
This is a straightforward process, as shown in the following diagram:

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
F(["💁️ End User or Decision Maker"])
I --> A
E --> F
{% endmermaid %}

Coming from an academic background, I see EDA as an integral component of the [scientific method](https://en.wikipedia.org/wiki/Scientific_method).
Viewed from a practical standpoint, such as that of an stakeholder, EDA is crucial for understanding the problem before developing any solution to address it.
This preliminary step ensures that the solution is effectively tailored to the intricacies of each particular problem.

# EDA: The Ubiquitous Technical Skill

I've been practicing EDA for over 12 years now.
I began dealing with data during my undergraduate studies in Computer Science and later, my [PhD in Software Engineering](../files/thesis/cesar-fulltext.pdf).
I've done it not because I particularly enjoy it (which I do), but because it was essential for my research.
As a software developer, my data analysis skills have opened doors to new opportunities to showcase my research abilities.
Let me tell you more about my journey. 

## The Swiss Army Knife in Academia

During my undergraduate studies in Computer Science, I received a lot of heavy maths subjects, including several semesters of calculus, linear algebra, discrete mathematics, advanced geometry, optimization models, and so on.
Among the math courses I took, there was one about statistics.
I remember that the lectures were very theoretical and focused on the formulas, rather than the practical aspects.
It was not until I had to write my thesis that I realized the importance of statistics.
There I was introduced to SPSS and R.
After looking at examples of the other thesis, I understood that a EDA was something that they all had in common. 
Clearly, a good EDA is strictly necessary of a good thesis.

<aside class="quote">
    <em>“EDA is a fundamental skill at all levels of high education.”</em> 
</aside>

I understood that I had to collect data and apply statistical tests to prove or disprove a scientific hypothesis if I wanted to get graduated.[^2]
So I started learning some plotting tools and statistical techniques.
I remember me looking at code examples in [Kaggle](https://www.kaggle.com/) where there are many datasets and a lot of notebooks to learn from. 
My [bachelor's thesis](https://dspace.uclv.edu.cu/handle/123456789/1935) was about applying time series classification models to the problem of accurately forecasting rainfalls. There I used EDA in SPSS to find patterns and understand real world data.

A couple later, I started my Master's in Computer Science and went into sport analytics.
I knew that if manage to collect enough data, formulate the right hypothesis, and use a completely new technique for the problem at hand, I could manage to get a paper published.
So I did exactly that (btw, [this](https://sciendo.com/it/article/10.1515/ijcss-2016-0007) is the paper if you're wondering).
I analyzed all the historical data publicly available of the MLB and applied a which at the time were cutting edge ML techniques to predict the outcome of games.
I publish a few papers on sport analytics later on using a similar strategy, and I realized that EDA was the most important skill to get the papers ready. 
I've no doubts that having high-quality figures was key to get the papers accepted.[^3]

<aside class="quote">
    <em>“EDA is essential for <a href="https://en.wikipedia.org/wiki/Reproducibility">reproducible science</a>, allowing other researchers to understand, replicate, and validate the findings.”</em> 
</aside>

Later during my PhD, I switched to [empirical software engineering research](../blog/empirical-software-engineering-research-is-harder-than-you-think.html).
Then, I realized that software is data as well, so EDA was critical to help me understand what's going on in large software ecosystems.
I started working on "[software debloating](../blog/why-debloating-third-party-software.html)," and collected a massive amount of graph based data about the relationship between Java dependencies.
I used EDA to find out which dependencies are the most bloated, which are the most used, and which are the most popular in the Java Maven ecosystem.
During all my academic career, the scale of the experiments and complexity of the data increased, but the importance of EDA remained the same.

## A Superpower Beyond Academia

After my PhD, I started working as a software developer. 
Working in a large organization helped me to understand better the motto "data driven decisions."
Again, EDA is one of the most important skills to understand data and hence take decisions.
It turns out that my academic skills are great to impress managers, to better support my arguments with data, or simply to describe problems under the basis of facts.
This not only makes me more effective at work, also makes my ideas more convincing, so it resonates with my colleagues and managers.
It's an advantage.
After all, what could you argue against a well-done [Wilcoxon's Signed-Rank Test](https://en.wikipedia.org/wiki/Wilcoxon_signed-rank_test?wprov=srpw1_0)?

<aside class="quote">
    <em>“Ideas backed by data are more convincing, which makes them more likely to catch the attention of decision-makers.”</em> 
</aside>

The market has also seeing the potential. 
Most large companies today rely on built-in tools for conducting EDA, such as [Elasticsearch](https://www.elastic.co/), [Tableau](https://www.tableau.com/), and [PowerBI](https://www.microsoft.com/en-us/power-platform/products/power-bi).
Yet, these platforms, despite their capabilities, often fall short when it comes to the depth of analysis required for complex problems.
There are instances where delving deeper into the data through custom coding is imperative, e.g., to leverage cutting-edge data analysis methodologies and statistical tests.
This is where R and Python come into play, offering a plethora of libraries and tools that enable the execution of complex EDA tasks.
On top of that, you can combine the data analysis with front-end development to create awesome interactive dashboards using some javascript library such as the famous [D3.js](https://d3js.org/), [Recharts](https://recharts.org/en-US/), or [Plotly](https://plotly.com/).

While AI continues to revolutionize how we interpret and utilize data, I believe that AI easily stumbles when it comes to EDA. 
The primary challenge for AI lies in understanding the context, which is required to effectively approach a business decision. 
For example, AI may not be able to discern the difference between a correlation and causation, or to spot nonsensical data points (such as a negative age or multi decimal price).
EDA is great for humans, as it's inherently exploratory and subjective, relying on the analyst's intuition and domain knowledge to guide the analysis.
This human touch allows for the identification of meaningful insights that AI, in its current state, struggles to replicate. 

# The Craft of a Good EDA

In this section, I share some insights on how I structure my EDA projects. I use R and RStudio, but you can relate the structure, narratives, aesthetics, and tools to any other programming language or environment you prefer.

## Structure

Before diving into the raw data, it is crucial to establish a clear structure for the  project.
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
│   ├── figures/
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
In the `notebooks` directory, I create separate R Markdown files for each research question and add a subdirectory named `figures` to store the plots.
I prefer notebooks to scripts, as they allow for a more interactive and engaging analysis.
However, I also include a `R` directory for data processing scripts that are common to multiple notebooks, which I import using the following code:

```R
source("R/data_processing.R")
```

Importing functions is a nice way to have (at least) some notion of reusable code in the project, beyond the notebooks.
I highly recommend mixing the use of notebooks and scripts, as it allows to keep good software engineering practices and avoid the pervasive "[notebook hell](https://medium.com/skyline-ai/jupyter-notebook-is-the-cancer-of-ml-engineering-70b98685ee71)" that many data scientist fall into.
This superstructure helps me keep my projects organized and easily accessible.

## Hypotheses

I always start my EDA projects by defining clear hypotheses.
Finding the relevant hypothesis to test is crucial, as it guides the entire analysis.
It is important for the hypothesis to provide a clear value proposition.
For example, in a marketing project for a new product, the hypothesis could be "The new product will increase sales by 20% in the first quarter."
It could be also to dispel a myth, such as "Any publicity is good publicity," or to prove or disprove a certain claim, such as "Investing `X` amount of money in marketing platform `Y` will increase sales by `Z`." 

Here are some additional tips to write a good hypothesis:
 
- It's a one-sentence question. 
- It should be refutable.
- Make sure there is sufficient data to test it.

## Narratives

We all love stories. 
This is something we acquired since we were kids listening to our moms beside our beds.
Stories are powerful tools to convey information and make it memorable.
In EDA, the narrative is the story you want to tell with your data.
It is the message you want to convey to your audience.

Let me illustrate the power of EDA and narratives altogether, using a single example:

> "I was sitting in the library, going through recent journal articles when, to everyone's surprise, Donald Knuth walked in. I can now say that the average number of citations of all researchers in the library, including myself, is now in the thousands. This is a perfect example of how to lie with statistics. Be careful when using averages; they can be mean to you. Outliers can wreck your conclusions."

Packaging statistics into a narrative is an art in itself.
It requires a deep understanding of the data, the context, and the audience.
In academia, as well as in industry, the ability to craft compelling narratives from data is a highly sought-after skill.

## Aesthetics

It is said that a picture is worth a thousand words.
This is especially true in EDA.
The aesthetics of your plots can make or break your analysis.
In a study on visual information in scientific literature, it was found that higher-impact articles had more diagrams per page and a higher proportion of diagrams, but a lower proportion of photos[^1].
This underscores the importance of visualizations in conveying complex information.

Color, size, and shape are all important elements of a good plot. For example, I like these colors: `#00cd6c`, `#ffc61e`, `#a0b1ba`, `#ff1f5d`, `#009ade`, `#af58ba`, `#f28522`, and `#a6761d`. Do you also like them?

<div>
<div style="background-color: #00cd6c; width: 100%; height: 10px; margin-top: 5px;"></div>
<div style="background-color: #ffc61e; width: 100%; height: 10px; margin-top: 5px;"></div>
<div style="background-color: #a0b1ba; width: 100%; height: 10px; margin-top: 5px;"></div>
<div style="background-color: #ff1f5d; width: 100%; height: 10px; margin-top: 5px;"></div>
<div style="background-color: #009ade; width: 100%; height: 10px; margin-top: 5px;"></div>
<div style="background-color: #af58ba; width: 100%; height: 10px; margin-top: 5px;"></div>
<div style="background-color: #f28522; width: 100%; height: 10px; margin-top: 5px;"></div>
<div style="background-color: #a6761d; width: 100%; height: 10px; margin-top: 5px;"></div>
</div>

Here are some additional tips to make a plot better:

- Use vector graphics for publication-quality plots (use SVG or PDF).
- Remove all unnecessary elements (including gridlines legends if possible).
- Use a caption to synthesize the message, not the chart itself (I try to summarize the key takeaway in one sentence).
- Check for message bias using a third party (just ask another person what does she understand from the figure, if it takes more than 1 min to figure out, then there's something wrong).
- Do the last retouches in a vector graphics editor (e.g., I use [Inkscape](https://inkscape.org/)).

## Tools

I use R and RStudio for my EDA projects.
In particular, I leverage the powerful [tidyverse](https://www.tidyverse.org/) ecosystem, and [ggplot2](https://ggplot2.tidyverse.org/) in particular for creating beautiful visualizations.
`ggplot2` is a powerful tool that leverages the [Grammar of Graphics](https://link.springer.com/book/10.1007/0-387-28695-0) to create complex plots with ease.
I start by loading the data, then I create a plot layer by layer, adding aesthetics, scales, and labels.

Here's [a real code example](https://github.com/ASSERT-KTH/jdbl-experiments/blob/master/notebooks/analysis_size.Rmd#L66C1-L81C64) of an EDA that I did for [this paper](https://doi.org/10.1145/3546948) (Note that this code and the resulting figure is never shown or discussed anywhere in the published paper):

{% highlight r linenos %}
# ----------------------------------------------------------------------------
# barplot of Jar sizes
# ----------------------------------------------------------------------------
jar_size_barplot <- df %>% ggplot(aes(x = Application, y = Size, fill = Tool)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_text(aes(label = paste(Size, "%")),
            position = position_dodge(width = 0.9),
            vjust = -0.3,
            family = "LM Roman 10") +
  scale_y_continuous(labels=function(x) paste0(x,"%"), limits = c(0, 100)) +
  labs(x = NULL, y = NULL) +
  scale_fill_viridis(discrete = TRUE, option = "D", direction = -1) +
  theme(legend.title = element_blank())

ggsave(filename = "Figures/jar_size_barplot.pdf", plot = jar_size_barplot,
       height = 3, width = 7,  units = c("in"), device = "pdf")
{% endhighlight %}


The code above produces [this figure](https://github.com/ASSERT-KTH/jdbl-experiments/blob/master/notebooks/Figures/analysis_size/jar_size_barplot.pdf). 
As you can see, it's about the small details and micro optimizations that make a plot better, but overall choosing the right chart type, the right colors, and the right message is what makes a plot great.

# Examples

I have used EDA in various projects, from analyzing sports' statistics to academic software engineering research, and also in my current work. 
My code is far from beautiful, but ~~I want to believe~~ it is still better than the horrendous Excel sheets existing out there.
Again, notice that the code is never published or discussed anywhere in the papers, but it solely available in the repositories which (surprisingly?) are almost never public.[^4]

Here are some examples of repositories where I have used EDA in my research papers:

- <a href="https://github.com/ASSERT-KTH/deptrim-experiments/tree/main/notebooks/R"><i class="fab fa-github"></i></a> [deptrim-experiments](https://github.com/ASSERT-KTH/deptrim-experiments/tree/main/notebooks/R)
- <a href="https://github.com/ASSERT-KTH/jdbl-experiments/tree/master/notebooks"><i class="fab fa-github"></i></a> [jdbl-experiments](https://github.com/ASSERT-KTH/jdbl-experiments/tree/master/notebooks)
- <a href="https://github.com/ASSERT-KTH/depclean-experiments/tree/master/notebooks"><i class="fab fa-github"></i></a> [depclean-experiments](https://github.com/ASSERT-KTH/depclean-experiments/tree/master/notebooks)
- <a href="https://github.com/chains-project/ethereum-ssc/tree/main/r_notebooks"><i class="fab fa-github"></i></a> [ethereum-ssc](https://github.com/chains-project/ethereum-ssc/tree/main/r_notebooks)
- <a href="https://github.com/cesarsotovalero/msr-2019s"><i class="fab fa-github"></i></a> [msr-2019s](https://github.com/cesarsotovalero/msr-2019s)
- <a href="https://github.com/cesarsotovalero/ijcss-comp-balance-laliga"><i class="fab fa-github"></i></a> [ijcss-comp-balance-laliga](https://github.com/cesarsotovalero/ijcss-comp-balance-laliga)

# Summary

I can confidently say that I am where I am now because I recognized the importance of explaining and manipulating data very early on.
EDA has proven to be a valuable asset in various fields and applications, from academia to industry.
From computer science research to software development, EDA has been a constant companion.
My journey with EDA has ranged from using it to analyze sports statistics to employing it as a critical tool in my research endeavors, and eventually, integrating it into my professional work.
Of course, some people are so skilled that it's difficult for them to identify the most important technical skill in their career.
However, I believe recognizing which skills were crucial at different stages is beneficial for personal growth, as it helps to focus on the right skills.
For me, the benefits of nurturing EDA over time have been varied: better job opportunities and professional recognition.
What has been your experience?

# Footnotes

[^1]: See "[Viziometrics: Analyzing Visual Information in the Scientific Literature](https://ieeexplore.ieee.org/abstract/document/7888968/?casa_token=-X0UVsB4pJoAAAAA:DgGkzsGt_6c-SovMKCFQvalKU5_I4bpqmjfVqQQTbmHQSeQPw3XzooyrcHM0hIFUL1IYnC4dyg)," in _IEEE Transactions on Big Data_, 2017

[^2]: I find the table in [this page](https://help.xlstat.com/6443-which-statistical-test-should-you-use) handy to determine which statistical test to use.

[^3]: I recommend reading the latest papers published in the [Journal of Statistical Software](https://www.jstatsoft.org/index) and the [Journal of Machine Learning Research](https://www.jmlr.org/).

[^4]: I've peer-reviewed [quite a few](../service.html) research papers, almost none of them include the code used to generate the figures in the paper.

