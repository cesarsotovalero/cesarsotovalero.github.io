---
permalink: software.html
layout: page
title: Software
subtitle: Open-source Software
published: true
---

> "If you’re not contributing to open source, if your GitHub profile is not full of projects and commits, your “value” as a software developer is low, simply because this lack of open source activity tells everybody that you’re not passionate about software development and are simply working for money."
> -- <cite>Yegor Bugayenko</cite>



I develop robust software prototypes to support my research. I also contribute to open-source projects. Unless otherwise specified on the project page, all of my software projects are released under an MIT license. Below is a listing of those projects:

# Author

<img src="https://cesarsotovalero.github.io/img/logos/DepHeaven_logo.svg" height="100px"  alt="DepHeaven"/>

<a href="https://github.com/castor-software/depclean"><i class="fab fa-github"></i></a> DepHeaven is a tool to resolve the resolve the  [dependency hell](https://en.wikipedia.org/wiki/Dependency_hell) in Java projects. DepHeaven fixes dependency conflicts in Maven projects dynamically, during the build execution. 

---

<img src="https://cesarsotovalero.github.io/img/logos/JDbl_logo.svg" height="100px"  alt="TS-Classification"/> 

<a href="https://github.com/castor-software/jdbl"><i class="fab fa-github"></i></a>  JDbl is a tool for automatically specialize Java applications through dynamic and static debloat at build time. JDbl removes unused classes and methods from Maven projects (including its dependencies), as well as the Java Runtime Environment (JRE). To do so, JDbl collects execution traces by [instrumenting](https://en.wikipedia.org/wiki/Instrumentation_(computer_programming)) and transforming the bytecode on-the-fly during the distinct Maven building phases. JDbl can be used as a Maven plugin or executed out-of-the-box as a standalone Java application. 

---

<img src="https://cesarsotovalero.github.io/img/logos/DepClean_logo.png" height="100px"/> 

<a href="https://github.com/castor-software/depclean"><i class="fab fa-github"></i></a> DepClean is a tool to automatically remove dependencies that are included in your Java dependency tree but are not actually used in the project's code. DepClean detects and removes all the unused dependencies declared in the `pom.xml` file of a project or imported from its parent. For that, it relies on bytecode static analysis and extends the `maven-dependency-analyze` plugin (more details on this [plugin](https://maven.apache.org/plugins/maven-dependency-plugin/analyze-mojo.html)). DepClean does not modify the original source code of the application nor its original `pom.xml`. It can be executed as a Maven goal through the command line or integrated directly into the Maven build lifecycle. 

---

<img src="https://cesarsotovalero.github.io/img/logos/TS-Classification_logo.svg" height="100px"  alt="TS-Classification"/>

<a href="https://github.com/cesarsotovalero/timeSeriesClassification"><i class="fab fa-github"></i></a> A package for time series classification in Weka. It implements DTW as the distance function for the KNN base learner and a filter for the reduction of noisy instances. 

---

<img src="https://cesarsotovalero.github.io/img/logos/DepAnalyzer_logo.svg" height="100px"  alt="DepAnalyzer"/>

<a href="https://github.com/castor-software/dep-analyzer"><i class="fab fa-github"></i></a> DepAnalyzer allows to get a report of the dependencies used by a Java application. Given a `jar` file, DepAnalyzer instruments the bytecode to give a report about the name of the classes and methods of dependency that are used, as computed via static analysis.
 
---
 
# Also contributor 

- <a href="https://github.com/INRIA/spoon"><i class="fab fa-github"></i></a> [Spoon](https://github.com/INRIA/spoon): A metaprogramming library to analyze and transform Java source code (incl Java 9, 10, 11, 12). It parses source files to build a well-designed AST with powerful analysis and transformation API.

<!--
- [Dependency-Track](https://github.com/DependencyTrack/dependency-track)
-->
