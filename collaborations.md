---
layout: page
title: Hot topics
subtitle: Open to Research Collaborations
published: true
---

List of research topics that are open to further investigation. External collaboration is welcome.

## Table of contents

* [1. Debloat of mobile apps](#1-debloat-of-mobile-apps)
* [2. Automatic migration from Java &lt; 8 to Java 11 modular system](#2-automatic-migration-from-java--8-to-java-11-modular-system)

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

[3] Bruno Gois Mateus and Matias Martinez. [An empirical study on quality of Android applications written in Kotlin language](https://arxiv.org/pdf/1808.00025.pdf). CoRR, abs/1808.00025, 2018.

<div align="right"> <a href="#table-of-contents">&#8593; Back to top</a></div>


## 2. Automatic migration from Java < 8 to Java 11 modular system

### Motivation

On Linux, the full JDK 8 was 364 Mb, the JRE just 197 Mb. Users who were concerned about disk space could install the JRE and happily run their applications. The Java Platform Module System (JPMS), introduced in the Java 9, divides the monolithic `rt.jar` and `tools.jar` files into 75 distinct modules [3]. The idea is to build Java runtimes that are tailored to the requirements of a specific application. To do so, Oracle provides the [jlink](https://docs.oracle.com/javase/9/tools/jlink.htm#JSWOR-GUID-CECAC52B-CFEE-46CB-8166-F17A8E9280E9) command to assemble and optimize a set of modules and their dependencies into a custom runtime image [1]. Rather than including all 75 modules, you need only include the [`java.base`](https://docs.oracle.com/javase/9/docs/api/java.base-summary.html) module (which all runtimes must include by definition) as well as any other modules the application references. However, since jlink only works with modules, it can't be used to generate a runtime image
 for non-module based applications [2].

### Approach

We use code analysis techniques to determine which modules are used by an application. This will make possible to use jlink for generating a custom JRE that contains only the platform modules that are required for running the given application. 

### Validation

Select a set of Java applications for which we have the source code that compiles with Java 8. Automatically generate a modularizable version of the applications with the tool and compare the result w.r.t previous version. For example, concerning the size of the final binary, number of classes in the final binary, number of dependencies in the final dependency tree, ect. 

### References

[1] [https://www.baeldung.com/jlink](https://www.baeldung.com/jlink))

[2] [https://medium.com/azulsystems/using-jlink-to-build-java-runtimes-for-non-modular-applications-9568c5e70ef4](https://medium.com/azulsystems/using-jlink-to-build-java-runtimes-for-non-modular-applications-9568c5e70ef4)

[3] [https://www.baeldung.com/java-9-modularity](https://www.baeldung.com/java-9-modularity) 

<div align="right"> <a href="#table-of-contents">&#8593; Back to top</a></div>