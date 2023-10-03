---
layout: post
title: Bus Factor&#58; A Human-Centered Risk Metric in the Software Supply Chain
subtitle: Public transportation may become hellish
tags: metrics
description: |
    What would happen to a software project if some of its developers were suddenly hit by a bus? The “bus factor” measures the amount of spread of knowledge within a dev team so that the project can survive the most drastic loss of personnel. Managers should keep an eye on this metric for the best of their projects.  
keywords:
  - software stakeholders,
  - software resilience,
  - knowledge management,
  - intelligent collaboration tools,
  - open-source management 
image: ../img/posts/2022/plane_paint_cover.jpg
share-img: ../img/posts/2022/plane_paint_cover.jpg
show-avatar: false
toc: true
date: 2022/02/06
author: cesarsotovalero
published: true
---

What if some members of a software project are suddenly hit by a bus?
What would happen to the project in such an unfortunate scenario?
According to [Wikipedia](https://en.wikipedia.org/wiki/Bus_factor#cite_note-1), this question was first pointed out in 1994 when someone publicly asked about what would happen to Python if [Guido van Rossum](https://en.wikipedia.org/wiki/Guido_van_Rossum) (the creator of the language) die as consequence of a bus accident.
The “bus factor” is defined as _the minimum number of team members that have to suddenly disappear from a project before the project stalls due to a lack of knowledgeable or competent personnel._
It is a **measurement of the risk** resulting from information and capabilities not being adequately shared among team members.
The concept is similar to the much older idea of key person risk.
Still, it considers the consequences of losing key technical experts versus financial or managerial executives (who are theoretically replaceable at an insurable cost).
Personnel must be both key and irreplaceable to contribute to the bus factor; losing a replaceable or non-key person would not result in a bus factor effect.
In this post, I deep dive into the concept of bus factor and discuss the perils of disregarding this important measure in software projects.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/plane_paint.jpg alt:"What if instead of a bus, the whole dev team is lost in a plane crash?" %}
  <figcaption class="stroke"> 
    &#169; What if, instead of a bus, the whole dev team is lost due to a plane crash? Photo from <a href="https://goo.gl/maps/j8GC4KtHEXoKxLpB8">Tekniska Högskolan station</a>.
  </figcaption>
</figure>

# Causes and Perils

Software development is a collaborative effort.
Recent research indicates that the average size of a software team is of [5 people](https://www.sciencedirect.com/science/article/pii/S0164121211002366).
Usually, the codebase knowledge is not equally distributed among the project contributors.
For example, a team member might create critical components by pushing code that is unintelligible or inaccessible to other team members (e.g., code that is undocumented, never shared, encrypted, obfuscated or not simply public).
Thus, a critical project component is at risk of being lost as a direct consequence of the absence of that team member, making the member key for the survival of the project.

> "How many or few would have to be hit by a truck (or quit) before the project is incapacitated?" -- James Coplien (in [Pair Programming Illuminated](https://www.amazon.com/Pair-Programming-Illuminated-Laurie-Williams/dp/0201745763))[^1]

The bus factor is a measure of the project's resilience in case of the most extreme kinds of perturbations (i.e., engineer turnover due to burnout, work leaving, chronic illness, accidents, or death).
The metric is related to socio-technical debt caused by the concentration of knowledge, being an important problem in collective development.
Due to the extreme nature of the metric, some managers may perceive the problem as improbable compared to other issues that arise during collaborative development.

While the bus factor is easy to comprehend, it is unclear how to compute it.
This is because the knowledge in a project is shared and created not only by writing code.
There are many other information channels, such as chats, reported issues, code reviews, informal conversations, etc.
Consequently, accurately estimating the bus factor is not an easy endeavor.

# Computing the Bus Factor

The bus factor is a sound human-based metric to assess the resilience of a software project.
However, translating the bus factor definition into a bus factor estimation algorithm is nontrivial.
Existing algorithms for bus factor estimation collect the distribution of information in the project from the [Git](https://www.cesarsotovalero.net/blog/git-fundamentals.html) version control system.
Smaller values of the bus factor lead to higher risks for a project.
Larger values correspond to a relatively even distribution of knowledge, so the departure of a team member would have a lesser impact.

> “Small teams of under 10 people usually target a truck factor of 4-5 for most parts of the system (that's around 50% of the team). Larger teams will probably target a truck factor of around 8 (which would probably be around 25% of the team). This means that should a couple of critical people go on vacation or leave the company, there are enough people in the team who can cover for them.” -- <cite>[Siddhi](http://www.siddharta.me/2005/06/truck-factor.html)</cite>

Here is a [naive algorithm](https://link.springer.com/chapter/10.1007/978-3-642-21843-9_26) for computing the bus factor of a project: 

{% highlight java linenos %}

/**
 * Computes the bus factor of a project based on the Git information about
 * the committers of each file in the project. A file is considered critical
 * when the developer has a coverage threshold of
 * 
 * @param T Critical file coverage threshold; e.g., 50%, 60%, 70%,...
 * @param D Project developers; e.g., {Dev1, Dev2, Dev3,...}.
 * @param F Project files; e.g., {File1, File2, File3,...}
 * @return The project bus factor. 
 */
public static int computeBusFactor(int T, List<String> D, List<String> F) {
    float[] minFileCoverageArray = new float[F.size()];
    int j = 1;
    for (; j < D.size(); j++) {
        float minFileCoverage = 100;
        for (List<List<String>> combination : combinations(j, D)) {
            int total = 0;
            for (String file : F) {
                if (!committers(file).diff(combination).isEmpty()) {
                    total++;
                }
            }
            float fileCoverage = total / F.size() * 100;
            if (fileCoverage < minFileCoverage) {
                minFileCoverage = fileCoverage;
            }
        }
        minFileCoverageArray[j] = minFileCoverage;
        if (minFileCoverageArray[j] < T) {
            break;
        }
    }
    return j - 1;
}

public static List<List> combinations(int j, List D) {
// Returns the list of all the combinations of j developers,
// e.g., combinations(2, {<Dev1,Dev2,Dev3>})= {<Dev1,Dev2>, <Dev1,Dev3>, <Dev2,Dev3>}
}

public static List committers(String f) {
// Returns the list of developers that committed the file f at least once,
// e.g., committers("File.java")= {Dev1, Dev2}
}
{% endhighlight %}


[Avelino and collaborators](https://www.computer.org/csdl/proceedings-article/icpc/2016/07503718/12OmNvA1hCh) have suggested a more [advanced bus factor algorithm](https://github.com/aserg-ufmg/Truck-Factor) based on the Degree of Authorship (DOA) metric. The algorithm first computes the $$DOA$$ of each of the engineers for every file in the project according to the following formula:

$$DOA(e,f) = 3.293 + 1.098FA $$
$$+ 0.164DL − 0.321 log(1 + AC)$$

where 

- $$FA$$ (first authorship) is 1 for $$f$$ file creator and 0 otherwise
- $$DL$$ is the number of commits to the file $$f$$ made by the engineer $$e$$
- $$AC$$ is the number of commits to the file $$f$$ made by the other project members

**NOTE:** Only the contributions made in the last 90 days are considered in the $$DOA$$.

According to the algorithm of Avelino, an engineer $$e$$ is an author of a file $$f$$ if $$DOA(e, f) > 3.293$$ and

$$DOA(e, f ) > 0.75 * max_{e} DOA(e, f)$$

where 

- $$3.293$$ is the constant equal to the free term in the first $$DOA$$ equation
- $$max_{e} DOA(e, f)$$ is the highest $$DOA$$ for file $$f$$ for all project members

A file is considered abandoned if all its authors have left the project.
The algorithm of Avelino takes the list of files with the DOAs of the engineers who have worked on them and iteratively moves the top author from the list of present developers to the list of key engineers.
The bus factor problem is considered to happen when more than 50% of files have been abandoned, and the algorithm yields the bus factor together with the list of key engineers.

# Mitigations

Increasing the bus factor is necessary, especially in the most critical parts of the codebase.
The increasing adoption of remote work has created new challenges related to the documentation and maintenance of the development processes.
In addition, the software industry dynamics in which developers usually change jobs every 2 or 3 years increases the risks of losing key personnel.
Securing knowledge is not optional for managers and organizations; it is actually an essential part of their job.

Here are some actionable ways of mitigating the risks:

- Reduce codebase complexity
- Document the processes and keep them up to date
- Avoid having orphan software components
- Encourage cross-training among team members
- Promote the use of pair programming
- Monitor the bus factor using automated tools

# Available Tools

Here are some state-of-the-art open source tools for bus factor calculation:

- <a href="https://github.com/aserg-ufmg/Truck-Factor"><i class="fab fa-github"></i></a> [aserg-ufmg/Truck-Factor](https://github.com/aserg-ufmg/Truck-Factor)
- <a href="https://github.com/SOM-Research/busfactor"><i class="fab fa-github"></i></a> [SOM-Research/busfactor](https://github.com/SOM-Research/busfactor)
- <a href="https://github.com/yamikuronue/BusFactor"><i class="fab fa-github"></i></a> [yamikuronue/BusFactor](https://github.com/yamikuronue/BusFactor)
- <a href="https://github.com/elek/bus-factor"><i class="fab fa-github"></i></a> [elek/bus-factor](https://github.com/elek/bus-factor)
- <a href="https://github.com/elek/bus-factor"><i class="fab fa-github"></i></a> [git-truck/git-truck](https://github.com/git-truck/git-truck)

# Conclusion

The bus factor is an essential metric for assessing the health of a software project.
It targets one of the most impactful human-based problems: the sudden absence of key engineers.
Product managers and stakeholders should be aware of this metric and monitor the resilience of their projects accordingly.
Many different calculation approaches are proposed in the literature, so today, it is difficult to make a novel scientific contribution to the "bus factor problem."
However, [as recent work suggests](https://arxiv.org/abs/2202.01523): a multifactorial bus factor estimation algorithm that uses data on code review and meetings together with Git data could improve the accuracy of this metric.

# References

- [Bus Factor in Practice](https://arxiv.org/abs/2202.01523)
- [Increasing your team’s bus factor](https://eight2late.wordpress.com/2008/09/03/increasing-your-teams-bus-factor)
- [Git and The “Bus Factor”: How Safe is Your Project?](https://www.bitband.com/blog/git-and-the-bus-factor-how-safe-is-your-project)
- [Calculating the "truck factor" for GitHub projects](https://lwn.net/Articles/651366/)
- [Top-30 GitHub projects with highest Truck Factor](https://medium.com/@aserg.ufmg/top-30-github-projects-with-highest-truck-factor-ab0862e9bb7a)

# Footnotes

[^1]: There are different definitions of the bus factor in the literature: it is also known as the “truck factor”; and sometimes words as “incapacitated” or “abandoned” are used instead of “stalled.”


[//]: # (Enable Latex support, see https://zjuwhw.github.io/2017/06/04/MathJax.html)
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  tex2jax: {
    inlineMath: [['$','$'], ['\\(','\\)']],
    processEscapes: true
  }
});
</script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>