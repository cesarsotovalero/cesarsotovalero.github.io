---
layout: page
title: Hot topics
subtitle: Open to Research Collaborations
published: true
---

> "Science is a collaborative effort. The combined results of several people working together is often much more effective than could be that of an individual scientist working alone"
> -- <cite>John Bardeen</cite>

---

List of research topics that are open to further investigation. External collaboration is welcome.

## Table of contents

* [1. Debloat of mobile apps](#1-debloat-of-mobile-apps)
* [2. Automatic migration from Java &lt; 8 to Java 11 modular system](#2-automatic-migration-from-java--8-to-java-11-modular-system)
* [3. Identification of program hotpots by monitoring system calls](#3-identification-of-program-hotpots-by-monitoring-system-calls)

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

On Linux, the full JDK 8 was 364 Mb, the JRE just 197 Mb. Users who were concerned about disk space could install the JRE and happily run their applications. The Java Platform Module System (JPMS), introduced in the Java 9, divides the monolithic `rt.jar` and `tools.jar` files into 75 distinct modules [3]. The idea is to build Java runtimes that are tailored to the requirements of a specific application. To do so, Oracle provides the [jlink](https://docs.oracle.com/javase/9/tools/jlink.htm#JSWOR-GUID-CECAC52B-CFEE-46CB-8166-F17A8E9280E9) command to assemble and optimize a set of modules and their dependencies into a custom runtime image [1]. Rather than including all 75 modules, you need only include the [`java.base`](https://docs.oracle.com/javase/9/docs/api/java.base-summary.html) module (which all runtimes must include by definition) as well as any other modules the application references. However, since jlink only works with modules, it can't be used to generate a runtime image for non-module based applications [2].

### Approach

We use code analysis techniques to determine which modules are used by an application. This will make possible to use jlink for generating a custom JRE that contains only the platform modules that are required for running the given application. 

### Validation

Select a set of Java applications for which we have the source code that compiles with Java 8. Automatically generate a modularizable version of the applications with the tool and compare the result w.r.t previous version. For example, concerning the size of the final binary, number of classes in the final binary, number of dependencies in the final dependency tree, ect. 

### References

[1] [https://www.baeldung.com/jlink](https://www.baeldung.com/jlink))

[2] [https://medium.com/azulsystems/using-jlink-to-build-java-runtimes-for-non-modular-applications-9568c5e70ef4](https://medium.com/azulsystems/using-jlink-to-build-java-runtimes-for-non-modular-applications-9568c5e70ef4)

[3] [https://www.baeldung.com/java-9-modularity](https://www.baeldung.com/java-9-modularity) 

<div align="right"> <a href="#table-of-contents">&#8593; Back to top</a></div>


## 3. Identification of program hotpots by monitoring system calls

### Motivation

The system call is the fundamental interface between an application and the Linux kernel [1]. The execution of **any** program written in **any** language will trigger the execution of some system calls. System calls are typically not invoked directly, but rather invoked through corresponding wrapper functions in the core library (e.g., `glibc` or `musl-libc`). There are 335 unique systems calls in the x86_84 architecture. The observation of system calls provides a uniform way to understand the execution of programs written in different languages, as well as a unique manner for monitoring their behavior.

Inspired by the [Hello world](https://drewdevault.com/2020/01/04/Slow.html) blog post, we aim at monitoring system calls executed at distinct part of programs in order to determine which regions are causing overhead in terms their quantity and diversity. The ultimate goal is to automatically remove (or reduce) the bloated system calls from the program.

### Approach

We start by monitoring the system calls triggered when exercising distinct regions of the program (e.g., from various entry points). Then, we cluster the system calls to determine the **core regions** of the application (i.e., the methods that use more system calls). Then, we debloat the program with several tools and measure the impact of debloating on the reduction of system calls. 

### Validation

Select a set of Java applications and monitor their systems calls according to different workloads. System calls can be obtained with [`strace`](https://strace.io). Then, implement a tool to debloat the application based on the results of the system calls monitoring (see examples of deboating tools [here](https://www.cesarsotovalero.net/2020-01-07-software-debloating-tools)).  
 
[1] [http://man7.org/linux/man-pages/man2/syscalls.2.html](http://man7.org/linux/man-pages/man2/syscalls.2.html) 

<div align="right"> <a href="#table-of-contents">&#8593; Back to top</a></div>
