---
permalink: software-debloating-papers.html
layout: page
title: Software debloating papers
subtitle: Living literature review
image: ../../blog/img/debloating.png 
---

This is a [living review](https://en.wikipedia.org/wiki/Living_review) of articles related to program debloating and software specialization. 

## Contents

* [2020](#2020)
* [2019](#2019)
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
* [External resources](#external-resources)

### 2020

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [NIER] **Program Debloating via Stochastic Optimization** [[link]]() 

<details> 
Programs tend to provide a broad range of features, and different typologies of users tend to use only a subset of these features. For this reason, and because unnecessary functionality can be harmful in terms of both performance and security, recently we have witnessed an increasing interest in debloating techniques—techniques for reducing the size of a program by eliminating (possibly) unneeded features. Most existing debloating techniques tend to focus on program-size reduction alone, by producing a reduced program that behaves correctly for a provided set of inputs. Although effective with respect to their stated goal, these approaches ignore other important aspects of debloating and ultimately solve a simplified formulation of the problem. We believe that program debloating is a multifaceted issue, in which different, possibly conflicting goals must be considered and suitably accounted for. In this spirit, we propose a general approach that allows for formulating program debloating as a multi-objective optimization problem. Given a program to be debloated, our approach lets users specify (1) a usage profile for the program (i.e., a set of inputs with associated usage probabilities), (2) the factors of interest for the debloating task at hand, and (3) the relative importance of these factors. Based on this information, the approach defines a suitable objective function, so as to be able to associate a score to every possible reduced program, and tries to generate an optimal solution, that is, one that maximizes the objective function. To provide concrete evidence of the usefulness of our approach, we also present and evaluate Debop, a specific instance of the approach that considers three objectives: size reduction, attack surface reduction, and generality (i.e., extent to which the reduced program behaves correctly for the inputs in p’s usage profile). Our results, albeit still preliminary, are promising, in that they show that our approach can be effective in generating debloated programs that achieve good trade-offs between the different factors involved in the debloating process. Our results also provide insights on the performance of our general approach when compared to a specialized single-goal technique.
</details>


<img alt="" title="Journal Articles" src="https://dblp.uni-trier.de/img/n.png" style="background: #c32b72; width: 18px; height: 18px; padding-right: 18px"> [TOSEM] **Is Static Analysis Able to Identify Unnecessary Source Code?** [[link]](https://www.cqse.eu/publications/2020-unnecessary-code-tosem.pdf) 

<details> 
Grown software systems often contain code that is not necessary anymore. Such unnecessary code wastesresources during development and maintenance, for example, when preparing code for migration or certifi-cation. Running a profiler may reveal code that is not used in production, but it is often time-consuming toobtain representative data in this way.

We investigate to what extent a static analysis approach, which is based on code stability and code centrality,is able to identify unnecessary code and whether its recommendations are relevant in practice. To study thefeasibility and usefulness of our approach, we conducted a study involving 14 open-source and closed-sourcesoftware systems. As there is no perfect oracle for unnecessary code, we compared recommendations forunnecessary code with historical cleanups, runtime usage data, and feedback from 25 developers of fivesoftware projects. Our study shows that recommendations generated from stability and centrality informationpoint to unnecessary code that cannot be identified by dead code detectors. Developers confirmed that 34%of recommendations were indeed unnecessary and deleted 20% of the recommendations shortly after ourinterviews. Overall, our results suggest that static analysis can provide quick feedback on unnecessary codeand is useful in practice
</details>


<img alt="" title="Journal Articles" src="https://dblp.uni-trier.de/img/n.png" style="background: #c32b72; width: 18px; height: 18px; padding-right: 18px"> [TSE] **MoMIT: Porting a JavaScript Interpreter on a Quarter Coin** [[link]](https://www-computer-org.focus.lib.kth.se/csdl/journal/ts/5555/01/08966499/1gNELA0WeCA) 

<details> 
The Internet of Things (IoT) is a network of physical, connected devices providing services through private networks and the Internet. The devices connect through the Internet to Web servers and other devices. One of the popular programming languages for communicating Web pages and Web apps is JavaScript (JS). Hence, the devices would benefit from JS apps. However, porting JS apps to the many IoT devices, e.g., System-on-a-Chip (SoCs) devices (e.g., Arduino Uno), is challenging because of their limited memory, storage, and CPU capabilities. Also, some devices may lack hardware/software capabilities for running JS apps "as is". Thus, we propose MoMIT, a multiobjective optimization approach to miniaturize JS apps to run on IoT devices. We implement MoMIT using three different search algorithms. We miniaturize a JS interpreter and measure the characteristics of 23 apps before/after applying MoMIT. We find reductions of code size, memory usage, and CPU time of 31%, 56%, and 36%, respectively (medians). We show that MoMIT allows apps to run on up to two additional devices in comparison to the original JS interpreter.
</details>

### 2019 


<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [USENIX]  **Less is More: Quantifying the Security Benefits of Debloating Web Applications** [[link]](https://www.usenix.org/system/files/sec19-azad.pdf) 

<details> 
As software becomes increasingly complex, its attack surface expands enabling the exploitation of a wide range of vulnerabilities. Web applications are no exception since modern HTML5 standards and the ever-increasing capabilities of JavaScript are utilized to build rich web applications, often subsuming the need for traditional desktop applications. One possible way of handling this increased complexity is through the process of software debloating, i.e., the removal not only of dead code but also of code corresponding to features that a specific set of users do not require. Even though debloating has been successfully applied on operating systems, libraries, and compiled programs, its applicability on web applications has not yet been investigated.

In this paper, we present the first analysis of the security benefits of debloating web applications. We focus on four popular PHP applications and we dynamically exercise them to obtain information about the server-side code that executes as a result of client-side requests. We evaluate two different debloating strategies (file-level debloating and function-level debloating) and we show that we can produce functional web applications that are 46% smaller than their original versions and exhibit half their original cyclomatic complexity. Moreover, our results show that the process of debloating removes code associated with tens of historical vulnerabilities and further shrinks a web application's attack surface by removing unnecessary external packages and abusable PHP gadgets.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [FEAST]  **Bloat Factors and Binary Specialization** [[link]](https://dl.acm.org/doi/10.1145/3338502.3359765) 

<details> 
Code bloating in software has been proven to be pervasive in recent research. However, each study provides a different approach to measure bloat. In this paper, we propose a system of metrics to effectively quantify bloat in binaries called bloat factors. Subsequently, we conducted an extensive study to calculate bloat factors for over 3000 Linux applications and 896 shared libraries. Using these metrics as pointers, we introduce a static approach to perform debloating for closed-source binaries by creating corresponding specialized versions to cater for a specific program requirements. We evaluated our debloating technique on large programs and achieved a maximum code reduction of 19.7%.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [DIMVA]  **BinTrimmer: Towards Static Binary Debloating Through Abstract Interpretation** [[link]](https://www.springerprofessional.de/en/bintrimmer-towards-static-binary-debloating-through-abstract-int/16785644) 

<details> 
The increasing complexity of modern programs motivates software engineers to often rely on the support of third-party libraries. Although this practice allows application developers to achieve a compelling time-to-market, it often makes the final product bloated with conspicuous chunks of unused code. Other than making a program unnecessarily large, this dormant code could be leveraged by willful attackers to harm users. As a consequence, several techniques have been recently proposed to perform program debloating and remove (or secure) dead code from applications. However, state-of-the-art approaches are either based on unsound strategies, thus producing unreliable results, or pose too strict assumptions on the program itself.
In this work, we propose a novel abstract domain, called Signedness-Agnostic Strided Interval, which we use as the cornerstone to design a novel and sound static technique, based on abstract interpretation, to reliably perform program debloating. Throughout the paper, we detail the specifics of our approach and show its effectiveness and usefulness by implementing it in a tool, called BinTrimmer, to perform static program debloating on binaries.
Our evaluation shows that BinTrimmer can remove up to 65.6% of a library’s code and that our domain is, on average, 98% more precise than the related work.
</details>


<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [ICSE]  **Poster: Recommending Unnecessary Source Code Based on Static Analysis** [[link]](https://dl-acm-org.focus.lib.kth.se/doi/10.1109/ICSE-Companion.2019.00111) 

<details> 
Grown software systems often contain code that is not necessary anymore. Unnecessary code wastes resources during development and maintenance, for example, when preparing code for migration or certification. Running a profiler may reveal code that is not used in production, but it is often time-consuming to obtain representative data this way. We investigate to what extent a static analysis approach which is based on code stability and code centrality, is able to identify unnecessary code and whether its recommendations are relevant in practice. To study the feasibility and usefulness of our static approach, we conducted a study involving 14 open-source and closed-source software systems. As there is no perfect oracle for unnecessary code, we compared recommendations of our approach with historical cleanup actions, runtime usage data, and feedback from 25 developers of 5 software projects. Our study shows that recommendations generated from stability and centrality information point to unnecessary code. Our results suggest that static analysis can provide quick feedback on unnecessary code that is useful in practice.
</details>


<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [WWW]  **Unnecessarily identifiable: Quantifying the fingerprintability of browser extensions due to bloat** [[link]](http://dl.acm.org/citation.cfm?doid=3308558.3313458) 

<details> 
In this paper, we investigate to what extent the page modifications that make browser extensions fingerprintable are necessary for their operation. We characterize page modifications that are completely unnecessary for the extension's functionality as extension bloat. By analyzing 58,034 extensions from the Google Chrome store, we discovered that 5.7% of them were unnecessarily identifiable because of extension bloat. To protect users against unnecessary extension fingerprinting due to bloat, we describe the design and implementation of an in-browser mechanism that provides coarse-grained access control for extensions on all websites. The proposed mechanism and its built-in policies, does not only protect users from fingerprinting, but also offers additional protection against malicious extensions exfiltrating user data from sensitive websites.
</details>


<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [arXiv]  **Binary Debloating for Security via Demand Driven Loading** [[link]](http://arxiv.org/abs/1902.06570) 

<details> 
Modern software systems heavily use C/C++ based libraries. Because of the weak memory model of C/C++, libraries may suffer from vulnerabilities which can expose the applications to potential attacks. For example, a very large number of return oriented programming gadgets exist in glibc that allow stitching together semantically valid but malicious Turing-complete programs. In spite of significant advances in attack detection and mitigation, full defense is unrealistic against an ever-growing set of possibilities for generating such malicious programs. In this work, we create a defense mechanism by debloating libraries to reduce the dynamic functions linked so that the possibilities of constructing malicious programs diminishes significantly. The key idea is to locate each library call site within an application, and in each case to load only the set of library functions that will be used at that call site. This approach of demand-driven loading relies on an input-aware oracle that predicts a near-exact set of library functions needed at a given call site during the execution. The predicted functions are loaded just in time, and the complete call chain (of function bodies) inside the library is purged after returning from the library call back into the application. We present a decision-tree based predictor, which acts as an oracle, and an optimized runtime system, which works directly with library binaries like GNU libc and libstdc++. We show that on average, the proposed scheme cuts the exposed code surface of libraries by 97.2%, reduces ROP gadgets present in linked libraries by 97.9%, achieves a prediction accuracy in most cases of at least 97%, and adds a small runtime overhead of 18% on all libraries (16% for glibc, 2% for others) across all benchmarks of SPEC 2006, suggesting this scheme is practical.
</details>


<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [USENIX]  **Is Less Really More? Towards Better Metrics for Measuring Security Improvements Realized Through Software Debloating** [[link]](http://arxiv.org/abs/1902.10880) 

<details> 
Nearly all modern software suffers from bloat that negatively impacts its performance and security. To combat this problem, several automated techniques have been proposed to debloat software. A key metric used in these works to demonstrate improved security is code reuse gadget count reduction. The use of this metric is based on the prevailing idea that reducing the number of gadgets available in a software package reduces its attack surface and makes mounting a gadget-based code reuse exploit such as return-oriented programming (ROP) more difficult for an attacker. In this paper, we challenge this idea and show through a variety of realistic debloating scenarios the flaws inherent to the gadget count metric. Specifically, we demonstrate that software debloating can achieve high gadget count reduction rates, yet fail to limit an attacker's ability to construct an exploit. Worse yet, in some scenarios high gadget count reduction rates conceal instances in which software debloating makes security worse by introducing new quality gadgets. To address these issues, we propose new metrics based on quality rather than quantity for assessing the security impact of software debloaitng. We show that these metrics can be efficiently calculated with our Gadget Set Analyzer tool. Finally, we demonstrate the the utility of these metrics through a realistic debloating case study.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [EuroSec]  **Configuration-Driven Software Debloating** [[link]](http://dl.acm.org/citation.cfm?doid=3301417.3312501) 

<details> 
With legitimate code becoming an attack surface due to the proliferation of code reuse attacks, software debloating is an effective mitigation that reduces the amount of instruction sequences that may be useful for an attacker, in addition to eliminating potentially exploitable bugs in the removed code. Existing debloating approaches either statically remove code that is guaranteed to not run (e.g., non-imported functions from shared libraries), or rely on profiling with realistic workloads to pinpoint and keep only the subset of code that was executed.
In this work, we explore an alternative configuration-driven software debloating approach that removes feature-specific code that is exclusively needed only when certain configuration directives are specified---which are often disabled by default. Using a semi-automated approach, our technique identifies libraries solely needed for the implementation of a particular functionality and maps them to certain configuration directives. Based on this mapping, feature-specific libraries are not loaded at all if their corresponding directives are disabled. The results of our experimental evaluation with Nginx, VSFTPD, and OpenSSH show that using the default configuration in each case, configuration-driven debloating can remove 77% of the code for Nginx, 53% for VSFTPD, and 20% for OpenSSH, which represent a significant attack surface reduction.
</details>


<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [arXiv]  **Trimming Mobile Applications for Bandwidth-Challenged Networks in Developing Regions** [[link]](https://arxiv.org/pdf/1912.01328.pdf) 

<details> 
Despite continuous efforts to build and update network infrastructure, mobile devices in developing regions continue to be constrained by limited bandwidth. Unfortunately, this coincides with a period of unprecedented growth in the size of mobile applications. Thus it is becoming prohibitively expensive for users in developing regions to download and update mobile apps critical to their economic and educational development. Unchecked, these trends can further contribute to a large and growing global digital divide.
Our goal is to better understand the source of this rapid growth in mobile app code size, whether it is reflective of new functionality, and identify steps that can be taken to make existing mobile apps more friendly bandwidth constrained mobile networks. We hypothesize that much of this growth in mobile apps is due to poor resource/code management, and do not reflect proportional increases in functionality. Our hypothesis is partially validated by mini-programs, apps with extremely small footprints gaining popularity in Chinese mobile networks. Here, we use functionally equivalent pairs of mini-programs and Android apps to identify potential sources of "bloat," inefficient uses of code or resources that contribute to large package sizes. We analyze a large sample of popular Android apps and quantify instances of code and resource bloat. We develop techniques for automated code and resource trimming, and successfully validate them on a large set of Android apps. We hope our results will lead to continued efforts to streamline mobile apps, making them easier to access and maintain for users in developing regions.
</details>


<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [CCS]  **Binary Control-Flow Trimming** [[link]](https://dl.acm.org/doi/10.1145/3319535.3345665) 

<details> 
A new method of automatically reducing the attack surfaces of binary software is introduced, affording code consumers the power to remove features that are unwanted or unused in a particular deployment context. The approach targets stripped binary native code with no source-derived metadata or symbols, can remove semantic features irrespective of whether they were intended and/or known to code developers, and anticipates consumers who can demonstrate desired features (e.g., via unit testing), but who may not know the existence of specific unwanted features, and who lack any formal specifications of the code's semantics. Through a combination of runtime tracing, machine learning, in-lined reference monitoring, and contextual control-flow integrity enforcement, it is demonstrated that automated code feature removal is nevertheless feasible under these constraints, even for complex programs such as compilers and servers. The approach additionally accommodates consumers whose demonstration of desired features is incomplete; a tunable entropy-based metric detects coverage lapses and conservatively preserves unexercised but probably desired flows. A prototype implementation for Intel x86-64 exhibits low runtime overhead for trimmed binaries (about 1.87%), and case studies show that consumer-side control-flow trimming can successfully eliminate zero-day vulnerabilities.
</details>

<img alt="" title="Journal Articles" src="https://dblp.uni-trier.de/img/n.png" style="background: #c32b72; width: 18px; height: 18px; padding-right: 18px"> [JSS]   **Slimming javascript applications: An approach for removing unused functions from javascript libraries** [[link]](https://www.sciencedirect.com/science/article/abs/pii/S0950584918302210) 

<details> 
Context: A common practice in JavaScript development is to ship and deploy an application as a large file, called bundle, which is the result of combining the application code along with the code of all the libraries the application depends on. Despite the benefits of having a single bundle per application, this approach leads to applications being shipped with significant portions of code that are actually not used, which unnecessarily inflates the JavaScript bundles and could slow down website loading because of the extra unused code. Although some static analysis techniques exist for removing unused code, our investigations suggest that there is still room for improvements. Objective: The goal of this paper is to address the problem of reducing the size of bundle files in JavaScript applications. Method: In this context, we define the notion of Unused Foreign Function (UFF) to denote a JavaScript function contained in dependent libraries that is not needed at runtime. Furthermore, we propose an approach based on dynamic analysis that assists developers to identify and remove UFFs from JavaScript bundles. Results: We report on a case-study performed over 22 JavaScript applications, showing evidence that our approach can produce size reductions of 26% on average (with reductions going up to 66% in some applications). Conclusion: It is concluded that removing unused foreign functions from JavaScript bundles helps reduce their size, and thus, it can boost the results of existing static analysis techniques.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [arXiv]  **PolyDroid: Learning-Driven Specialization of Mobile Applications** [[link]](http://arxiv.org/abs/1902.09589) 

<details> 
The increasing prevalence of mobile apps has led to a proliferation of resource usage scenarios in which they are deployed. This motivates the need to specialize mobile apps based on diverse and varying preferences of users. We propose a system, called PolyDroid, for automatically specializing mobile apps based on user preferences. The app developer provides a number of candidate configurations, called reductions, that limit the resource usage of the original app. The key challenge underlying PolyDroid concerns learning the quality of user experience under different reductions. We propose an active learning technique that requires few user experiments to determine the optimal reduction for a given resource usage specification. On a benchmark suite comprising 20 diverse, open-source Android apps, we demonstrate that on average, PolyDroid obtains more than 85% of the optimal performance using just two user experiments.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [arXiv]  **The Dynamics of Software Composition Analysis** [[link]](https://arxiv.org/pdf/1909.00973.pdf) 

<details> 
Developers today use significant amounts of open source code, surfacing the need for ways to automatically audit and upgrade library dependencies and leading to the emergence of Software Composition Analysis (SCA). SCA products are concerned with three tasks: discovering dependencies, checking the reachability of vulnerable code for false positive elimination, and automated remediation. The latter two tasks rely on call graphs of library and application code to check whether vulnerable methods found in the open source components are called by applications. However, statically-constructed call graphs introduce both false positives and false negatives on real-world projects. In this paper, we develop a novel, modular means of combining statically- and dynamically-constructed call graphs via instrumentation to improve the performance of false positive elimination. Our experiments indicate significant performance improvements, but that instrumentation-based call graphs are less readily applicable in practice.
</details>


<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [FSE]  **Binary reduction of dependency graphs** [[link]](https://dl.acm.org/doi/10.1145/3338906.3338956) 

<details> 
Delta debugging is a technique for reducing a failure-inducing input to a small input that reveals the cause of the failure. This has been successful for a wide variety of inputs including C programs, XML data, and thread schedules. However, for input that has many internal dependencies, delta debugging scales poorly. Such input includes C#, Java, and Java bytecode and they have presented a major challenge for input reduction until now. In this paper, we show that the core challenge is a reduction problem for dependency graphs, and we present a general strategy for reducing such graphs. We combine this with a novel algorithm for reduction called Binary Reduction in a tool called J-Reduce for Java bytecode. Our experiments show that our tool is 12x faster and achieves more reduction than delta debugging on average. This enabled us to create and submit short bug reports for three Java bytecode decompilers.
</details>


<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [USENIX]  **RAZOR : A Framework for Post-deployment Software Debloating** [[link]](https://www.usenix.org/conference/usenixsecurity19/presentation/qian) 

<details> 
Commodity software typically includes functionalities for a broad user population. However, each individual user usually only needs a subset of the supported functionalities. The bloated code not only hinders optimal execution, but also leads to a larger attack surface. Recent work explores program debloating as an emerging solution to this problem. Unfortunately, existing works require program source code, limiting their deployability. In this paper, we propose a practical debloating framework, RAZOR, that performs code reduction for deployed binaries. Based on users’ specification, our tool customizes the binary to generate a functional program with the minimal code size. Instead of only supporting given test cases, RAZOR takes several control-flow heuristics to infer complementary code that are necessary to support user-expected functionalities. We have evaluated RAZOR on commonly used benchmarks and real-world applications, including the web browser FireFox and the close-sourced PDF reader FoxitReader. The result shows that RAZOR is able to reduce over 70% of the code from the bloated binary. It produces functional programs and does not introduce new security issues. RAZOR is thus a practical framework for debloating real-world programs.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [FEAST]  **CARVE: Practical Security-Focused Software Debloating Using Simple Feature Set Mappings** [[link]](https://arxiv.org/pdf/1907.02180.pdf) 

<details> 
Software debloating is an emerging field of study aimed at improving the security and performance of software by removing excess library code and features that are not needed by the end user (called bloat). Software bloat is pervasive, and several debloating techniques have been proposed to address this problem. While these techniques are effective at reducing bloat, they are not practical for the average user, risk creating unsound programs and introducing vulnerabilities, and are not well suited for debloating complex software such as network protocol implementations. In this paper, we propose CARVE, a simple yet effective security-focused debloating technique that overcomes these limitations. CARVE employs static source code annotation to map software features source code, eliminating the need for advanced software analysis during debloating and reducing the overall level of technical sophistication required by the user. CARVE surpasses existing techniques by introducing debloating with replacement, a technique capable of preserving software interoperability and mitigating the risk of creating an unsound program or introducing a vulnerability. We evaluate CARVE in 12 debloating scenarios and demonstrate security and performance improvements that meet or exceed those of existing techniques.
</details>


## 2018

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [SALAD]  **Fine-Grained Library Customization** [[link]](https://arxiv.org/pdf/1810.11128.pdf) 

<details> 
Conduct a case study to understand the impact of code bloat in production-run software by analysing statically linked libraries. Leverage dependence analysis to trim the resultless code statements residing in a target library
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [USENIX] **Debloating Software through Piece-Wise Compilation and Loading** [[link]](https://www.usenix.org/system/files/conference/usenixsecurity18/sec18-quach.pdf) 

<details> 
Introduce  a  generic  inter-modular late-stage debloating framework.  It combines static (i.e., compile-time) and  dynamic  (i.e.,  load-time)  approaches  to  systematically  detect  and  automatically  eliminate  unused  code from program memory.  This can be thought of as a runtime extension to dead code elimination. Unused code is identified and removed by introducing a piece-wise compiler that  not  only  compiles  code  modules  (executables,  shared  and  static  objects),  but  also generates a dependency graph that retains all compiler knowledge  on which function  depends  on what other function(s).
</details>

<img alt="" title="Journal Articles" src="https://dblp.uni-trier.de/img/n.png" style="background: #c32b72; width: 18px; height: 18px; padding-right: 18px"> [IST] **Slimming javascript applications: An approach for removing unused functions from javascript libraries** [[link]](https://www.sciencedirect.com/science/article/abs/pii/S0950584918302210)  

<details> 
Define the notion of Unused Foreign Function (UFF) to denote a JavaScript function contained in dependent libraries that is not needed at runtime. Also propose an approach based on dynamic analysis that assists developers to identify and remove UFFs from JavaScript bundles. The results show a reduction of JavaScript bundles of 26%. 
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [ASE] **TRIMMER: Application Specialization for Code Debloating** [[link]](http://www.csl.sri.com/users/gehani/papers/ASE-2018.Trimmer.pdf) 

<details> 
Proposes Trimmer, an application specialization tool that leverages user-provided configuration data to specialize an application to its deployment context. The specialization process attempts to eliminate the application functionality that is unused in the user-defined context. 
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [ISSRE] **RedDroid: Android Application Redundancy Customization Based on Static Analysis** [[link]](https://faculty.ist.psu.edu/wu/papers/RedDroid-ISSRE2018.pdf) 

<details> 
The paper presents a comprehensive study of software bloat in Android applications, and categorize them into two types, compile-time  redundancy  and  install-time  redundancy. It also propose  a  static  analysis  based  approach  to  identifying and  removing  software  bloat  from  Android  applications.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [CCS] **Effective Program Debloating via Reinforcement Learning** [[link]](http://www.cis.upenn.edu/~mhnaik/papers/ccs18.pdf) 

<details> 
Uses reinforcement learning to improve Delta Debugging in terms of processing time by reducing the number of iterations necessary to remove redundant code. The approach aggressively removes redundant code even on the execution paths. The reduction is based on a test script with the specification of the functionalities that will be keep. The approach is implemented as a program reducer for C programs based on the syntax-guided Hierarchical Delta Debugging algorithm. The evaluation took into account the effectiveness, security and robustness of 10 reference programs from GNU packages.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [ICSE] **Perses: Syntax guided program reduction** [[link]](http://web.cs.ucdavis.edu/~su/publications/perses.pdf) 

<details> 
Reduces programs by exploiting the formal syntax of the program. Perses considers only smaller, syntactically valid variants to avoid  futile efforts on syntactically invalid variants. Evaluation was carried out using 20 C programs, and also Java applications.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [FMICS] **Wholly : A Build System For The Modern Software Stack** [[link]](http://www.csl.sri.com/users/gehani/papers/FMICS-2018.Wholly.pdf) 

<details> 
Wholly is designed for reproducible and verifiable builds of optimized and debloated software that runs uniformly on traditional desktops, the cloud, and IoT devices. Wholly  uses Linux containers to ensure the integrity and reproducibility of the build environment. It uses the clang compiler to generate
LLVM bitcode for all produced libraries and binaries to allow for whole program analysis, specialization, and optimization. 
</details>
                     
## 2017

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [FEAST] **A Multi-OS Cross-Layer Study of Bloating in User Programs, Kernel and Managed Execution Environments** [[link]](https://tc.gtisc.gatech.edu/feast17/papers/p65-quachA.pdf) 

<details> 
Presents a study of bloating across the software stack (user-level programs, OS kernels and JVM). Employs (1) static measurements to detect limits to debloating, and (2) dynamic measurements to detect how much of the code available to a program is utilized under typical payloads. It uses a tracing procedure in ato measure the bloat in kernel, measuring the amount of kernel code that executes during the boot process and during the execution of popular system calls. The results show that bloating is pervasive and severe. A significant fraction of code across the software stack is never executed and provides scope for debloating.
</details>


<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [FEAST] **DamGate: Dynamic Adaptative Multi-feature Gating in Program Binaries** [[link]](https://www2.seas.gwu.edu/~guruv/feast17.pdf) 

<details> 
Presents DamGate, a framework for dynamic feature customization, allowing vigilant management of program features at runtime to prevent violation of privacy and security policies. At the heart of this technique is the selective placement of checker functions (gates) into feature-constituent functions that need to be protected. Through execution gating and feature validation on the fly, DamGate provides differentiated control policy for program features and enables flexible runtime reconfiguration. The proposed framework is prototyped and evaluated using LibreOffice The evaluation results show that it can achieve desired feature customization with negligible gating overhead.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [FSE] **Cimplifier: Automatically Debloating Containers** [[link]](http://pages.cs.wisc.edu/~vrastogi/static/papers/rddjm17.pdf) 

<details> 
Propose a technique to debloating application containers running on Docker. They decompose a complicated container into multiple simpler containers with respect to a given user-defined constraint. Their technique is based on dynamic analysis to obtain information about application behaviors. The evaluation on real-world containers shows that this approachpreserves the original functionality, leads to reduction in image size of up to 95%, and processes even large containers in under thirty seconds.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [FEAST] **TOSS: Tailoring Online Server Systems through Binary Feature Customization** [[link]](https://www2.seas.gwu.edu/~tlan/papers/TOSS_FEAST_2018.pdf) 

<details> 
Propose an approach for automated customization of online servers and software systems, which are implemented using a client-server architecture based on the underlying network protocols. TOSS harnesses program tracing and tainting-guided symbolic execution to identify desired (feature-related) code from the original program binary, and apply static binary rewriting to remove redundant features and directly create customized program binary with only desired features. The evaluation was conducted in Mosquitto, TOSS was able to create a functional program binary with only desired features and significantly reduce potential attack surface by eliminating undesired protocol/program features.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [FSE] **Failure-Directed Program Trimming** [[link]](https://www.cs.utexas.edu/~isil/program-trimming.pdf) 

<details> 
Propose a program trimming technique that aims to reduce the number of execution paths while preserving safety. This allows any safety checker to be goal directed by pruning execution paths that cannot possibly result in an assertion violation.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [SPA] **Smartphone Bloatware: An Overlooked Privacy Problem** [[link]](https://link.springer.com/chapter/10.1007/978-3-319-72389-1_15) 

<details> 
Provide findings of a user-study that was conducted to investigate the practical utility of smarthphone bloatware in personal and professional lives of users.
</details>

## 2016

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [FEAST] **Beyond Binary Program Transformation** [[link]](http://www.csl.sri.com/users/gehani/papers/FEAST-2016.Beyond.pdf) 

<details> 
Describe a number of program transformation and analysis tools developed at SRI to tackle bloatware from three angles:  slicing binaries to exclude unnecessary components, transformation of different copies of the same binary to create diversity and reduce the potential impact of an attack, and verification-based super-optimization to prune unreachable code and harden vulnerable code.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [HASE] **Feature-based Software Customization: Preliminary Analysis, Formalization, and Methods** [[link]](https://faculty.ist.psu.edu/wu/papers/jcut-hase2016.pdf) 

<details> 
Proposes an approach to customizing Java bytecode by applying static dataflow analysis and enhanced programming slicing technique. This approach allows developers to customize Java programs based on various users' requirements or remove unnecessary features from tangled code in legacy projects. We evaluate our approach by conducting case studies on removing cross cutting features from real world Java programs. The results show that our approach has the potential for practical use. Additionally, we find out that, by increasing the diversity of the software, our approach can help achieve moving target defense.  Associated PhD thesis: [[link]](https://faculty.ist.psu.edu/wu/papers/YufeiJiang-dissertation.pdf).
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [COMPSAC] **JRed: Program Customization and Bloatware Mitigation Based on Static Analysis** [[link]](https://faculty.ist.psu.edu/wu/papers/jred-compsac16.pdf) 
 
<details> 
 Proposes the JRed tool, which is built on top of the Soot framework to trim unused code from both Java applications and JRE automatically. It uses SPARK, a flexible points-to analysis framework for Java, to facilitate call graph construction. Evaluation was conducted using the DaCapo benchmark according to various criteria: code size, code complexity, memory footprint, execution and garbage collection time, and security. The experimental results show that, Java application size can be reduced by 44.5% on average and the JRE code can be reduced by more than 82.5% on average. The code complexity is significantly reduced according to a set of well-known metrics. Furthermore, we report that by trimming redundant code, 48.6% of the known security vulnerabilities in the Java Runtime Environment JRE 6 update 45 has been removed. 
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [A-TEST] **Modernizing Hierarchical Delta Debugging** [[link]](http://www.inf.u-szeged.hu/~akiss/pub/pdf/hodovan2016hdd.pdf) 

<details> 
Use extended context-free grammars (ANTLRv4) to improve the peformance of HDD. The tool, called [Picireny](https://github.com/renatahodovan/picireny), supports the outlined ideas:  the reduced outputs are significantly smaller (by circa 25–40%) on  the  investigated  test  cases  than  those  produced  by  the reference HDD implementation using standard context-free grammars.   These  results,  together  with  the  technical  improvements  that  ease  the  use  of  the  modernized  tool,  can hopefully  help  spreading  the  adaptation  of  HDD  in  practice.
</details>

## 2015

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [GECCO] **Removing the Kitchen Sink from Software** [[link]](http://delivery.acm.org/10.1145/2770000/2768424/p833-landsborough.pdf?ip=130.229.163.233&id=2768424&acc=ACTIVE%20SERVICE&key=74F7687761D7AE37%2EE53E9A92DC589BF3%2E4D4702B0C3E38B35%2E4D4702B0C3E38B35&__acm__=1542119391_5fa32bf18a2ab2634cc78a1676b97eff) 

<details> 
Propose to approaches to trimming software. The first one removes specific program features using dynamic tracing as a guide. This approach is safer than many alternatives, but is limited to removing code which is reachable in a trace when an undesirable feature is enabled. The second approach uses a genetic algorithm (GA) to mutate a program until a suitable variant is found.  This approach can potentially remove any code that is not strictly required for proper execution, but may break program semantics in unpredictable ways.  
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [SAC] **Automated Software Winnowing** [[link]](http://www.csl.sri.com/users/gehani/papers/SAC-2015.Winnow.pdf) 

<details> 
Propose winnowing, a static analysis and code specialization technique that uses partial evaluation. The process preserves the normal semantics of the original program – that is, any valid execution of the original program on specified inputs is preserved in its winnowed form. Invalid executions, such as those involving buffer overflows, may be executed differently. We also describe OCCAM, a tool that implements the techniques and present an experimental evaluation of its effectiveness.
</details>


## 2013

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [FSE] **Cachetor: Detecting Cacheable Data to Remove Bloat** [[link]](http://web.cs.ucla.edu/~harryxu/papers/nguyen-fse13.pdf) 

<details> 
Modern object-oriented software commonly suffers from runtime bloat that significantly affects its performance and scalability. Studies have shown that one important pattern of bloat is the work repeatedly done to compute the same data values. Very often the cost of computation is very high and it is thus beneficial to memoize the invariant data values for later use. While this is a common practice in real-world development, manually finding invariant data values is a daunting task during development and tuning. To help the developers quickly find such optimization opportunities for performance improvement, we propose a novel run-time profiling tool, called Cachetor, which uses a combination of dynamic dependence profiling and value profiling to identify and report operations that keep generating identical data values. The major challenge in the design of Cachetor is that both dependence and value profiling are extremely expensive techniques that cannot scale to large, real-world applications for which optimizations are important. To overcome this challenge, we propose a series of novel abstractions that are applied to run-time instruction instances during profiling, yielding significantly improved analysis time and scalability. We have implemented Cachetor in Jikes Research Virtual Machine and evaluated it on a set of 14 large Java applications. Our experimental results suggest that Cachetor is effective in exposing caching opportunities and substantial performance gains can be achieved by modifying a program to cache the reported data. 
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [OOPSLA] **Combining  Concern  Input  with  Program Analysis  for  Bloat  Detection** [[link]](http://www.csa.iisc.ernet.in/~cplse/papers/gopi-oopsla-13-1.pdf) 

<details> 
Introduce  the  use  of  concern  information (feature information) in program analysis tasks and demonstrated its application  in  estimating  the  propensity for  execution  bloat  of optional  concerns  in  Java  programs. The objective is to answer questions such as (1) whether a given set of optional features could lead to execution bloat and (2) which particular statements are the likely sources of bloat when those features are not required.
</details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [ISMM] **A Bloat-Aware Design for Big Data Applications** [[link]](https://asterix.ics.uci.edu/pub/issm13.pdf) 

<details> 
Proposes a bloat-aware design paradigm towards the development of efficient and scalable Big Data applications in object-oriented GC enabled languages.It points out that the negative impact on performance caused by bloatware is being amplified by today’s big-data software usage nature. Perform a study on the impact of several typical memory bloat patterns. Investigate two data-intensive applications: Giraph and Hive.
</details>

## 2012

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [SIGMETRICS] **Does Lean Imply Green? A Study of the Power Performance Implications of Java Runtime Bloat** [[link]](http://www.csa.iisc.ernet.in/~cplse/papers/gopi-sigmetrics-12-3.pdf) 

 <details> 
Conducts  the  first  systematic  experimental  study  of the  joint  power  performance  implications  of  bloat  across a  range  of  hardware  and  software  configurations  on  modern server platforms.  The study employs controlled experiments to expose different effects of a common type of Java runtime bloat, excess temporary objects, in the context of the  SPECPower ssj2008  workload. 
 </details>
 
 <img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [WOOT] **Microgadgets: size does matter in turing-complete return-oriented programming** [[link]](https://dl-acm-org.focus.lib.kth.se/doi/10.5555/2372399.2372409) 
 
  <details> 
Return-oriented programming (ROP) has gained a lot of popularity lately, as an attack against currently implemented defenses in modern operating systems. Several kinds of ROP-based attacks and anti-ROP defenses have been proposed in recent years. The original attack technique depends on the existence of a hand-picked set of byte sequences (called gadgets) in the program, while subsequent approaches use complex scanners, which perform semantic analysis on the code to locate gadgets. The latter ones are efficient at finding gadgets and building an attack, but incur a significant cost in time.

We propose a ROP attack technique, based on a handpicked but flexible and Turing-complete set of gadgets. One novelty in this approach is the use of microgadgets, which are gadgets restricted to 2 or 3 bytes in length. Our approach splits gadgets into several classes of varying sizes (from 1 to more than 800). Only a single gadget from each class is required for Turing-completeness. The short length of the gadgets, as well as the large size of the classes, increase the likelihood of finding all required gadgets. We also describe an efficient scanner which locates these gadgets in a given program. We then use this scanner on the /usr/bin directories from several Linux distributions, to show that many programs indeed contain a Turing-complete set of microgadgets, which attackers can use to perform arbitrary computations.
  </details>

## 2011

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [?] **Manipulating Program Functionality to Eliminate Security Vulnerabilities** [[link]](https://people.csail.mit.edu/rinard/paper/movingtarget11.pdf)
 
 <details> 
 Present several mechanisms that can either excise or change system functionality in ways that may 1) eliminate security vulnerabilities while 2) enabling the system to continue to deliver acceptable service.
 </details>

<img alt="" title="Journal Articles" src="https://dblp.uni-trier.de/img/n.png" style="background: #c32b72; width: 18px; height: 18px; padding-right: 18px"> [SCP] **"Slimming" a Java virtual machine by way of cold code removal and optimistic partial program loading** [[link]](https://core.ac.uk/download/pdf/81975659.pdf) 

<details> 
Present a method to mitigate the bloatware problem in "always connected" embedded devices. Specifically, by storing the library code in a remote server. The classes that are needed will be downloaded on demand. In addition, by applying some more sophisticated analysis, some library code can be downloaded in advance before they are actually executed to improve the performance.
</details>

<img alt="" title="Journal Articles" src="https://dblp.uni-trier.de/img/n.png" style="background: #c32b72; width: 18px; height: 18px; padding-right: 18px"> [ECOOP] **Reuse, Recycle to De-bloat Software** [[link]](https://www.researchgate.net/publication/221496304_Reuse_Recycle_to_De-bloat_Software)
 
 <details> 
 Describes a novel algorithm that detects bloat caused by the creation of temporary container and String objects within a loop. The analysis determines which objects created within a loop can be reused. Then it describes a source-to-source transformation that efficiently reuses such objects. Empirical evaluation indicates that our solution can reduce up to 40% of temporary object allocations in large programs, resulting in a performance improvement that can be as high as a 20% reduction in the run time, specifically when a program has a high churn rate or when the program is memory intensive and needs to run the GC often.
 </details>

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [COMPUTER] **Software Bloat and Wasted Joules: Is Modularity a Hurdle to Green Software?** [[link]](https://ieeexplore.ieee.org/document/6017179) 

<details> 
The paper discusses that adopting an integrated analysis of software bloat and hardware platforms is necessary to realizing modular software that's also green.
</details>

## 2010

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [PLDI] **Detecting Inefficiently-Used Containers to Avoid Bloat** [[link]](http://web.cs.ucla.edu/~harryxu/papers/xu-pldi10b.pdf) 
 
<details> 
Runtime bloat degrades significantly the performance and scalability of software systems. An important source of bloat is the inefficient use of containers. It is expensive to create inefficiently used containers and to invoke their associated methods, as this may ultimately execute large volumes of code, with call stacks dozens deep,and allocate many temporary objects.This paper presents practical static and dynamic tools that can find inappropriate use of containers in Java programs. At the core of these tools is a base static analysis that identifies, for each container,the objects that are added to this container and the key statements(i.e., heap loads and stores) that achieve the semantics of common container operations such as ADD and GET. The static tool finds problematic uses of containers by considering the nesting relation-ships among the loops where these semantics-achieving statements are located, while the dynamic tool can instrument these statements and find
 inefficiencies by
 profiling their execution frequencies.The high precision of the base analysis is achieved by taking advantage of a context-free language (CFL)-reachability formulation of points-to analysis and by accounting for container-specific properties. It is demand-driven and client-driven, facilitating refinement specific to each queried container object and increasing scalability.The tools built with the help of this analysis can be used both to avoid the creation of container-related performance problems early during development, and to help with diagnosis when problems are observed during tuning. Our experimental results show that the static tool has a low false positive rate and produces more relevant information than its dynamic counterpart. Further case studies suggest that significant optimization opportunities can be found by focusing on statically-identified containers for which high allocation frequency is observed at run time.
</details>
 

<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [FOSER] **Software Bloat Analysis: Finding, Removing, and Preventing Performance Problems in Modern Large-Scale Object-Oriented Applications** [[link]](http://web.cse.ohio-state.edu/presto/pubs/foser10.pdf) 
 
<details> 
 Describes software bloat, an emerging problem that has increasingly negative impact on large-scale object-oriented applications. It is argued that it is essentially a software engineering problem, and it is time for the SE community to start contributing new solutions for it. The paper survey some of the existing work on bloat analysis, describe challenges, and outline some promising future directions. The authors believe that there are larger opportunities than ever before for the SE community to make software more efficient, and this can happen entirely at the application level, without the help of ever-increasing hardware capabilities.
</details>
 
 
## 2006

<img alt="" title="Journal Articles" src="https://dblp.uni-trier.de/img/n.png" style="background: #c32b72; width: 18px; height: 18px; padding-right: 18px"> [ICSE] **HDD: Hierarchical Delta Debugging** [[link]](https://www.eecs.northwestern.edu/~robby/courses/395-495-2009-fall/hdd.pdf) 

<details> 
Present HDD, a simple but effective algorithm that significantly speeds up Delta Debugging and increases its output quality on tree structured inputs such as XML. Instead of treating the inputs as one flat atomic lis, HDD applies DD to the very structure of the data, from the coarsest to the finest levels. This approach allows to pruene the large irrelevant portions of the input early.
</details>

## 2002

<img alt="" title="Journal Articles" src="https://dblp.uni-trier.de/img/n.png" style="background: #c32b72; width: 18px; height: 18px; padding-right: 18px"> [TSE] **Simplifying and Isolating Failure-Inducing Input** [[link]](https://www.cs.purdue.edu/homes/xyzhang/fall07/Papers/delta-debugging.pdf) 

<details> 
This paper is the state-of-the-art publication of the Delta Debugging (DD) algorithm. DD aims to generalice and simplify some failing test case to a minimal test case that still produces the failure; it also isolates the difference between a passing and a failing test case. Mozilla web browser is used as a use case. The algorithm is applied to find failure-inducing parts in the program invocation (GCC options), in the program input (GCC, fuzz, and Mozilla input), and in the sequence of user interactions (Mozilla user actions).
</details>


<img alt="" title="Conference and Workshop Papers" src="https://dblp.uni-trier.de/img/n.png" style="background: #196ca3; width: 18px; height: 18px"> [TPLS] **Practical extraction techniques for Java** [[link]](https://dl-acm-org.focus.lib.kth.se/doi/abs/10.1145/586088.586090) 

<details> 
Reducing application size is important for software that is distributed via the internet, in order to keep download times manageable, and in the domain of embedded systems, where applications are often stored in (Read-Only or Flash) memory. This paper explores extraction techniques such as the removal of unreachable methods and redundant fields, inlining of method calls, and transformation of the class hierarchy for reducing application size. We implemented a number of extraction techniques in Jax, an application extractor for Java, and evaluated their effectiveness on a set of large Java applications. We found that, on average, the class file archives for these benchmarks were reduced to 37.5% of their original size. Modeling dynamic language features such as reflection, and extracting software distributions other than complete applications requires additional user input. We present a uniform approach for supplying this input that relies on MEL, a modular specification language. We also discuss a number of issues and challenges associated with the extraction of embedded systems applications.
</details>

## 1999

<img alt="" title="Journal Articles" src="https://dblp.uni-trier.de/img/n.png" style="background: #c32b72; width: 18px; height: 18px; padding-right: 18px"> [OOPSLA] **Practical experience with an application extractor for Java** [[link]](https://dl-acm-org.focus.lib.kth.se/doi/abs/10.1145/320384.320414) 

<details> 
Java programs are routinely transmitted over low-bandwidth network connections as compressed class file archives (i.e., zip files and jar files). Since archive size is directly proportional to download time, it is desirable for applications to be as small as possible. This paper is concerned with the use of program transformations such as removal of dead methods and fields, inlining of method calls, and simplification of the class hierarchy for reducing application size. Such “extraction” techniques are generally believed to be especially useful for applications that use class libraries, since typically only a small fraction of a library's functionality is used. By “pruning away” unused library functionality, application size can be reduced dramatically. We implemented a number of application extraction techniques in Jax, an application extractor for Java, and evaluate their effectiveness on a set of realistic benchmarks ranging from 27 to 2,332 classes (with archives ranging from 56,796 to 3,810,120 bytes). We report archive size reductions ranging from 13.4% to 90.2% (48.7% on average).
</details>




## External resources

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