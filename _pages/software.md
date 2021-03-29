---
permalink: software.html
layout: page
title: Software
subtitle: Open-source contributions
published: true
---

> "If you’re not contributing to open source, if your GitHub profile is not full of projects and commits, your “value” as a software developer is low, simply because this lack of open source activity tells everybody that you’re not passionate about software development and are simply working for money."
> -- <cite>Yegor Bugayenko</cite>

---

I develop robust software prototypes to support my research. I also contribute to open-source projects. Unless otherwise specified on the project page, all of my software projects are released under an MIT license. Below is a listing of those projects:

# Author

<div class="software-logo">
<a href="https://github.com/castor-software/jdbl">
<img align="left" src="../img/logos/JDBL_logo.svg" height="100px"  alt="JDBL logo"/> 
</a>
</div>
<a href="https://github.com/castor-software/jdbl"><i class="fab fa-github"></i></a>  [JDBL](https://github.com/castor-software/jdbl): A tool to debloat Java applications through dynamic and static analysis. JDBL works at build time, it removes unused classes and methods from Maven projects, including its dependencies. To do so, JDBL collects execution traces by [instrumenting](https://en.wikipedia.org/wiki/Instrumentation_(computer_programming)) and transforming the bytecode on-the-fly during the distinct Maven building phases. JDBL can be used as a Maven plugin or executed out-of-the-box as a standalone Java application. 

---

<div class="software-logo">
<a href="https://github.com/castor-software/depclean">
<img align="left" src="http://cf.jare.io/?u=https//www.cesarsotovalero.net/img/logos/DepClean_logo.svg" height="100px"  alt="DepClean logo"/>
</a>
</div>
<a href="https://github.com/castor-software/depclean"><i class="fab fa-github"></i></a> [DepClean](https://github.com/castor-software/depclean): A tool to automatically remove dependencies that are included in your Java dependency tree but are not actually used in the project's code. DepClean detects and removes all the unused dependencies declared in the `pom.xml` file of a project or imported from its parent. For that, it relies on bytecode static analysis and extends the `maven-dependency-analyze` plugin (more details on this [plugin](https://maven.apache.org/plugins/maven-dependency-plugin/analyze-mojo.html)). DepClean does not modify the original source code of the application nor its original `pom.xml`. It can be executed as a Maven goal through the command line or integrated directly into the Maven build lifecycle. 

---

<div class="software-logo">
<a href="https://github.com/cesarsotovalero/time-series-classification">
<img align="left" src="http://cf.jare.io/?u=https//www.cesarsotovalero.net/img/logos/TS-Classification_logo.svg" height="100px"  alt="TS-Classification logo"/>
</a>
</div>
<a href="https://github.com/cesarsotovalero/time-series-classification"><i class="fab fa-github"></i></a> [TS-Classification](https://github.com/cesarsotovalero/time-series-classification): A package for time series classification in Weka. It implements DTW as the distance function for the KNN base learner and a filter for the reduction of noisy instances. 

---
<div class="software-logo">
<a href="https://github.com/castor-software/dep-analyzer">
<img align="left" src="http://cf.jare.io/?u=https//www.cesarsotovalero.net/img/logos/DepAnalyzer_logo.svg" height="100px"  alt="DepAnalyzer logo"/>
</a>
</div>
<a href="https://github.com/castor-software/dep-analyzer"><i class="fab fa-github"></i></a> [DepAnalyzer](https://github.com/castor-software/dep-analyzer): A tool that allows to get a report of the dependencies used by a Java application. Given a `jar` file, DepAnalyzer instruments the bytecode to give a report about the name of the classes and methods of dependency that are used, as computed via static analysis.

---
 
# Casual contributor 

<a href="https://github.com/INRIA/spoon"><i class="fab fa-github"></i></a> [Spoon](https://github.com/INRIA/spoon): A metaprogramming library to analyze and transform Java source code (incl Java 9, 10, 11, 12). It parses source files to build a well-designed AST with powerful analysis and transformation API.

<!--
- [Dependency-Track](https://github.com/DependencyTrack/dependency-track)
-->
