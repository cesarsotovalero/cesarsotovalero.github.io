---
layout: post
title: The Execution Lifecycle of a Java Application
subtitle: Or... what happens when you run a Java program?
tags: academia
description: TODO 
keywords:
  - class loaders,
  - java bytecode execution,
  - how the JVM works,
  - understanding the JVM
image: ../img/posts/2022/statue_cover.jpg
share-img: ../img/posts/2022/statue_cover.jpg
show-avatar: false
toc: true
date: 2022/10/20
author: cesarsotovalero
published: false
---

If you are reading this post it's likely that you already know how to ~~write Java~~ code.
Good for you, I think everyone should know how to code, in the same way everyone should know about basic math operations (e.g., +, -, *, /). 
In a [previous post](../blog/aot-vs-jit-compilation-in-java.html), I wrote about how Java code is first "compiled" to bytecode and later interpreted by the JVM.
However, I never explained how the JVM actually executes the bytecode.
In other words: what happens after clicking the "execute" button on your favorite IDE?
After reading this post, you will know about the the activities that occur during the execution of a Java program.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/statue.jpg alt:"A statue representing learning." %}
  <figcaption class="stroke"> 
    &#169; Deep knowledge is often a requirement for proper execution. Photo taken at <a href="https://goo.gl/maps/F1qSQuaeJ7wdvnnRA">Kungsträdgården metro station</a>.
  </figcaption>
</figure>

# Execution Lifecycle


The following activity diagram illustrates the execution lifecycle of a Java application:

[//]: # (see https://mermaid-js.github.io)
{% mermaid %}
flowchart TB;
a(["Execution Starts"]) --> b["Loading Classes"]
b["Loading Classes"] --> c["Linking Classes"]
c["Linking Classes"] --> d["Initializing Classes"]
d["Initializing Classes"] --> e["Creating Instances"]
e["Creating Instances"] --> f["Finalizing Instances"]  
f["Finalizing Instances"] --> q{Unloading?}
q -- Yes --> x(["Program Exit"])
q -- No --> d["Initializing Classes"]
{% endmermaid %}

# Running Code Example

{% highlight java linenos %}
class Point {
  int x;
  int y;
  
  Point() {
    x = 0;
    y = 0;
  }
}


class ShapedPoint extends Point implements Shape {
  Shape shape;
  
  public void setShape(Shape shape) {
    this.shape = shape;
  }
}

public class Main {
  public static void main(String[] args) {
    for (int i = 0; i < args.length; i++) {
      System.out.print(i == 0 ? args[i] : " " + args[i]);
    }
  }
}
{% endhighlight %}



## Loading

> Loading refers to the process of finding the binary form of a class or interface (i.e., a `class` file format) with a particular name and constructing a `Class` object from that binary form.

The JVM uses a Class Loader to find the binary representation of `Main`.

The `ClassLoader` class and its subclasses implement the loading process.
The method `defineClass` may be used to construct `Class` objects from binary representation of the class file format.

Different subclasses of `ClassLoader` are used to load classes from different sources, such as the file system, the network, or a database.
These activities may not be completely to a running application if, for example, a newly compiled version of a class is not found because the class loader is using a cached version of the class.

JVM provides two types of class loaders. 
One is called bootstrap class loader and another is the user-defined class loader.
The bootstrap class loader is rigidly defined in the JVM and loads class files according to the specification.
The user-defined class loader is open for vendor-specific implementation and can custom load classes via the java.lang.Class instance.

The loading process basically performs these three functions:

- Create a binary stream of data from the class file
- Parse the binary data according to the internal data structure
- Create an instance of java.lang.Class
- The Process of Linking


## Linking

> Linking refers to the process of taking a binary form of a class or interface and combining it into the runtime state of the JVM, so that it can be executed.

Linking involves verification of the binary representation, preparation of a class of interface, and (optionally) resolution of symbolic references.

1. **Verification:** checks that the loaded representation of `Main` is well-formed, with a proper symbol table. It also checks that the code that implements `Main` obeys the semantic requirements of the Java programming languague and the JVM. For example, it checks that every instruction has a valid operation code; that every branch instruction branches to the start of some other instruction, rather than into the middle of an instruction; that every method has a correct signature. 
2. **Preparation:** involves creating the `static` fields (class variables and constants) for a class or interface and initializings such fields to the default values. This involves allocation of static storage and any data structures that are used internally by the implementation of the JVM, such as method tables.[^1]
3. **Resolution:** is the process of checking symbolic references from `Main` to other classes and interfaces, by loading the other classes and interfaces that are mentioned, and checking that the references are correct.

> "During the static linkage in simple implementations of the C languague, a compiled program contains fully-linked version of the program, including completely resolved links to library routines used by the program. 
> Copies of these library routines are included in the `a.out` file.
> In Java, instead, symbolic references are resolved only when they are actively used (i.e., lazy form of resolution).
> For example, if `Main` has several symbolic references to another class, then the references might be resolved one at a time, as they are used, or perhaps not at all, if these references were never used during execution of a program." 

In summary, the linking process involves three functions:
- Verification
- Preparation
- Resolution (optional)
- The Process of Initialization 


## Initialization

> Initialization of a class consists of executing its static initializers and the initializers for `static` fields (class variables) declared in the class.
> Initialization of an interface consists of executing the initializers for `fields`  (constants) declared in the interface. 

To execute the `main` method in the class `Main`, the class needs to be initialized.
Initialization consists of execution of any class variable initializers and static initializers of the class `Main`, in textual order.
The JVM initializes all the superclasses of `Main` recursively.
In this case, the class `Main` has `Object` as its direct superclass, so if `Object` has not being yet initialized, then it must be initialized before `Main` is initialized.
Note that `Object` as no superclass, so the recursion stops there.

<aside class="quote">
    <em>“Superclasses are initialized before subclasses.”</em>
</aside>


Initialization of a class or interface `T` occurs when any of the following circumstances occurs:
- An instance of `T` is created.
- A static method of `T` is invoked.
- A static field of `T` is assigned.
- A static field of `T` is used and the field is not a constant field.
Note that invocation of a method in a class via reflection causes initialization of the class.

## Creating New Class Instances

> A new class instance is explicitly created when evaluation of a class instance creation expression is performed.

A class instance may be implicitly created when:
- Loading a class or interface that contains a string literal or a text block may create a new `String` object.
- Execution of an operation that causes boxing conversion may create a new object of a wrapper class.
- Execution of a string concatenation operation may create a new `String` object.
- Evaluation of a method reference expresssion or a lambda expression may create a new object of a functional interface.

Memory space is allocated for the new class instance.
This icludes space for the instance variables declared in the class and its superclasses.

# Finalizing Class Instances

The class `Object` defines a method `finalize` that is called by the garbage collector when an object is about to be reclaimed.


## Unloading

> Unloading refers to the process of removing a class or interface from the runtime state of the JVM (e.g., its defining class loader may be reclamed by the garbage collector).
> Classes and interfaces loaded by the bootstrap class loader are never unloaded.

Class unloading reduces memory use.
Consequently, this optimization is only significant for applications that load large numbers of classes and interfaces, and that stop to use them after some time.
This is done by the garbage collector.

## Program Exit

> Program exit refers to the process of terminating the execution of a program. 
> This means that all threads that are not daemon threads are terminated, or some thread invokes the `exit` method of the `Runtime` class and the `exit` method is not forbidden by a security manager.


# References

- [The Java Language Specification, Java SE 19 Edition]( https://docs.oracle.com/javase/specs/jls/se19/jls19.pdf)
- [Dynamic Class Loading in the Java Virtual Machine](https://dl.acm.org/doi/10.1145/286942.286945)

# Footnotes


- [^1]: The method table is an array of pointers to the data for each instance method that can be invoked on objects of that class.