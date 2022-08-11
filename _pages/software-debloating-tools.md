---
permalink: software-debloating-tools.html
layout: page
title: Software debloating tools
subtitle: Living tooling list
keywords: software debloat,GitHub projects,software engineering
image: ../img/pages/software-debloating-papers/debloating.png
---

<!-- Carbon ads -->
<div class="cesarcarbon">
   <script async type="text/javascript" src="//cdn.carbonads.com/carbon.js?serve=CESI52JM&placement=wwwcesarsotovaleronet" id="_carbonads_js"></script>
</div>

This is a living list of tools for program debloating and software specialization.

# Java


- <a href="https://bit.ly/2WFALXf"><i class="fab fa-github"></i></a> [Slicer4J](https://github.com/resess/Slicer4J) an accurate, low-overhead dynamic slicer for Java programs ([paper](https://people.ece.ubc.ca/mjulia/publications/Slicer4J_2021.pdf)).

- <a href="https://bit.ly/2WFALXf"><i class="fab fa-github"></i></a> [BloatLibD](https://bit.ly/2WFALXfl) detects offuscated third-party libraries that are bloated using a Jar2vect model ([paper](https://www.scitepress.org/Papers/2021/104594/104594.pdf)).
   
- <a href="https://github.com/castor-software/jdbl"><i class="fab fa-github"></i></a> [JDBL](https://castor-software.github.io/jdbl) automatically removes unnecessary code from Java applications through dynamic analysis ([paper](https://arxiv.org/pdf/2008.08401.pdf)).

- <a href="https://github.com/castor-software/depclean"><i class="fab fa-github"></i></a> [DepClean](https://github.com/castor-software/depclean) automatically detects and removes unused dependencies in Maven projects ([paper](https://link.springer.com/article/10.1007/s10664-020-09914-8)).

- <a href="https://github.com/ucla-pls/jreduce"><i class="fab fa-github"></i></a> [JReduce](https://github.com/ucla-pls/jreduce) is a tool for reducing Java class files and jar files. ([paper](https://dl.acm.org/doi/pdf/10.1145/3338906.3338956)).

- <a href="https://github.com/apache/maven-jlink-plugin"><i class="fab fa-github"></i></a> [jlink](https://www.baeldung.com/jlink) is a tool to assemble and optimize a set of Java modules and their dependencies into a custom runtime image.

- <a href="https://github.com/Guardsquare/proguard"><i class="fab fa-github"></i></a> [Proguard](https://www.guardsquare.com/en/products/proguard) is a shrinker, optimizer and obfuscator of Java bytecode.

- <a href="https://github.com/uber/piranha"><i class="fab fa-github"></i></a> [Piranha](https://github.com/uber/piranha) is a tool for refactoring code related to feature flag APIs  ([paper](https://dl.acm.org/doi/abs/10.1145/3377813.3381350)).

- [JShrink](https://figshare.com/articles/software/JShrink_Artifact/12435542) is a Java shrinker ([paper](https://dl.acm.org/doi/pdf/10.1145/3368089.3409738)).
  
- [JShrink](http://www.e-t.com/jshrink.html) is a Java shrinker and obfuscator.


# Docker

- <a href="https://github.com/docker-slim/docker-slim"><i class="fab fa-github"></i></a> [docker-slim](https://dockersl.im/) a tool to minify and secure docker containers.

- <a href="https://github.com/jon-bell/javaslicer"><i class="fab fa-github"></i></a> [JavaSlicer](https://github.com/jon-bell/javaslicer) is an open-source dynamic slicing tool developed at Saarland University.

# C/C++

- <a href="https://github.com/cxreet/razor"><i class="fab fa-github"></i></a> [RAZOR](https://github.com/cxreet/razor) is a framework for post-deployment software debloating ([paper](https://www.usenix.org/system/files/sec19-qian.pdf)).
  
- <a href="https://github.com/cxreet/Slimium"><i class="fab fa-github"></i></a> [Slimium](https://github.com/cxreet/Slimium) is a tool to debloat Chromium ([paper](https://dl.acm.org/doi/pdf/10.1145/3372297.3417866)).

- [Nibbler](https://gitlab.com/brown-ssl/libfilter) is a tatic analysis tool to automatically find functions in the program and its shared library functions that are not used by the program. ([paper](https://dl.acm.org/doi/pdf/10.1145/3414997)).


# JavaScript

- <a href="https://github.com/moar82/jMetalPy"><i class="fab fa-github"></i></a> [MoMIT](https://github.com/moar82/jMetalPy) is a JavaScript interpreter minimizer ([paper](https://ieeexplore.ieee.org/document/8966499)).

- <a href="https://github.com/hcvazquez/UFFRemover"><i class="fab fa-github"></i></a> [UFFRemover](https://github.com/hcvazquez/UFFRemover) is a slimming JavaScript tool for identifying and removing unused foreign functions (UFF) ([paper](https://www.sciencedirect.com/science/article/abs/pii/S0950584918302210)).

- <a href="https://r8.googlesource.com/r8"><i class="fab fa-github"></i></a> [R8](https://r8.googlesource.com/r8) is the Google substitute of Proguard.

- <a href="https://github.com/tedious/JShrink"><i class="fab fa-github"></i></a> [JShrink](https://github.com/tedious/JShrink) is a Javascript minifier built in PHP.

# Related tools

- <a href="https://github.com/iovisor/bpftrace"><i class="fab fa-github"></i></a> [bpftrace](https://github.com/iovisor/bpftrace) High-level tracing language for Linux eBPF.

- <a href="https://github.com/strace/strace"><i class="fab fa-github"></i></a> [STrace](https://strace.io/)  A diagnostic, debugging and instructional userspace utility for Linux.

- <a href="https://github.com/dkarv/jdcallgraph"><i class="fab fa-github"></i></a> [JDCallgraph](https://github.com/dkarv/jdcallgraph) Dynamic call graph generation for Java. 

- <a href="https://github.com/jenkinsci/constant-pool-scanner"><i class="fab fa-github"></i></a> [constant-pool-scanner](https://github.com/jenkinsci/constant-pool-scanner) Simple utility to scan Java bytecode for class references in the constant pool.

- <a href="https://github.com/gousiosg/java-callgraph"><i class="fab fa-github"></i></a> [java-callgraph](https://github.com/gousiosg/java-callgraph) Programs for producing static and dynamic (runtime) call graphs for Java programs.

- <a href="https://github.com/axt/jvm-callgraph"><i class="fab fa-github"></i></a> [jvm-callgraph](https://github.com/axt/jvm-callgraph) Call graph generator for JVM bytecode.

- <a href="https://github.com/aragozin/jvm-tools"><i class="fab fa-github"></i></a> [jvm-tools](https://github.com/aragozin/jvm-tools) Small set of tools for JVM troublshooting, monitoring and profiling. 

- <a href="https://github.com/jon-bell/bytecode-examples"><i class="fab fa-github"></i></a> [bytecode-examples](https://github.com/jon-bell/bytecode-examples) Java Bytecode Engineering Examples & Tutorials.

- <a href="https://github.com/jon-bell/maven-lifecycle-logger"><i class="fab fa-github"></i></a> [maven-lifecycle-logger](https://github.com/jon-bell/maven-lifecycle-logger) Logger to record maven lifecycle events and timing.

- <a href="https://github.com/mihaip/dex-method-counts"><i class="fab fa-github"></i></a> [dex-method-counts](https://github.com/mihaip/dex-method-counts) Command-line tool to count per-package methods in Android .dex files.
  
- [DTrace](http://dtrace.org/guide/preface.html#preface) A comprehensive dynamic tracing framework
