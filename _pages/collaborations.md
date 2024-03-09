---
permalink: collaborations.html
layout: page
title: Collaborations
subtitle: 🤝
published: true
---

I am continuously looking for highly motivated master or bachelor students at KTH. Potential thesis topics are related to my research in the areas of debloating and software diversity, in particular with a focus on code analysis and transformations. 

The following is a list of research topics that I’m particularly interested in doing further investigation. Any kind of external collaboration is also welcome.

# List of Topics

* [1. Debloat of mobile apps](#1-debloat-of-mobile-apps)
* [2. Automatic migration from Java &lt; 8 to Java 11 modular system](#2-automatic-migration-from-java--8-to-java-11-modular-system)
* [3. Identification of program hotpots by monitoring system calls](#3-identification-of-program-hotpots-by-monitoring-system-calls)
* [4. Automatic repair of dependency conflicts in Java](#4-automatic-repair-of-dependency-conflicts-in-java)
* [5. Feature-guided program debloating](#5-feature-guided-program-debloating)
* [6. Fine-grained specialization of JS libraries](#6-fine-grained-specialization-of-js-libraries)
* [7. Towards automatic untangling of APIs](#7-towards-automatic-untangling-of-apis)
* [8. Automatic Debloat of Bots Dependency Alerts](#8-automatic-debloat-of-bots-dependency-alerts)
* [9. Vulnerability Analysis Through Debloating](#9-vulnerability-analysis-through-debloating)
* [10. Automatic Debloating IaC Files](#10-automatic-debloating-iac-files)

# 1. Debloat of mobile apps

### Motivation

The size of mobile apps keeps increasing, reaching tens of MB on average. This happens because app companies hope to grow their market with more and more features. However, this is a significant issue for users. Users of smartphones can run these apps because their phones have the necessary power (a recent smartphone is orders of magnitude more powerful than Apollo 11 [1]). Still, they regularly remove them to save memory [2]. Yet, the issues are even more significant for the millions of users who do not have access to smartphones and cannot even install the apps because of a lack of resources.

### Approach

We use an aggressive approach to debloat mobile apps. Ideally, it would be based on actual usage traces rather than test cases.

### Validation

Select a set of Android applications for which we have the source code and that have test cases (we can start from the collection of applications collected by Matias [3]. Compare tool with ProGuard, concerning the size of the final binary, number of classes in the final binary, number of dependencies in the final dependency tree. Check that some of the debloated versions can be installed on cell phones that have limited resources compared to modern smartphones.

### References

[1] [https://www.zmescience.com/research/technology/smartphone-power-compared-to-apollo-432](https://www.zmescience.com/research/technology/smartphone-power-compared-to-apollo-432)

[2] [https://techjury.net/stats-about/app-usage](https://techjury.net/stats-about/app-usage)

[3] Bruno Gois Mateus and Matias Martinez. [An empirical study on quality of Android applications written in Kotlin language](https://arxiv.org/pdf/1808.00025.pdf).

<div align="right"> <a href="#list-of-topics" onclick="scrollToTop();return false">Back to Top &uarr;</a></div>

---

# 2. Automatic migration from Java < 8 to Java 11 modular system

### Motivation

On Linux, the full JDK 8 was 364 Mb, the JRE just 197 Mb. Users who were concerned about disk space could install the JRE and happily run their applications. The Java Platform Module System (JPMS), introduced in the Java 9, divides the monolithic `rt.jar` and `tools.jar` files into 75 distinct modules [3]. The idea is to build Java runtimes that are tailored to the requirements of a specific application. To do so, Oracle provides the [jlink](https://docs.oracle.com/javase/9/tools/jlink.htm#JSWOR-GUID-CECAC52B-CFEE-46CB-8166-F17A8E9280E9) command to assemble and optimize a set of modules and their dependencies into a custom runtime image [1]. Rather than including all 75 modules, you need only include the [`java.base`](https://docs.oracle.com/javase/9/docs/api/java.base-summary.html) module (which all runtimes must include by definition) as well as any other modules the application references. However, since jlink only works with modules, it can't be used to generate a runtime image for non-module based applications [2].

### Approach

We use code analysis techniques to determine which modules are used by an application. This will make possible to use jlink for generating a custom JRE that contains only the platform modules that are required for running the given application. 

### Validation

Select a set of Java applications for which we have the source code that compiles with Java 8. Automatically generate a modularizable version of the applications with the tool and compare the result w.r.t previous version. For example, concerning the size of the final binary, number of classes in the final binary, number of dependencies in the final dependency tree, ect. 

### References

[1] [https://www.baeldung.com/jlink](https://www.baeldung.com/jlink))

[2] [https://medium.com/azulsystems/using-jlink-to-build-java-runtimes-for-non-modular-applications-9568c5e70ef4](https://medium.com/azulsystems/using-jlink-to-build-java-runtimes-for-non-modular-applications-9568c5e70ef4)

[3] [https://www.baeldung.com/java-9-modularity](https://www.baeldung.com/java-9-modularity) 

<div align="right"> <a href="#list-of-topics" onclick="scrollToTop();return false">Back to Top &uarr;</a></div>

---

# 3. Identification of program hotpots by monitoring system calls

### Motivation

The system call is the fundamental interface between an application and the Linux kernel [1]. The execution of **any** program written in **any** language will trigger the execution of some system calls. System calls are typically not invoked directly, but rather invoked through corresponding wrapper functions in the core library (e.g., `glibc` or `musl-libc`). There are 335 unique systems calls in the x86_84 architecture. The observation of system calls provides a uniform way to understand the execution of programs written in different languages, as well as a unique manner for monitoring their behavior.

Inspired by the [Hello world](https://drewdevault.com/2020/01/04/Slow.html) blog post, we aim at monitoring system calls executed at distinct part of programs in order to determine which regions are causing overhead in terms their quantity and diversity. The ultimate goal is to automatically remove (or reduce) the bloated system calls from the program.

### Approach

We start by monitoring the system calls triggered when exercising distinct regions of the program (e.g., from various entry points). Then, we cluster the system calls to determine the **core regions** of the application (i.e., the methods that use more system calls). Then, we debloat the program with several tools and measure the impact of debloating on the reduction of system calls. 

### Validation

Select a set of Java applications and monitor their systems calls according to different workloads. System calls can be obtained with [`strace`](https://strace.io). Then, implement a tool to debloat the application based on the results of the system calls monitoring (see examples of deboating tools [here](https://www.cesarsotovalero.net/software-debloating-tools)).  

### References
 
[1] [http://man7.org/linux/man-pages/man2/syscalls.2.html](http://man7.org/linux/man-pages/man2/syscalls.2.html) 

<div align="right"> <a href="#list-of-topics" onclick="scrollToTop();return false">Back to Top &uarr;</a></div>

---

# 4. Automatic repair of dependency conflicts in Java

### Motivation

The [Java class loading mechanism](https://docs.oracle.com/javase/tutorial/ext/basics/load.html) does not permit to have multiple classes with the same fully-qualified name in the classpath of an application. Consequently, Maven has to choose a single version for every dependency. The [Maven dependency resolution mechanism](http://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html) determines the library version that is nearest to the root of the dependency tree and "shadows" the other versions, i.e., the dependency tree will contain only one version per dependency. 

Currently, Maven triggers warnings on the console to alert developers if dependency conflicts exist in the project [1]. The occurrence of conflicting versions is an issue known as the JAR hell in the Java  ecosystems; and it is a best practice that developers solve them manually as soon as possible [2]. However, there is currently no tool to fix dependency conflicts at runtime in the Java ecosystem.

### Approach

We rely on dynamic program analysis to determine what dependencies are causing the conflicts. To do so, we execute the test suite of the project and inspect its dependency tree. The goal is to analyze the dependencies with respect to their actual usage and manipulate the `pom.xml` file accordingly to find the class members that might create the conflicts. The approach is similar to [3], with the difference that we perform the repair at run-time (ideally through the implementation of a dedicated Maven plugin).   

### Validation

Select a set of open-source projects that use Maven and have dependency conflicts causing build breakages at some stage of its build history, e.g., mining the Travis CI log files. Then clone the project at that stage and use the implemented tool to repair the conflict automatically. Report on the results obtained and compare to the static approach proposed in [3]. 

### References

[1] Wang, Ying, et al. ["Do the dependency conflicts in my project matter?"](https://dl.acm.org/doi/abs/10.1145/3236024.3236056). FSE, 2018.

[2] Wang, Ying, et al. ["Could I have a stack trace to examine the dependency conflict issue?"](https://ieeexplore.ieee.org/abstract/document/8812128/). ICSE, 2019.

[3] Macho, Christian, Shane McIntosh, and Martin Pinzger. ["Automatically repairing dependency-related build breakage"](https://ieeexplore.ieee.org/abstract/document/8330201/). SANER, 2018.

<div align="right"> <a href="#list-of-topics" onclick="scrollToTop();return false">Back to Top &uarr;</a></div>

---

# 5. Feature-guided program debloating

### Motivation

One of the fundamental challenges of debloating consists in trimming unused features from an application [3]. There could be several reasons that motivate this approach. For example, the maintenance of unused (or unpopular) features leads to unnecessary costs. Thus, the identification and removal of unneeded features can help product owners to prioritize maintenance efforts [4]. 

Recent work focuses on the addition of feature sets to maps to facilitate the debloating process [1]. However, these approaches are not automatic and depend on the developers criteria to label features in the program. 
 
### Approach

We approximate the feature space in the program by constructing a static call graph first, and then collecting dynamic traces representing specific executions of it. This approach will allow us to get diverse sets concerning the utilization of the program in distinct user scenarios. Our approach is similar to [2], with the difference that we will identify the features using community graph-based algorithms over the static call graph, and we'll perform the dynamic analysis automatically through the execution of the test suite of the program. 

### Validation

We evaluate our approach by conducting case studies on removing cross-cutting features from real-world Java programs. We'll compare the programs before and after the debloat w.r.t correctness, size, performance, and reduction of the attack surface.

### References

[1] Brown, Michael D. and Pande, Santosh ["CARVE: Practical Security-Focused Software Debloating Using Simple Feature Set Mappings"](https://dl-acm-org.focus.lib.kth.se/doi/10.1145/3338502.3359764). FEAST, 2019.

[2] Xin, et al. ["Identifying features of Android apps from execution traces"](https://dl-acm-org.focus.lib.kth.se/doi/10.5555/3340730.3340740). MOBILESoft, 2019.

[3] Jiang, et al. ["Feature-Based Software Customization: Preliminary Analysis, Formalization, and Methods"](https://dl-acm-org.focus.lib.kth.se/doi/10.1109/HASE.2016.27). HASE, 2016.

[4] Eder, et al. ["Which Features Do My Users (Not) Use?"](https://dl-acm-org.focus.lib.kth.se/doi/10.1109/ICSME.2014.71). ICSME, 2014.


<div align="right"> <a href="#list-of-topics" onclick="scrollToTop();return false">Back to Top &uarr;</a></div>

---

# 6. Fine-grained specialization of JS libraries

### Motivation

A common reuse practice in web development is to include JavaScript (JS) libraries in the header of the web pages. These libraries are shared across all the website sub-pages and loaded every time a user visits a new page. This approach leads to web applications being bloated with significant portions of JS code that are actually not used, which unnecessarily slow down website loading because of the extra unused code. The bloated code also increases the attack surface by providing more entry-points to a possible attacker.

Although static and dynamic techniques have been proposed for removing unused code and specializing JS libraries [2, 3], there is still room for improvements on the users' side. No previous work has focused on debloating JS dependencies at a per-page level.

### Approach

We'll perform a static analysis of JS libraries usages by decomposing the web application on a per-page basis. This approach will give us a specialized version of the library for each page. The goal is to implement a tool that performs this analysis automatically, caching the specialized version of the library at a fine grained level for the user.

### Validation

Our approach will be evaluated by conducting case studies of specializing in real-world web applications. We'll compare these applications before and after the specialization in terms of size reduction and data bandwidth saving w.r.t users' page views [1]. Ideally, we'll deploy at least one real application and monitor the performance improvement through time.

### References

[1] [Wikipedia's JavaScript initialisation on a budget](https://phabricator.wikimedia.org/phame/post/view/175/wikipedia_s_javascript_initialisation_on_a_budget)

[2] Vázquez, Hernán Ceferino, et al. ["Slimming javascript applications: An approach for removing unused functions from javascript libraries."](https://www.sciencedirect.com/science/article/pii/S0950584918302210) Information and Software Technology 107 (2019): 18-29. 

[3] Morales, Rodrigo, Rubén Saborido, and Yann-Gaël Guéhéneuc. ["MoMIT: Porting a JavaScript Interpreter on a Quarter Coin."](https://ieeexplore.ieee.org/document/8966499) IEEE Transactions on Software Engineering (2020).


<div align="right"> <a href="#list-of-topics" onclick="scrollToTop();return false">Back to Top &uarr;</a></div>

---

# 7. Towards automatic untangling of APIs

### Motivation

Multi-purpose libraries deliver several functionalities through their public API, which are often unused by their clients. On the other hand, libraries tend to grow in functionalities, and sometimes this can negatively influence the user experience. Those libraries should be refactored, i.e., by dividing the API into a set of smaller and more focused and independent sub-modules [2]. 

As an example, the [JUnit 4](https://junit.org/junit4/) framework was heavily refactored and divided into several modules. The next generation, [JUnit 5](https://junit.org/junit5), contains specific modules to provide certain functionalities each (e.g., `junit-jupiter-engine`, `junit-platform-launcher`).

### Approach

We'll explore the possibilities of automatically untangling libraries into two or more specialized components. To do so, we'll construct dynamic call graphs based on the usage that their client applications make of them [1]. Ideally, we'll create a tool that detects the features and performs the division of the library and functionality isolation in an unsupervised manner. We can obtain information about features from several sources, e.g., version changes, git history, etc.

### Validation

We evaluate our approach by conducting case studies on real-world fat and popular multi-purpose libraries (e.g., [guava](https://github.com/google/guava), [jcabi-immutable](jcabi-immutable), [weka](https://www.cs.waikato.ac.nz/ml/weka)), with a special focus on user acceptance. In other words, we plan to propose the reuse of smaller pieces of the library to their users.

### References

[1] de Matos, Anderson Severo, João Bosco Ferreira Filho, and Lincoln Souza Rocha. ["Splitting APIs: an exploratory study of software unbundling".](https://ieeexplore.ieee.org/abstract/document/8816781) 2019 IEEE/ACM 16th International Conference on Mining Software Repositories (MSR). IEEE, 2019.

[2] Ferreira Filho, João Bosco, Mathieu Acher, and Olivier Barais. ["Software unbundling: Challenges and perspectives".](https://link.springer.com/chapter/10.1007/978-3-319-46969-0_6) Transactions on Modularity and Composition I. Springer, Cham, 2016. 224-237.


<div align="right"> <a href="#list-of-topics" onclick="scrollToTop();return false">Back to Top &uarr;</a></div>

---

# 8. Automatic Debloat of Bots Dependency Alerts

### Motivation

In modern software projects, developers rely on bots to manage several common tasks automatically [1]. An example of such tasks is dependency management, in which software bots allow to find and fix vulnerabilities in open-source libraries by proposing the update of their third-party dependencies (e.g., [Snyk](https://snyk.io/), [Dependabot](https://dependabot.com/)). These tools analyze the dependency versions used in software projects and mine repositories and CVE databases in order to spot known vulnerabilities in the dependencies used by the clients. 

However, in complex projects, developers might be overwhelmed by many dependency alerts coming from such bots. They have to revise each alert (triggered mostly as pull requests) manually, in order to approve or reject it. In our previous research works [2, 3], we have found that clients use only a small part of their declared dependencies (or even do not use them them at all). Therefore, the goal of this project is to study the dependency alerts triggered by bots and shrink the ones that are unused by developers. This will save developers’ time and effort, at the same time that eases their interaction with software bots.

### Approach

First, we mine GitHub projects in order to filter the commits that are related to dependency bots. Then, we analyze the difference between the vulnerable version of the dependency used, and the new one proposed by the bot. The goal is to determine if the code introduced in the new version is actually used by the project, i.e., if the dependency update is relevant for the project in particular. 


### Validation

For validation, we collect dependency related commits from open-source Java projects on GitHub, and analyze the dependency usage of the project with [DepClean](https://github.com/castor-software/depclean). We will report on the number of alerts that can be filtered out with our approach.

### References

[1] [Explainable Software Bot Contributions:Case Study of Automated Bug Fixes](https://arxiv.org/pdf/1905.02597.pdf)

[2] [Analyzing 2.3 Million Maven Dependencies to Reveal an Essential Core in APIs](https://arxiv.org/pdf/1908.09757.pdf)

[3] [A Comprehensive Study of Bloated Dependencies in the Maven Ecosystem](https://arxiv.org/pdf/2001.07808.pdf)


<div align="right"> <a href="#list-of-topics" onclick="scrollToTop();return false">Back to Top &uarr;</a></div>



---

# 9. Vulnerability Analysis Through Debloating


### Motivation

Software debloating has been fundamentally used to remove vulnerabilties by eliminating the unnecessary parts of the code [1, 3].
In this context, the benefits of debloating for security are a side effect of removing code (i.e., less code potentially leads to fewer bugs and vulnerabilities).

Existing software vulnerability assessment tools allow finding critical security bugs and provide feedback to developers using static analysis  (e.g., [Snyk](https://snyk.io/), [Dependabot](https://dependabot.com/)).
These tools facilitate the localization of the vulnerable portions of code in the analyzed repository [2].
However, developers lack a broader knowledge of what parts of their codebase are actually affected by the vulnerable code.
They need to know the extent of vulnerability exposition in their codebase once a new CVE is released.

### Approach

The goal of this research project is to leverage software debloating techniques to determine which parts of the code are actually exposed to vulnerabilities.
First, we will collect CVEs reports affecting real-world applications and examine the ratio of the codebase that is affected by the vulnerable code via reverted call-graph analysis.
Second, we will debloat the rest of the application  (i.e., removing the used parts that are not affected by the CVEs) in order to get a better vision of the actual impact of the vulnerability.
Developers and practitioners will benefit from this information because they will be able to isolate the vulnerable parts for beter study and fixing.
This will allows them to construct a mind-map of the relevance of the vulnerability, which will rapidly impact assessment and supports bug fixes.

### Validation

For validation, we will first compute the ratio of the codebase that is affected by well-known CVEs, for a quantitative assessment of the impact of having this knowledge.
Then, we will create a tool that receives as entry points the parts of the code affected by vulnerabilities and automatically debloats the rest.
The tool then will provide information to developers about the vulnerable classes/methods/attributes affected.
This information can be displayed in the browser, and feedback from developers related to the tool's usefulness will be collected as a qualitative validation.


### References

[1] [CARVE: Practical Security-Focused Software Debloating Using Simple Feature Set Mappings](https://dl.acm.org/doi/abs/10.1145/3338502.3359764)

[2] [The Secret Life of Software Vulnerabilities: A Large-Scale Empirical Study](https://ieeexplore.ieee.org/abstract/document/9672730)

[3] [Less is More: Quantifying the Security Benefits of Debloating Web Applications](https://www.usenix.org/conference/usenixsecurity19/presentation/azad)


<div align="right"> <a href="#list-of-topics" onclick="scrollToTop();return false">Back to Top &uarr;</a></div>


---

# 10. Automatic Debloating IaC Files


### Motivation

[Infrastructure as Code](https://en.wikipedia.org/wiki/Infrastructure_as_code) (IaC) is the process of managing software infrastructure via programmable configuration files (i.e., scripts).
IaC scripts are software artifacts that need to be carefully maintained because minimal changes may trigger a high stake in terms of resource consumption.
This means that creating minimal, highly optimized, IaC files is critical for developers and businesses that rely on cloud service infrastructure.

Debloating IaC scripts consists in transforming the script to reduce the number of resources necessary to provide the same functionality.
Researchers have studied many ways of debloating containers [1, 2, 3].
In this context, bloat has been considered as an IaC bad smell [5].

Mature IaC debloating tools, such as [DockerSlim](https://github.com/docker-slim/docker-slim), focus on reducing the size of Docker images.
However, IaC scripts are much more than Docker images [4].
These files orchestrate a larger number of resources (e.g, OS, dependencies, external packages, running environments, etc.).
Therefore, we argue that debloating IaC, beyond Docker images, is a highly relevant task.

### Approach

The goal of this research project is to leverage software debloating techniques to determine which parts of an IaC script can be modified in order to reduce software bloat.

The research driven by two tasks:

1. Use existing debloating tools (e.g., DockerSlim, [DepClean](https://github.com/castor-software/depclean), or JShrink) to produce smaller, debloated versions of real-world applications. We will analyze the number of resources saved with this approach compared to the original, non-debloated version.

2. Implement a research tool that leverages the knowledge gained in the first task to identify the parts of IaC scripts that are more susceptible to software bloat. The tool can use patterns to search for bloat spots. The goal is to transform/debloat IaC scripts automatically.

### Validation

For validation, we will assess the effectiveness of the tool at identifying sources of IaC bloat.
We will quantify the resources saved through our automatic debloating mechanism.
As a qualitative validation assessment, we will propose modifications to open-source projects on GitHub via pull requests.
This is a fundamental outcome to validate the relevance of our approach.


### References

[1] [New Directions for Container Debloating](https://dl.acm.org/doi/abs/10.1145/3141235.3141241)

[2] [Techniques and Tools for De-bloating Containers](https://security.csl.toronto.edu/wp-content/uploads/2018/06/ONR_Debloating.pdf)

[3] [Cimplifier: automatically debloating containers](https://dl.acm.org/doi/10.1145/3106237.3106271)

[4] [GLITCH: an Intermediate-Representation-Based Security Analysis for Infrastructure as Code Scripts](https://arxiv.org/abs/2205.14371)

[5] [Different Kind of Smells: Security Smells in Infrastructure as Code Scripts](https://ieeexplore.ieee.org/abstract/document/9388795)


<div align="right"> <a href="#list-of-topics" onclick="scrollToTop();return false">Back to Top &uarr;</a></div>

