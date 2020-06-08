---
layout: post
title:  Diversity-driven software debloat
subtitle: Leveraging power of the crowds
tags: debloat
published: true
image: ../img/posts/crowd.jpg
date: 2020/5/23
---

> "Diversity is what we love." *― Benoit Baudry*

For months, I have worked on dynamic debloat of Java artifacts with [JDBL](https://github.com/castor-software/jdbl). To do so, I need to compile and execute the application to determine what part of the compiled sources are being used when executing certain workload. Then, with collected usage information, I remove the rest of the software. These two main task might seem simple at first glance. However, the inability of tracing and coverage tools to precisely detect what is used at execution time make the task a real challenge. I found the solution on the combination of various tools with similar purposes, i.e. by leveraging [software diversity](https://dl.acm.org/doi/abs/10.1145/2807593). Let me explain.  

# The problem

There are awesome Java coverage tools out there, notably: [JaCoCo](https://www.eclemma.org/jacoco/), [JCov](https://wiki.openjdk.java.net/display/CodeTools/jcov), and [Cobertura](https://cobertura.github.io/cobertura/). All these tools relied on the same underlying principle that drives debloat: determining what is parts of the software are necessary to produce a result. In genera, coverage tools perform the following tasks:

1. Instrument the bytecodes, i.e., injecting probes at particular locations 
2. Execute the test suite to "activate" the probes
3. Compare the activated sections of the code with respect to the original bytecodes
4. Report on the achieved coverage, depending on the chosen metric

During the third task, the coverage tool determines what parts of the application are necessary. Therefore, it makes sense to consider the rest as bloat. The problem with this approach is that coverage tools are not intended to work for that purpose. Indeed, there is still a general debate regarding what should be considered as covered or not (e.g., resources, exceptions, interfaces), not to mention the different coverage metrics.

The richness of Java bytecode constructs and dynamic behaviours poses an additional challenging even for the most advanced coverage tools. Consider this example, taken from [this](https://github.com/jacoco/eclemma/issues/61) JaCoCo issue: 

{% highlight java linenos %}
public class FruitSalad {
    public void mix() {
        yuck();
    }
    public void yuck() {
        throw new IllegalArgumentException();
    }
}
{% endhighlight %}

{% highlight java linenos %}
public class FruitSaladTest {
    @Test(expected = IllegalArgumentException.class)
    public void mixItUp() {
        FruitSalad fruitSalad = new FruitSalad();
        fruitSalad.mix();
    }
}
{% endhighlight %}


In the code above, the method `mix()` is not covered by JaCoCo. However, it is clear that, if we remove it, the test `mixItUp()` will fail. Reading the [JaCoCo documentation](https://www.eclemma.org/jacoco/trunk/doc/flow.html) to understand the reason behind this unexpected behaviour: _"The probe insertion strategy described so far does not consider implicit exceptions thrown for example from invoked methods. If the control flow between two probes is interrupted by a exception not explicitly created with a throw statement all instruction in between are considered as not covered._ To mitigate this issue, JaCoCo adds an additional probe between the instructions of two lines whenever the subsequent line contains at least one method invocation. This limits the effect of implicit exceptions from method invocations to single lines of source. However _"The approach only works for class files  compiled with debug information (line numbers) and does not consider implicit exceptions from other instructions than method invocations (e.g. NullPointerException or ArrayIndexOutOfBoundsException)".

Let us consider another example. The following class declares a Java constant using the `public final static` initializer:

{% highlight java linenos %}
class Foo(){
    public final static int RADIO = 3;
}
{% endhighlight %}


The dissasembled bytecode of the class `Foo` looks as follows:

{% highlight java linenos %}
super public class Foo
    version 51:0
{

public static final Field bar:I = int 3;

public Method "<init>":"()V"
    stack 1 locals 1
{
    aload_0;
    invokespecial   Method java/lang/Object."<init>":"()V";
    return;
}

} // end Class Foo
{% endhighlight %}

As we observe, the variable `RADIO`, initialized with a final static integer literal, is a compile-time constant. Compile-time constants get inlined by the bytecode compiler. This way, if we it from another class like `Foo.RADIO`, then the class `Foo` will not be considered as used at the bytecode level. But if we remove this class, the program will not compile.

There are many more examples like the two described above; including interfaces, annotation, lambda expressions and implicit constructors. So, it is clear that none tool is able to cover all the variety of bytecode constructs coming from real-world Java programs. 


# The winning strategy

To overcome the limitations of coverage and tracing tools, I tackle the problem from a different perspective. I decided to merge the coverage and tracing results of various tools. The current implementation of JDBL combines the outputs of three tools: JaCoco, [yajta](https://github.com/castor-software/yajta/), and the native class loader of the JVM. A general scheme of JDBL is presented in the following figure:

<p align="center">
  <a href="">
    <img src="../img/posts/jdbl_diversity.jpg" height="75%"/>
  </a>
</p>

As we observe, JDBL combines a variety of different implementations in order to achieve a unique goal: collecting the minimun set of classes and methods that are necessary to execute an application for a given workload. JDBL is extensible because it is not limited to a single coverage tool. It leverages the power of software diversity to break the limitations of the 

