---
layout: post
title: AOT vs. JIT Compilation in Java
subtitle: Which one is better?
tags: programming
description: AOT compilation, supported by the GraalVM compiler, seems to be the future for Java and the programming languages that compile to JVM bytecode. But what is the difference between compiling source code using a JIT compiler w.r.t using an AOT compiler? This post explains the difference between these two approaches.
keywords:
  - java virtual machine,
  - compilation strategies,
  - compiler,
  - program execution,
  - software performance,
image: ../img/posts/2022/curves_cover.jpg
share-img: ../img/posts/2022//curves_cover.jpg
show-avatar: false 
toc: true
date: 2022/03/27
author: cesarsotovalero
published: true
---

There are two ways of compiling a Java application: using Just in Time Compilation (JIT) or Ahead of Time Compilation (AOT).
The first is the default mode, and it is used by the [Java Hotspot Virtual Machine](https://www.oracle.com/java/technologies/javase/vmoptions-jsp.html) to translate bytecode into machine code at runtime.
The latter is supported by the novel [GraalVM](https://www.graalvm.org/) compiler and allows statically compiling bytecode directly into machine code at build time.
In this post, I'll explain the differences between these two different compilation strategies.
After reading this post, you will learn about what Java compilers do, the differences between different compiling approaches, and when using an AOT compiler is more appropriate.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/curves.jpg alt:"AOT vs. JIT" %}
  <figcaption class="stroke"> 
    &#169; JIT vs. AOT: two sides from the same coin. Photo from <a href="https://goo.gl/maps/j8GC4KtHEXoKxLpB8">Tekniska Högskolan station</a>.
  </figcaption>
</figure>

# Compilation in Java

Compiling a program means **transforming source code** from a high-level programming language, such as Java or Python, into [machine code](https://en.wikipedia.org/wiki/Machine_code).
Machine code are low-level instructions tailored to execute in a particular microprocessor.
Compilers are programs designed to perform this task efficiently.
The goal of a compiler is to create a consistent executable of the compiled program.
A consistent executable is one that is attained to the specification that is written in the source code, runs fast, and it is safe.

Compilers perform several [optimizations](https://en.wikipedia.org/wiki/Category:Compiler_optimizations) during the machine code generation phase.
For example, most compilers perform constant inlining, loop unrolling, and partial evaluation at compilation time, to name a few.
The quantity and complexity of these optimizations have [increased significantly](https://en.wikipedia.org/wiki/Optimizing_compiler) in the last decades.

In terms of compiler optimizations in the ~~standard~~ Java Hotspot Virtual Machine, there are two major compilers: the C1 compiler and the C2 compiler.

- The **C1 compiler** is a fast, lightly optimizing bytecode compiler that performs some value numbering, inlining, and class analysis. It uses a simple CFG-oriented SSA "high" IR, a machine-oriented "low" IR, a linear scan register allocation, and a template-style code generator.

- The **[C2 compiler](https://dl.acm.org/doi/10.5555/1267847.1267848)** is a highly optimizing bytecode compiler that uses a "sea of nodes" SSA "ideal" IR, which lowers to a machine-specific IR of the same kind. It has a graph-coloring register allocator. Colors are machine states, including local, global, and argument registers and stack. Optimizations in the C2 compiler include global value numbering, conditional constant type propagation, constant folding, global code motion, algebraic identities, method inlining (aggressive, optimistic, and/or multi-morphic), intrinsic replacement, loop transformations (unswitching, unrolling), array range check elimination, and others.

Now that we understand the role of compilers, let's talk about **when** is the compilation performed.
There are two main compilation strategies in Java: Just in Time Compilation (JIT) and Ahead of Time Compilation (AOT).
The first generates machine code **during the execution** of the program itself (i.e., shortly before the first invocation of a Java method).
The latter generates machine code **before the execution** of the program (i.e., during the bytecode verification and build phase of the application).
The following sections describe the differences between these two approaches.

## Just in Time Compilation (JIT)

When compiling a Java program (e.g., using the `javac` command line tool), we end up with our source code transformed into an intermediate representation which is platform-independent (a.k.a. JVM bytecode).
This bytecode representation is simpler for the JVM to interpret, but it is harder to read by humans. 
Conventional processors in our computers cannot execute JVM bytecode directly.
To do so, a compiler transforms JVM bytecode into a binary representation which is platform-dependent.
This means that the program can be executed only in a computer with the architecture in which it was originally compiled.
This is precisely the task of bytecode compilers.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/java_source_code_compilation.png alt:"Java source code compilation phases" %}
  <figcaption class="stroke"> 
    Fig 1. Java source code is first compiled to bytecode, and subsequently interpreted or executed as native code. Heavy optimizations are reserved for the JIT-compilation phase. <a href="https://dl.acm.org/doi/10.1145/3067695.3082521">Source</a>.
  </figcaption>
</figure>

To transform JVM bytecode into machine code that is executable in a specific hardware architecture, the JVM **interprets the bytecode at runtime** and figures out in which architecture is the program running.
This strategy is known as [JIT compilation](https://en.wikipedia.org/wiki/Just-in-time_compilation), which is a form of [dynamic compilation](https://en.wikipedia.org/wiki/Dynamic_compilation).
The default JIT compiler in the JVM is known as the Hotspot compiler.
The [OpenJDK](https://github.com/openjdk/jdk) compiler is a free version of this interpreter written in Java.

> “In fact, a JIT compiler just needs to be able to accept JVM bytecode and produce machine code - you give it a `byte[]` in, and you want a `byte[]` back. It will do a lot of complex things to work out how to do that, but they don’t involve the actual system at all, so they don’t need a "systems" language, for some definition of systems language that doesn’t include Java, like C or C++.”

The objective of a JIT compiler is to generate high-quality machine code as fast as possible.
Thanks to the runtime information, JIT compilers perform much more sophisticated optimizations than the `javac` compiler.
These optimizations improve performance.

The Hotspot JIT compiler allows the ample interpreter time to "warm-up" Java methods by executing them thousands of times.
This warm-up period allows a compiler to make better decisions related to optimizations because it can observe (after initial class loading) the complete class hierarchy.
The JIT compiler can also inspect branch and type profile information gathered by the interpreter.

Despite the advances in JIT compilers, Java applications are still a lot slower than other languages such as C or Rust, which produce native code directly.
The bytecode interpretation process makes executing an application significantly slower in comparison with native code being executed directly in a real processor.

## Ahead of Time Compilation (AOT)

[AOT compilation](https://en.wikipedia.org/wiki/Ahead-of-time_compilation) is a form of static compilation that consists in transforming the program into a machine code **before it is executed**.
This is the "old-fashioned" way in which the code in old programming languages such as C is statically linked and compiled.
The machine code obtained as a result is tailored to a specific operating system and hardware architecture, facilitating a very fast execution. 

The [GraalVM](https://github.com/graalvm/graal.git) compiler can perform a highly optimized AOT compilation of JVM bytecode.
GraalVM is written in Java and uses JVMCI[^1] to integrate with the Hotspot VM.
The focus of the GraalVM project is on offering high performance and extensibility of modern Java applications.
This means it executes faster with less overhead, which translates into optimal resource consumption with less CPU and memory.
This makes GraalVM a better alternative than the traditional JIT compiler shipped with the JVM.

> “The self-contained native executable created with the `native-image` tool in GraalVM includes the application classes, classes from its dependencies, runtime library classes, and statically linked native code from JDK. It does not run on the Java VM, but includes necessary components like memory management, thread scheduling, and so on from a different runtime system, called “Substrate VM”. Substrate VM is the name for the runtime components (like the deoptimizer, garbage collector, and thread scheduling). The resulting program has faster startup time and lower runtime memory overhead compared to a JVM.”

The following figure illustrates the AOT compilation process in the GraalVM compiler using its [native-image](https://www.graalvm.org/22.0/reference-manual/native-image/) technology.
It receives as input all classes from the application, libraries, the JDK, and the Java Virtual Machine.
Then an iterative bytecode search using state-of-the-art [points-to analysis](https://dl.acm.org/doi/abs/10.1145/3377555.3377885) is performed until a fixed point is reached.
During this process all the safe classes are [initialized upfront](https://docs.oracle.com/en/graalvm/enterprise/21/docs/reference-manual/native-image/ClassInitialization/) (i.e., instantiated) statically.
The class data of the initialized classes is loaded into the image heap which then, in turn, gets saved into standalone executable (into the text section in Fig 2).
The result is a native image executable that can be shipped and deployed directly in a container.

<figure class="jb_picture">
{% responsive_image path: img/posts/2022/native_image_creation_process.png alt:"Native image creation process in Quarkus." %}
  <figcaption class="stroke"> 
    Fig 2. Native image creation process in GraalVM. <a href="https://dl.acm.org/doi/10.1145/3360610">Source</a>. 
  </figcaption>
</figure>

The AOT compilation in GraalVM performs aggressive optimizations such as unused code elimination in the JDK and its dependencies, heap snapshotting, and static code initializations.
It produces a single executable file.
A major advantage is that the executable does not require having the JVM installed in the client machine to run correctly.
This makes programming languages that compile to JVM bytecode as fast as languages such as C, C++, Rust, or Go which are used for high performing computing.[^2]

# JIT vs. AOT

Now that you understand how bytecode compilation works, and the two principal strategies (JIT and AOT), you may wonder which approach is the best to use.
Unfortunately, the answer is as expected: **it depends**.
This section covers the tradeoffs of using one or the other.

JIT compilers make programs cross-platform. Indeed,
the slogan "[write once, run anywhere](https://en.wikipedia.org/wiki/Write_once,_run_anywhere)" is one of the features that made Java a popular language back in the late 90s.
JIT compilers reduce latency thanks to the ability to use concurrent garbage collectors and increase the resilience under peak throughput conditions.

On the other hand, AOT compilers run programs more efficiently.
AOT compilation is particularly suited for cloud applications.
They offer faster startup speed, which results in shorter boot time and more straightforward horizontal scale-up of cloud services.
This is particularly beneficial in the case of microservices initialized as Docker containers running in the cloud.
The small size on disk, thanks to complete dead code elimination (classes, fields, methods, branches), also results in small container images.
The low memory consumption allows running more containers with the same RAM, reducing the costs of services from cloud providers.

The following spider graph illustrates the key differences:

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/aot_vs_jit.jpeg alt:"AOT vs. JIT." %}
  <figcaption class="stroke">
    Fig 3. AOT vs. JIT. <a href="https://twitter.com/thomaswue/status/1145603781108928513?s=20&t=-6ufSBjc46mfN5d_6Y2-Rg">Source</a>. 
  </figcaption>
</figure>

In summary, AOT compilation with GraalVM provides the following advantages over the standard JIT compilation:

- Use a fraction of the resources required by the JVM.
- Applications start in milliseconds.
- Deliver peak performance immediately, no warmup.
- Can be packaged into lightweight container images for faster and more efficient deployments.
- Reduced attack surface.

## AOT Limitations: The Close World Assumption

The points-to analysis of the AOT compilation needs to "see" all the bytecode to work correctly.
This limitation is known as the close world assumption.
It means that all the bytecode in the application and their dependencies that can be called at runtime **must be known at build time** (observed and analyzed), i.e., when the `native-image` tool in GraalVM is building the standalone executable.

Consequently, dynamic language capabilities such as Java Native Interface (JNI), Java Reflection, Dynamic Proxy objects (`java.lang.reflect.Proxy`), or classpath resources (`Class.getResource`) are not supported.


> “The closed-world constraint imposes strict limits on Java’s natural dynamism, particularly on the run-time reflection and class-loading features upon which so many existing Java libraries and frameworks depend. Not all applications are well suited to this constraint, and not all developers are willing to live with it.
>
> So rather than adopt the closed-world constraint at the start, I propose that we instead pursue a gradual, incremental approach.
>
> We will explore a spectrum of constraints, weaker than the closed-world constraint, and discover what optimizations they enable. The resulting optimizations will almost certainly be weaker than those enabled by the closed-world constraint. Because the constraints are weaker, however, the optimizations will likely be applicable to a broader range of existing code — thus they will be more useful to more developers.
>
> We will work incrementally along this spectrum of constraints, starting small and simple so that we can develop a firm understanding of the changes required to the Java Platform Specification. Along the way we will strive, of course, to preserve Java’s core values of readability, compatibility, and generality.
> We will lean heavily on existing components of the JDK including the HotSpot JVM, the C2 compiler, application class-data sharing (CDS), and the `jlink` linking tool.
>
> In the long run we will likely embrace the full closed-world constraint in order to produce fully-static images. Between now and then, however, we will develop and deliver incremental improvements which developers can use sooner rather than later.” -- [Project Leyden: Beginnings](https://openjdk.java.net/projects/leyden/notes/01-beginnings) (by Oracle)

To overcome this limitation, GraalVM provides a [Tracing Agent](https://www.graalvm.org/22.0/reference-manual/native-image/Agent/) that tracks all usages of dynamic features of execution on a regular Java VM.
During execution, the agent interfaces with the JVM and intercepts all calls that look up classes, methods, fields, resources, or request proxy accesses.
The agent then generates the files `jni-config.json`, `reflect-config.json`, `proxy-config.json`, and `resource-config.json` in the specified output directory.
The generated files are standalone configuration files in JSON format, which contain all intercepted dynamic accesses.
Thesis files can be passed to the `native-image` tool so that the used classes will not be removed during the image build process.

It is worth mentioning that the close work assumption is good for security as it eliminates the possibility of various code injections (e.g., the [Log4j vulnerability](https://nvd.nist.gov/vuln/detail/CVE-2021-44228) that shocked the web in 2021 was possible due to the exploitation of the dynamic class loading mechanism in Java).
On the other hand, the points-to-analysis makes AOT compilation slower than JIT because all the reachable bytecode needs to be analyzed, which is an expensive computational tack.  

# Is AOT Compilation with GraalVM the Future of Java?

The benefits of AOT compilation for native cloud applications have increased the interest in this technology. The Java ecosystem is adopting this technology with enthusiasm.
At the moment of writing, three major frameworks benefit from GraalVM to build and optimize applications:

- [Quarkus](https://quarkus.io) (by RedHat)
- [Micronaut](https://micronaut.io) (by The Micronaut Foundation)
- [Helidon](https://helidon.io) (by Oracle)
- [Spring Native](https://docs.spring.io/spring-native/docs/current/reference/htmlsingle/) (by Spring)

The common process for building a JVM based native applications is as follows:

[//]: # (see https://mermaid-js.github.io)
{% mermaid %}
flowchart TB;
a[".class Files"] --> x[Quarkus/Micronatu/Helidon/Spring Native]
x[Quarkus/Micronatu/Helidon/Spring Native] --> y[Maven/Gradle Plugin]
y[Maven/Gradle Plugin] --> q{Optimized JAR for the Cloud}
q -- Yes --> c[AOT Compilation via GraalVM]
q -- No --> w[JIT Compilation via JVM]
c[AOT Compilation via GraalVM] --> r[GraalVM Native Image]
{% endmermaid %}

It seems that AOT with GraalVM is the future of JVM-based languages, such as Java, Scala, or Kotlin.
However, since the native image creation analyzes the bytecode in the application **and all its dependencies**, there is a risk of violating the close world if at least one of the dependencies relies on some dynamic Java feature.
The community is creating new versions of libraries that respect this assumption.
However, there is still no sufficient support for the most popular Java libraries.
Therefore, the technology still needs some time to mature before its massive adoption.[^3]

# Conclusion

[//]: # (Is the behavior always preserved? &#40;i.e, compilable code = native code&#41;)

[//]: # (How to automatically modify applications to comply with the close world assumption?)

[//]: # (What tools are available to analyze the native binary?)

It is possible compiling JVM bytecode using either AOT or JIT approaches. 
It would be wrong to say one approach is better than the other since they are suited for different situations. 
The GraalVM compiler allows for building high-performance applications with AOT compilation, reducing the startup time and improving the performance considerably. This power comes at the cost of complying with the close world assumption (no Java dynamic features are allowed). Developers can still use the standard JIT compiler in the Hotspot VM to use dynamic features, which supports machine code generation at runtime.

# References

- [Java is Going to the Moon: Native Images with GraalVM](https://docs.google.com/presentation/d/1JDVerE77ZWLqwtWP430QXF1KTd4RhKoD/edit?usp=sharing&ouid=117859204590242341300&rtpof=true&sd=true)
- [Supporting Binary Compatibility with Static Compilation](https://www.usenix.org/legacy/publications/library/proceedings/jvm02/yu/yu_html/index.html)
- [Initialize Once, Start Fast: Application Initialization at Build Time](https://dl.acm.org/doi/10.1145/3360610)
- [Deep Dive Into the New Java JIT Compiler – Graal](https://www.baeldung.com/graal-java-jit-compiler)
- [JEP 295: Ahead-of-Time Compilation](https://openjdk.java.net/jeps/295)
- [Ahead of Time Compilation (AoT)](https://www.baeldung.com/ahead-of-time-compilation)

# Footnotes

[^1]: [JVMCI](https://openjdk.java.net/jeps/243) is a low level interface to JVM for features such as reading metadata from the VM and injecting machine code into the VM. It enables compliers written in Java to be used as a dynamic compiler.

[^2]: In the case of Go, the fastest initialization was implemented in the language since the beginning.

[^3]: Adoption latency is typical in the tech world. Key technology such as Docker containers was available since 2013, but it was not until five years later (in 2018) that it started to receive massive adoption.
