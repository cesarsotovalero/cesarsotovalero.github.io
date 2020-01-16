---
layout: post
title: Software debloating papers
subtitle: Living literature review 
published: true
image: ../img/debloating.png
date: 2018/09/24
---

This is a [living review](https://en.wikipedia.org/wiki/Living_review) of articles related to program debloating and software specialization. 

## TOC

* [2018](#2018)
* [2017](#2017)
* [2016](#2016)
* [2015](#2015)
* [2013](#2013)
* [2012](#2012)
* [2011](#2011)
* [2010](#2010)
* [2006](#2006)
* [2002](#2002)
* [External web resources](#external-web-resources)


## 2018

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg)  **Fine-Grained Library Customization** [[link]](https://arxiv.org/pdf/1810.11128.pdf) 

<details> 
Conduct a case study to understand the impact of code bloat in production-run software by analysing statically linked libraries. Leverage dependence analysis to trim the resultless code statements residing in a target library
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Debloating Software through Piece-Wise Compilation and Loading** [[link]](https://www.usenix.org/system/files/conference/usenixsecurity18/sec18-quach.pdf) 

<details> 
Introduce  a  generic  inter-modular late-stage debloating framework.  It combines static (i.e., compile-time) and  dynamic  (i.e.,  load-time)  approaches  to  systematically  detect  and  automatically  eliminate  unused  code from program memory.  This can be thought of as a runtime extension to dead code elimination. Unused code is identified and removed by introducing a piece-wise compiler that  not  only  compiles  code  modules  (executables,  shared  and  static  objects),  but  also generates a dependency graph that retains all compiler knowledge  on which function  depends  on what other function(s).
</details>

![Custom badge](https://img.shields.io/badge/-JOURNAL_ARTICLE-C32B72.svg) **Slimming javascript applications: An approach for removing unused functions from javascript libraries** [[link]](https://www.sciencedirect.com/science/article/abs/pii/S0950584918302210)  

<details> 
Define the notion of Unused Foreign Function (UFF) to denote a JavaScript function contained in dependent libraries that is not needed at runtime. Also propose an approach based on dynamic analysis that assists developers to identify and remove UFFs from JavaScript bundles. The results show a reduction of JavaScript bundles of 26%. 
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **TRIMMER: Application Specialization for Code Debloating** [[link]](http://www.csl.sri.com/users/gehani/papers/ASE-2018.Trimmer.pdf) 

<details> 
Proposes Trimmer, an application specialization tool that leverages user-provided configuration data to specialize an application to its deployment context. The specialization process attempts to eliminate the application functionality that is unused in the user-defined context. 
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **RedDroid: Android Application Redundancy Customization Based on Static Analysis** [[link]](https://faculty.ist.psu.edu/wu/papers/RedDroid-ISSRE2018.pdf) 

<details> 
The paper presents a comprehensive study of software bloat in Android applications, and categorize them into two types, compile-time  redundancy  and  install-time  redundancy. It also propose  a  static  analysis  based  approach  to  identifying and  removing  software  bloat  from  Android  applications.
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Effective Program Debloating via Reinforcement Learning** [[link]](http://www.cis.upenn.edu/~mhnaik/papers/ccs18.pdf) 

<details> 
Uses reinforcement learning to improve Delta Debugging in terms of processing time by reducing the number of iterations necessary to remove redundant code. The approach aggressively removes redundant code even on the execution paths. The reduction is based on a test script with the specification of the functionalities that will be keep. The approach is implemented as a program reducer for C programs based on the syntax-guided Hierarchical Delta Debugging algorithm. The evaluation took into account the effectiveness, security and robustness of 10 reference programs from GNU packages.
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Perses: Syntax guided program reduction** [[link]](http://web.cs.ucdavis.edu/~su/publications/perses.pdf) 

<details> 
Reduces programs by exploiting the formal syntax of the program. Perses considers only smaller, syntactically valid variants to avoid  futile efforts on syntactically invalid variants. Evaluation was carried out using 20 C programs, and also Java applications.
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Wholly! : A Build System For The Modern Software Stac** [[link]](http://www.csl.sri.com/users/gehani/papers/FMICS-2018.Wholly.pdf) 

<details> 
Wholly! is designed for reproducible and verifiable builds of optimized and debloated software that runs uniformly on traditional desktops, the cloud, and IoT devices. Wholly! uses Linux containers to ensure the integrity and reproducibility of the build environment. It uses the clang compiler to generate
LLVM bitcode for all produced libraries and binaries to allow for whole program analysis, specialization, and optimization. 
</details>
                     
## 2017

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **A Multi-OS Cross-Layer Study of Bloating in User Programs, Kernel and Managed Execution Environments** [[link]](https://tc.gtisc.gatech.edu/feast17/papers/p65-quachA.pdf) -

<details> 
Presents a study of bloating across the software stack (user-level programs, OS kernels and JVM). Employs (1) static measurements to detect limits to debloating, and (2) dynamic measurements to detect how much of the code available to a program is utilized under typical payloads. It uses a tracing procedure in ato measure the bloat in kernel, measuring the amount of kernel code that executes during the boot process and during the execution of popular system calls. The results show that bloating is pervasive and severe. A significant fraction of code across the software stack is never executed and provides scope for debloating.
</details>



![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **DamGate: Dynamic Adaptative Multi-feature Gating in Program Binaries** [[link]](https://www2.seas.gwu.edu/~guruv/feast17.pdf) 

<details> 
Presents DamGate, a framework for dynamic feature customization, allowing vigilant management of program features at runtime to prevent violation of privacy and security policies. At the heart of this technique is the selective placement of checker functions (gates) into feature-constituent functions that need to be protected. Through execution gating and feature validation on the fly, DamGate provides differentiated control policy for program features and enables flexible runtime reconfiguration. The proposed framework is prototyped and evaluated using LibreOffice The evaluation results show that it can achieve desired feature customization with negligible gating overhead.
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Cimplifier: Automatically Debloating Containers** [[link]](http://pages.cs.wisc.edu/~vrastogi/static/papers/rddjm17.pdf) 

<details> 
Propose a technique to debloating application containers running on Docker. They decompose a complicated container into multiple simpler containers with respect to a given user-defined constraint. Their technique is based on dynamic analysis to obtain information about application behaviors. The evaluation on real-world containers shows that this approachpreserves the original functionality, leads to reduction in image size of up to 95%, and processes even large containers in under thirty seconds.
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **TOSS: Tailoring Online Server Systems through Binary Feature Customization** [[link]](https://www2.seas.gwu.edu/~tlan/papers/TOSS_FEAST_2018.pdf) 

<details> 
Propose an approach for automated customization of online servers and software systems, which are implemented using a client-server architecture based on the underlying network protocols. TOSS harnesses program tracing and tainting-guided symbolic execution to identify desired (feature-related) code from the original program binary, and apply static binary rewriting to remove redundant features and directly create customized program binary with only desired features. The evaluation was conducted in Mosquitto, TOSS was able to create a functional program binary with only desired features and significantly reduce potential attack surface by eliminating undesired protocol/program features.
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Failure-Directed Program Trimming** [[link]](https://www.cs.utexas.edu/~isil/program-trimming.pdf) 

<details> 
Propose a program trimming technique that aims to reduce the number of execution paths while preserving safety. This allows any safety checker to be goal directed by pruning execution paths that cannot possibly result in an assertion violation.
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Smartphone Bloatware: An Overlooked Privacy Problem** [[link]](https://link.springer.com/chapter/10.1007/978-3-319-72389-1_15) 

<details> 
Provide findings of a user-study that was conducted to investigate the practical utility of smarthphone bloatware in personal and professional lives of users.
</details>

## 2016

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Beyond Binary Program Transformation** [[link]](http://www.csl.sri.com/users/gehani/papers/FEAST-2016.Beyond.pdf) 

<details> 
Describe a number of program transformation and analysis tools developed at SRI to tackle bloatware from three angles:  slicing binaries to exclude unnecessary components, transformation of different copies of the same binary to create diversity and reduce the potential impact of an attack, and verification-based super-optimization to prune unreachable code and harden vulnerable code.
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Feature-based Software Customization: Preliminary Analysis, Formalization, and Methods** [[link]](https://faculty.ist.psu.edu/wu/papers/jcut-hase2016.pdf) 

<details> 
Proposes an approach to customizing Java bytecode by applying static dataflow analysis and enhanced programming slicing technique. This approach allows developers to customize Java programs based on various users' requirements or remove unnecessary features from tangled code in legacy projects. We evaluate our approach by conducting case studies on removing cross cutting features from real world Java programs. The results show that our approach has the potential for practical use. Additionally, we find out that, by increasing the diversity of the software, our approach can help achieve moving target defense.  Associated PhD thesis: [[link]](https://faculty.ist.psu.edu/wu/papers/YufeiJiang-dissertation.pdf).
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **JRed: Program Customization and Bloatware Mitigation Based on Static Analysis** [[link]](https://faculty.ist.psu.edu/wu/papers/jred-compsac16.pdf) 
 
<details> 
 Proposes the JRed tool, which is built on top of the Soot framework to trim unused code from both Java applications and JRE automatically. It uses SPARK, a flexible points-to analysis framework for Java, to facilitate call graph construction. Evaluation was conducted using the DaCapo benchmark according to various criteria: code size, code complexity, memory footprint, execution and garbage collection time, and security. The experimental results show that, Java application size can be reduced by 44.5% on average and the JRE code can be reduced by more than 82.5% on average. The code complexity is significantly reduced according to a set of well-known metrics. Furthermore, we report that by trimming redundant code, 48.6% of the known security vulnerabilities in the Java Runtime Environment JRE 6 update 45 has been removed. 
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Modernizing Hierarchical Delta Debugging** [[link]](http://www.inf.u-szeged.hu/~akiss/pub/pdf/hodovan2016hdd.pdf) 

<details> 
Use extended context-free grammars (ANTLRv4) to improve the peformance of HDD. The tool, called [Picireny](https://github.com/renatahodovan/picireny), supports the outlined ideas:  the reduced outputs are significantly smaller (by circa 25–40%) on  the  investigated  test  cases  than  those  produced  by  the reference HDD implementation using standard context-free grammars.   These  results,  together  with  the  technical  improvements  that  ease  the  use  of  the  modernized  tool,  can hopefully  help  spreading  the  adaptation  of  HDD  in  practice.
</details>

## 2015

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Removing the Kitchen Sink from Software** [[link]](http://delivery.acm.org/10.1145/2770000/2768424/p833-landsborough.pdf?ip=130.229.163.233&id=2768424&acc=ACTIVE%20SERVICE&key=74F7687761D7AE37%2EE53E9A92DC589BF3%2E4D4702B0C3E38B35%2E4D4702B0C3E38B35&__acm__=1542119391_5fa32bf18a2ab2634cc78a1676b97eff) 

<details> 
Propose to approaches to trimming software. The first one removes specific program features using dynamic tracing as a guide. This approach is safer than many alternatives, but is limited to removing code which is reachable in a trace when an undesirable feature is enabled. The second approach uses a genetic algorithm (GA) to mutate a program until a suitable variant is found.  This approach can potentially remove any code that is not strictly required for proper execution, but may break program semantics in unpredictable ways.  
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Automated Software Winnowing** [[link]](http://www.csl.sri.com/users/gehani/papers/SAC-2015.Winnow.pdf) 

<details> 
Propose winnowing, a static analysis and code specialization technique that uses partial evaluation. The process preserves the normal semantics of the original program – that is, any valid execution of the original program on specified inputs is preserved in its winnowed form. Invalid executions, such as those involving buffer overflows, may be executed differently. We also describe OCCAM, a tool that implements the techniques and present an experimental evaluation of its effectiveness.
</details>


## 2013

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Combining  Concern  Input  with  Program Analysis  for  Bloat  Detection** [[link]](http://www.csa.iisc.ernet.in/~cplse/papers/gopi-oopsla-13-1.pdf) 

<details> 
Introduce  the  use  of  concern  information (feature information) in program analysis tasks and demonstrated its application  in  estimating  the  propensity for  execution  bloat  of optional  concerns  in  Java  programs. The objective is to answer questions such as (1) whether a given set of optional features could lead to execution bloat and (2) which particular statements are the likely sources of bloat when those features are not required.
</details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **A Bloat-Aware Design for Big Data Applications** [[link]](https://asterix.ics.uci.edu/pub/issm13.pdf) 

<details> 
Proposes a bloat-aware design paradigm towards the development of efficient and scalable Big Data applications in object-oriented GC enabled languages.It points out that the negative impact on performance caused by bloatware is being amplified by today’s big-data software usage nature. Perform a study on the impact of several typical memory bloat patterns. Investigate two data-intensive applications: Giraph and Hive.
</details>

## 2012

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Does Lean Imply Green? A Study of the Power Performance Implications of Java Runtime Bloat** [[link]](http://www.csa.iisc.ernet.in/~cplse/papers/gopi-sigmetrics-12-3.pdf) 

 <details> 
Conducts  the  first  systematic  experimental  study  of the  joint  power  performance  implications  of  bloat  across a  range  of  hardware  and  software  configurations  on  modern server platforms.  The study employs controlled experiments to expose different effects of a common type of Java runtime bloat, excess temporary objects, in the context of the  SPECPower ssj2008  workload. 
 </details>

## 2011

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Manipulating Program Functionality to Eliminate Security Vulnerabilities** [[link]](https://people.csail.mit.edu/rinard/paper/movingtarget11.pdf)
 
 <details> 
 Present several mechanisms that can either excise or change system functionality in ways that may 1) eliminate security vulnerabilities while 2) enabling the system to continue to deliver acceptable service.
 </details>

![Custom badge](https://img.shields.io/badge/-JOURNAL_ARTICLE-C32B72.svg) **"Slimming" a Java virtual machine by way of cold code removal and optimistic partial program loading** [[link]](https://core.ac.uk/download/pdf/81975659.pdf) 

<details> 
Present a method to mitigate the bloatware problem in "always connected" embedded devices. Specifically, by storing the library code in a remote server. The classes that are needed will be downloaded on demand. In addition, by applying some more sophisticated analysis, some library code can be downloaded in advance before they are actually executed to improve the performance.
</details>

![Custom badge](https://img.shields.io/badge/-JOURNAL_ARTICLE-C32B72.svg) **Reuse, Recycle to De-bloat Software** [[link]](https://www.researchgate.net/publication/221496304_Reuse_Recycle_to_De-bloat_Software)
 
 <details> 
 Describes a novel algorithm that detects bloat caused by the creation of temporary container and String objects within a loop. The analysis determines which objects created within a loop can be reused. Then it describes a source-to-source transformation that efficiently reuses such objects. Empirical evaluation indicates that our solution can reduce up to 40% of temporary object allocations in large programs, resulting in a performance improvement that can be as high as a 20% reduction in the run time, specifically when a program has a high churn rate or when the program is memory intensive and needs to run the GC often.
 </details>

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Software Bloat and Wasted Joules: Is Modularity a Hurdle to Green Software?** [[link]](https://ieeexplore.ieee.org/document/6017179) 

<details> 
The paper discusses that adopting an integrated analysis of software bloat and hardware platforms is necessary to realizing modular software that's also green.
</details>

## 2010

![Custom badge](https://img.shields.io/badge/-CONFERENCE_PAPER-196CA3.svg) **Software Bloat Analysis: Finding, Removing, and Preventing Performance Problems in Modern Large-Scale Object-Oriented Applications** [[link]](http://web.cse.ohio-state.edu/presto/pubs/foser10.pdf) 
 
<details> 
 Describes software bloat, an emerging problem that has increasingly negative impact on large-scale object-oriented applications. It is argued that it is essentially a software engineering problem, and it is time for the SE community to start contributing new solutions for it. The paper survey some of the existing work on bloat analysis, describe challenges, and outline some promising future directions. The authors believe that there are larger opportunities than ever before for the SE community to make software more efficient, and this can happen entirely at the application level, without the help of ever-increasing hardware capabilities.
</details>
 
 
## 2006

![Custom badge](https://img.shields.io/badge/-JOURNAL_ARTICLE-C32B72.svg) **HDD: Hierarchical Delta Debugging** [[link]](https://www.eecs.northwestern.edu/~robby/courses/395-495-2009-fall/hdd.pdf) 

<details> 
Present HDD, a simple but effective algorithm that significantly speeds up Delta Debugging and increases its output quality on tree structured inputs such as XML. Instead of treating the inputs as one flat atomic lis, HDD applies DD to the very structure of the data, from the coarsest to the finest levels. This approach allows to pruene the large irrelevant portions of the input early.
</details>

## 2002

![Custom badge](https://img.shields.io/badge/-JOURNAL_ARTICLE-C32B72.svg) **Simplifying and Isolating Failure-Inducing Input** [[link]](https://www.cs.purdue.edu/homes/xyzhang/fall07/Papers/delta-debugging.pdf) 

<details> 
This paper is the state-of-the-art publication of the Delta Debugging (DD) algorithm. DD aims to generalice and simplify some failing test case to a minimal test case that still produces the failure; it also isolates the difference between a passing and a failing test case. Mozilla web browser is used as a use case. The algorithm is applied to find failure-inducing parts in the program invocation (GCC options), in the program input (GCC, fuzz, and Mozilla input), and in the sequence of user interactions (Mozilla user actions).
</details>

## External web resources

- [https://catless.ncl.ac.uk/Risks/30/84/#subj25](https://catless.ncl.ac.uk/Risks/30/84/#subj25)
- [http://tonsky.me/blog/disenchantment/](http://tonsky.me/blog/disenchantment/)
- [https://bulldogjob.com/news/400-feature-creep](https://bulldogjob.com/news/400-feature-creep)
- [IEE Software: Code Inflation](https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=7057573)
- [IEE Software: Four Trends Leading to Java Runtime Bloat](https://ieeexplore.ieee.org/document/5370764)
- [Smallest x86 ELF Hello World](http://timelessname.com/elfbin/)
- [Wikipedia's JavaScript initialisation on a budget](https://phabricator.wikimedia.org/phame/post/view/175/wikipedia_s_javascript_initialisation_on_a_budget/)
- [Don't Put Fat Jars in Docker Images](https://phauer.com/2019/no-fat-jar-in-docker-image/)
- [Hello world](https://drewdevault.com/2020/01/04/Slow.html)
- [Following up on "Hello world" ](https://drewdevault.com/2020/01/08/Re-Slow.html)
- [Building a self-contained game in C# under 8 kilobytes](https://medium.com/@MStrehovsky/building-a-self-contained-game-in-c-under-8-kilobytes-74c3cf60ea04)