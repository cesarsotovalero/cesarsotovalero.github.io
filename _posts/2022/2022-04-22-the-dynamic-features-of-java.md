---
layout: post
title: The Dynamic Features of Java
subtitle: A long-standing challenge for static analyzers
tags: programming
description: The existence of dynamic features built in the language allows Java developers to transform their program executions at runtime dynamically. However, these features in most Java programs are a fundamental problem for static analysis tools that rely on precise call-graph construction. Notably, the GraalVM compiler relies on points-to analysis to perform AOT compilation. This blog post covers the main dynamic features of Java and the reasons why they are still a long-standing issue for researchers and practitioners in program analysis.
keywords:
  - Static analysis in Java,
  - Java reflection,
  - Java bytecode analysis,
  - Java security,
  - Java usafe api,
  - Java dynamic analysis
image: ../img/posts/2022/untamed_horse_cover.jpg
share-img: ../img/posts/2022/untamed_horse_cover.jpg
show-avatar: false
toc: true
date: 2022/04/22
author: cesarsotovalero
published: true
---

The existence of dynamic features built-in within the language allows Java developers to dynamically transform their program executions at runtime.
For example, using the [Java Reflection API](https://docs.oracle.com/javase/tutorial/reflect/), one can inspect and interact with otherwise static language constructs such as classes, fields, and methods, e.g., to instantiate objects, set fields and invoke methods.
These dynamic language features are helpful, but their usage also hinders the accuracy of static analysis tools.
This is due to the undecidability of resolving and analyzing code that is not reachable at compile time.
As I mentioned in a [previous blog post](./aot-vs-jit-compilation-in-java.html), the promising GraalVM compiler performs Ahead of Time Compilation (AOT) through static analysis on Java bytecode.
However, the presence of dynamic features in most Java programs is a fundamental challenge for GraalVM.
Consequently, recognizing these features is key to understand the current limitations of AOT.
This blog post covers the fundamental dynamic features of Java and the reasons why they pose a significant challenge for GraalVM and static analysis tools in general.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/untamed_horse.jpg alt:"The dynamic features of Java remain an untamed horse for static analysis." %}
  <figcaption class="stroke"> 
    &#169; The dynamic features of Java remain an untamed horse for static analysis. Photo from  <a href="https://goo.gl/maps/gVnr4aBeNiFHGB2X9">Hersby, Lidingö</a>.
  </figcaption>
</figure>

# Dynamic Language Features

Java is a dynamic programming language.
As such, it supports dynamic features just like other dynamic languages such as Ruby, Python, and JavaScript.
Dynamic language features were introduced in Java since the very beginning, for example, Dynamic Proxies are available since [v1.3 of the JDK](https://docs.oracle.com/javase/7/docs/api/java/lang/reflect/Proxy.html). 

> “Dynamic programming languages execute many common programming behaviours at runtime that static programming languages perform during compilation.
> These behaviors could include an extension of the program, by adding new code, by extending objects and definitions, or by modifying the type system.”
> -- <cite>[Wikipedia](https://en.wikipedia.org/wiki/Dynamic_programming_language)</cite>

The existence of dynamic features in Java impacts its footprint at runtime.
For instance, a Java program can read strings from external files, register those strings as classes, load those classes via custom class loaders, create proxies, serialize them, and so on, **all at runtime!**
Consequently, program analysis tools based on static analysis can't afford to make assumptions about what should be kept at runtime and what should not.

> “Static analysis is a popular technique to detect bugs and vulnerabilities early in the life cycle of a program when it is still relatively inexpensive to fix those issues.
> It is based on the idea of extracting a model from the program without executing it, and then to reason about this model in order to detect flaws in the program.”
> -- <cite>[Sui et. al.](https://rdcu.be/cTsnh)</cite>

Static analysis differs from dynamic analysis techniques.
Dynamic techniques are inherently unsound as they depend on workloads to execute the program under analysis.
For real-world programs, these workloads will not cover all possible execution paths.
Due to the dynamic features that are prevalent in Java programs, it turns out that most static analyses are not sound.
As explained in the rest of this post, these dynamic features are notoriously difficult to model.

**The Soundness Manifesto** defines the soundness of static analysis with respect to possible program executions.
Similarly, precision can be defined with respect to possible program executions as well.
For static analysis, a “precise analysis” can only model possible executions.
The notion of possible program execution is used as ground truth to assess the soundness and the precision of call graph construction tools.

> “Analyses are often expected to be sound in that their result models all possible executions of the program under analysis.”
> -- <cite>[In defense of soundiness: a manifesto](https://dl.acm.org/doi/10.1145/2644805)</cite>

In general, dynamic features allow programmers to customize some aspects of the execution semantics of a program.
These customizations can be divided as follows:
1. Class and object life cycle.
2. Field access.
3. Method dispatch.

This post considers two main categories of dynamic features:

1. **Features built into the language itself and exposed by official APIs**:
   These are reflective features that give the ability of a system to reason about itself.
   For example, dynamic class loading, Dynamic Proxies, the Java Reflection API, and invokedynamic fit into this category.
2. **Certain features where programmers can access extra-linguistic mechanisms**:
   For example, the use of the Java Native Interface (JNI), the Unsafe API, and deserialization are in this category.

The following section presents representative examples for each of these categories.

# Examples

## Dynamic Class Loading

Java makes possible declaring custom [class loaders](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/ClassLoader.html).
We can use a custom `ClassLoader` to compile a `.java` source file from a file system and then load the compiled `.class` at runtime.
This mechanism allows programmers to load classes from arbitrary locations, e.g., from an external file system or over the network.

In the following example, the class `CustomClassLoader` extends `ClassLoader` and overrides the method `findClass`.
The method `compile` is used by `findClass` to compile a class file from the file system.

{% highlight java linenos %}
public class CustomClassLoader extends ClassLoader {
  @Override
  protected Class<?> findClass(String name) throws ClassNotFoundException {
    byte[] content;
    try {
      content = compile(this.getClass().getClassLoader(), name);
    } catch (Exception e) {
      throw new ClassNotFoundException();
    }
    return defineClass(name, content, 0, content.length);
  }
  private byte[] compile(ClassLoader classLoader, String name) throws IOException {
    String path = name.replace(".", "/");
    JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
    compiler.run(null, null, null, classLoader.getResource(path + ".java").getFile());
    File file = new File(classLoader.getResource(path + ".class").getFile());
    FileInputStream input = new FileInputStream(file);
    byte[] content = new byte[(int) file.length()];
    input.read(content);
    input.close();
    return content;
  }
} 
{% endhighlight %}

The following test loads the class from a source file called `Target.java`.
Then, the class is instantiated and the method `magic()` is invoked.
Notice that the `Target` class was not in the classpath previously.

{% highlight java linenos %}
@Test
public void findClass() {
  CustomClassLoader ccl = new CustomClassLoader();
  try {
    Class<?> target = ccl.findClass("dynamicClassLoading.Target");
    int magic = (Integer) target.getMethod("magic").invoke(target.newInstance());
    Assert.assertEquals(42, magic);
  } catch (Exception e) {
    fail("ClassNotFoundException");
  }
}
{% endhighlight %}

Any class name provided as a parameter of type `String` to methods in `ClassLoader` must be a binary name (notice the instruction `name.replace(".", "/")` in the method `compile`).
Examples of valid class names include:

- `java.lang.String`
- `javax.swing.JSpinner$DefaultEditor`
- `java.security.KeyStore$Builder$FileBuilder$1`
- `java.net.URLClassLoader$3$1`

## Dynamic Proxies

[Dynamic proxies](https://www.baeldung.com/java-dynamic-proxies) allow one single class with one single method to service multiple method calls to arbitrary classes with an arbitrary number of methods.
It is like a facade, but one that can pretend to be an implementation of any interface.
Under the cover, it routes all method invocations to a single handler: the `invoke()` method.

A [proxy class](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/reflect/Proxy.html) is a class created at runtime that implements a specified list of interfaces, known as proxy interfaces.
A proxy instance is an instance of a proxy class.
Each proxy instance has an associated invocation handler, which implements the interface [`InvocationHandler`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/reflect/InvocationHandler.html).
When a method is invoked on a proxy instance, the method invocation is encoded and dispatched to the invoke method of its invocation handler
The invocation handler processes the encoded method invocation as appropriate and the result that it returns will be returned as the result of the method invocation on the proxy instance.

Here is an example of a class `ProxyInstance` that invokes a custom method `target(String`:

{% highlight java linenos %}
public class ProxyInstance implements InvocationHandler {
  @Override
  public Object invoke(Object proxy, Method method, Object[] arg) {
    return target((String) arg[0]);
  }
  public String target(String s) {
    return s + " from target(String)";
  }
} 
{% endhighlight %}

Let's create a `ProxyInterface` with a method `foo(String)`:

{% highlight java linenos %}
public interface ProxyInterface {
  String foo(String s);
}
{% endhighlight %}

The following class `ProxyInterfaceImpl` implements the `ProxyInterface`:

{% highlight java linenos %}
public class ProxyInterfaceImpl implements ProxyInterface {
  @Override
  public String foo(String s) {
    return s + " from foo(String)";
  }
}
{% endhighlight %}

Now, let's create a class `DynamicProxy` that executes the method `foo` through the `ProxyInstance`:

{% highlight java linenos %}
public class DynamicProxy {
  public String execute() {
    ProxyInterface proxy = (ProxyInterface) Proxy.newProxyInstance(
        ProxyInterface.class.getClassLoader(),
        new Class[]{ProxyInterface.class},
        new ProxyInstance()
    );
    return proxy.foo("hello");
  }
}
{% endhighlight %}

In this scenario, the method `execute()` is supposed to call `foo(String)` form `ProxyInterfaceImpl` and return the string `hello from foo(String)`.
However, it is redirected to `target(String)` in `ProxyInstance` at runtime, returning “`hello from target(String)`” instead.

Here's a test case for the above example:

{% highlight java linenos %}
@Test
public void testExecute() {
  DynamicProxy dp = new DynamicProxy();
  Assert.assertEquals("hello from target(String)", dp.execute());
}
{% endhighlight %}


## JVM Invokedynamic

Before Java 7, the JVM only had four method invocation types:

- `invokevirtual`: To call normal class methods.
- `invokestatic`: To call static methods.
- `invokeinterface`: To call interface methods.
- `invokespecial`: To call constructors or private methods.

Despite their differences, all these invocations share one simple trait: They have a few predefined steps to complete each method call, it is not possible to enrich these steps with custom behaviors.
There are two main workarounds for this limitation, one at compile-time and the other at runtime. 
The former is usually used by languages like Scala or Koltin and the latter is the solution of choice for JVM-based dynamic languages like JRuby.

The [JVM invokedynamic](https://blogs.oracle.com/javamagazine/post/understanding-java-method-invocation-with-invokedynamic) instruction was introduced in Java 7.
It makes it possible to resolve method calls dynamically at runtime.
This gives the user more control over the method dispatch process by using a [user-defined bootstrap method](https://www.baeldung.com/java-invoke-dynamic) that computes the call target. 
While the original motivation behind invokedynamic was to provide support for dynamic languages like Ruby, its main application (in the JDK 8) is to provide support for lambda expressions.[^1]

Here is an example of a lambda function:

{% highlight java linenos %}
public class LambdaFunction {
  int foo = 3;
  public Integer execute() {
    IntUnaryOperator c = this::target;
    return c.applyAsInt(14);
  }
  private Integer target(int i) {
    return i * foo;
  }
}
{% endhighlight %}

Here's a test case:

{% highlight java linenos %}
@Test
public void testMethodTargetThatHasNoParam() {
  LambdaFunctionMinimal lambda = new LambdaFunctionMinimal();
  Assert.assertEquals(Integer.valueOf(42), lambda.execute());
}
{% endhighlight %}

The bytecode for the previous lambda example is as follows:

{% highlight java linenos %}
public execute()Ljava/lang/Integer;
   L0
    LINENUMBER 16 L0
    ALOAD 0
    INVOKEDYNAMIC applyAsInt(Linvokedynamic/LambdaFunctionMinimal;)Ljava/util/function/IntUnaryOperator; [
      // handle kind 0x6 : INVOKESTATIC
      java/lang/invoke/LambdaMetafactory.metafactory(
      Ljava/lang/invoke/MethodHandles$Lookup;
      Ljava/lang/String;
      Ljava/lang/invoke/MethodType;
      Ljava/lang/invoke/MethodType;
      Ljava/lang/invoke/MethodHandle;
      Ljava/lang/invoke/MethodType;)
      Ljava/lang/invoke/CallSite;
      // arguments:
      (I)I, 
      // handle kind 0x7 : INVOKESPECIAL
      invokedynamic/LambdaFunctionMinimal.target(I)Ljava/lang/Integer;, 
      (I)I
    ]
{% endhighlight %}

The above example uses a [`LambdaMetafactory`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/invoke/LambdaMetafactory.html) to create a `CallSite` that is used to invoke the `target` method.
It uses a [`MethodHandles.Lookup`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/invoke/MethodHandle.html) to find the `target` method.

The runtime approach is usually reflection-based and, consequently, inefficient.
On the other hand, the compile-time solution is generally relying on code generation at compile-time.
This approach is more efficient at runtime.
However, it's somewhat brittle and may cause a slower startup time as there's more bytecode to process.
`Function` represents a function that accepts one argument and produces a result.

## Java Native Interface

Sometimes we need to use code that's **natively-compiled for a specific hardware architecture**.

There could be many reasons for needing to use native code, for example:
- To handle some hardware.
- To improve the performance of a very demanding process.
- To reuse an existing native library instead of rewriting it in Java.

For these purposes, the JDK introduces the Java Native Interface (JNI) as a foreign function interface. 
It works as a bridge between the bytecode running in the Java Virtual Machine (JVM) and the native code.
Thus, JNI allows code running on the JVM to call and be called by native applications. 
Using JNI, one can call methods written in C/C++ or even access assembly language functions from Java.

[Native methods](https://www.baeldung.com/jni) are declared using the `native` keyword.
They are called just like regular Java methods.
`System.loadLibrary()` is used to load the shared native library (e.g, a `.so` file on Linux or `.dll` file on Windows).

Here's a simple example:

{% highlight java linenos %}
public class JNI {
    static {
        System.loadLibrary("native");
    }
    public static void main(String[] args) {
        new JNI().sayHello();
    }
    private native void sayHello();
}
{% endhighlight %}

First, to create the definition of the method, we have to use the `-h` flag of the Java compiler to compile the `JNI` class.

{% highlight bash linenos %}
javac -h . JNI.java
{% endhighlight %}

This will generate a `JNI.h` file with all the native methods included in the class passed as a parameter.
In this case, the `JNI.h` file will contain the following:

{% highlight c linenos %}
JNIEXPORT void JNICALL Java_com_example_JNI_sayHello(JNIEnv *, jobject);
{% endhighlight %}

Now, we have to create a new `.cpp` file for the implementation of the `sayHello` function.

Here is an example:

{% highlight c linenos %}
JNIEXPORT void JNICALL Java_com_example_JNI_sayHello(JNIEnv* env, jobject thisObject) {
  std::cout << "Hello from C++ !!" << std::endl;
}
{% endhighlight %}

Now we need to build our shared library from the C++ code and run it:

{% highlight c linenos %}
g++ -c -fPIC -I${JAVA_HOME}/include -I${JAVA_HOME}/include/darwin JNI.cpp -o JNI.o
{% endhighlight %}

Finally, we have to include it in a new shared library. 
Whatever we decide to name it is the argument passed into the method `System.loadLibrary`.
We named ours as `native`, and we'll load it when running our Java code.

{% highlight java linenos %}
g++ -dynamiclib -o libnative.dylib JNI.o -lc
{% endhighlight %}

We can now run our Java code:

{% highlight java linenos %}
java -cp . -Djava.library.path=. com.example.JNI
{% endhighlight %}

Using the JNI is obviously not the most simple way to develop software.
Here some pitfalls of using JNI:

- **No platform portability:** The native code makes the application depend on the underlying compiler platform. In case of requiring the support for different Operating Systems, the application needs to be compiled separately for each of those. Thus, using JNI means losing the “write once, run anywhere” feature of Java.
- **Difficult to implement:** JNI is a low-level interface and is not easy to use. For example, sometimes there isn’t even a direct conversion between types, so we’ll have to write our equivalent.
- **Difficult to debug:** JNI adds a layer of complexity to the application. It’s difficult to debug runtime errors. A simple error can lead to a complete system crash (e.g., a segmentation fault).
- **No garbage collection:** From the native side, resources should be handled manually. Thus, in case of forgetting to free memory, leaks might occur, hindering performance and compromising security.
- **Extra layer of communication:** JNI adds a costly layer of communication between the code running into the JVM and the native code. JNI applications need to convert the data exchanged between Java and C++ in a marshaling/unmarshaling process.
- **No thread safety:** JNI is not thread-safe. Thus, it is not possible to use the same JNI environment `(JNIEnv *)` from multiple threads.


## Java Reflection API

The [Java Reflection API](https://docs.oracle.com/javase/tutorial/reflect/) allows inspecting, modifying, and instantiating otherwise static language elements such as classes, fields, and methods at runtime.
This dynamic feature is handy when we don't know their names at compile time.
For example, to dynamically instantiate objects, set fields, or invoke methods.

For example, we can instantiate classes by calling constructors of any class and even instantiate objects at runtime.
This is made possible by the `java.lang.reflect.Constructor` class.

The following class `Instantiation` illustrates the use of **dynamic class instantiation** via reflection:

{% highlight java linenos %}
public class Instantiation {
 
  /**
   * Instantiate a class via reflection.
   * The inner class Target has a "default constructor" which takes 
   * an instance of its outer class.
   */
  public void instantiateCtr() throws Exception {
    Class<Target> c = Target.class;
    c.getConstructor(Instantiation.class).newInstance(this);
  }

  /**
   * Instantiate a class via reflection.
   * The inner class Target has a constructor with one String parameter.
   */
  public void instantiateCtrOverloaded() throws Exception {
    Class<Target> c = Target.class;
    c.getConstructor(new Class[]{Instantiation.class, String.class})
      .newInstance(this, "hello");
  }

  /**
   * Interprocedural instantiation.
   * The class name is supplied externally.
   */
  public void instantiateInterprocedural() throws Exception {
    BufferedReader br = new BufferedReader(
        new FileReader(this.getClass().getClassLoader()
          .getResource("class.txt").getFile())
    );
    Class<?> c = Class.forName(br.readLine());
    c.getConstructor(Instantiation.class).newInstance(this);
  }

  /**
   * Intraprocedural instantiation.
   * The class name is supplied internally.
   */
  public void instantiateIntraprocedural() throws Exception {
    String className = new StringBuilder("tegraT").reverse().toString();
    Class<?> c = Class.forName(
      "se.kth.instantiation.DynamicInstantiation$" + className
    );
    c.getConstructor(Instantiation.class).newInstance(this);
  }

  class Target {
    public Target() {}
    public Target(String c) {}
  }
}
{% endhighlight %}

We can invoke methods of any class (even [`private`](https://www.baeldung.com/java-call-private-method) methods) at runtime.
This is made possible by the `java.lang.reflect.Method` class.

The following class `Invocation` illustrates the use of **dynamic method invocations** via reflection:

{% highlight java linenos %}
public class Invocation {

  /**
   * Invoke a method with no arguments via reflection.
   */
  public void invokeMethod() throws Exception {
    Method m = Invocation.class.getDeclaredMethod("target", null);
    m.invoke(this, null);
  }

  /**
   * Invoke a method via reflection.
   * The method target has a parameter of type String.
   */
  public void invokeMethodOverloaded() throws Exception {
    Method m = Invocation.class.getDeclaredMethod(
      "target", new Class[]{String.class}
    );
    m.invoke(this, "a");
  }

  /**
   * Interprocedural invocation.
   * The method name is supplied externally.
   */
  public void invokeMethodInterprocedural() throws Exception {
    BufferedReader br = new BufferedReader(
        new FileReader(this.getClass().getClassLoader()
          .getResource("method.txt").getFile())
    );
    String methodName = br.readLine();
    Method m = Invocation.class.getDeclaredMethod(methodName, null);
    m.invoke(this, null);
  }

  /**
   * Intraprocedural invocation.
   * The method name is provided through a series of transformations.
   */
  public void invokeMethodIntraprocedural() throws Exception {
    String methodName = new StringBuilder("TEGRAT")
      .reverse().toString().toLowerCase();
    Method m = Invocation.class.getDeclaredMethod(methodName, null);
    m.invoke(this, null);
  }

  public void target() {}
  public void target(String a) {}
}
{% endhighlight %}

## Deserialisation

[Serialization](https://docs.oracle.com/en/java/javase/16/docs/api/java.base/java/io/Serializable.html) converts an object into a byte stream (i.e., a sequence of bytes).
Deserialization is the opposite: it converts a byte stream into an object.
[Serialized objects](https://www.baeldung.com/java-serialization) are typically used to save the application's state, store objects in a database, or transfer them over a network.
We can serialize objects on one platform and deserialize them on another.
The serializability of a class is enabled by implementing the `java.io.Serializable` interface.

The following class `Deserialization` illustrates a deserialization scenario:

{% highlight java linenos %}
public class Deserialization implements Serializable {

  public byte[] serialize(Object obj) throws Exception {
    ByteArrayOutputStream ba = new ByteArrayOutputStream();
    ObjectOutputStream oos = new ObjectOutputStream(ba);
    oos.writeObject(obj);
    oos.close();
    return ba.toByteArray();
  }
  
  public void deserialize(byte[] obj) throws Exception {
    ObjectInputStream ois = new ObjectInputStream(
      new ByteArrayInputStream(obj)
    );
    HelloInterface foo = (HelloInterface) ois.readObject();
    foo.hello();
    ois.close();
  }

  interface HelloInterface {
    void hello();
  }

  class Hello implements HelloInterface, Serializable {
    @Override
    public void hello() {
      System.out.println("hello");
    }
  }
}
{% endhighlight %}

There is an interesting thing to note in the above example.
It turns out that most static analysis tools mark the class `Hello` as "not used."
However, the code will not compile if we remove it.

Deserialization is a potentially dangerous operation.
For example, the notable Apache [log4j](https://github.com/apache/logging-log4j2) library uses deserialization to read configuration files.
This use of deserialization [was exploited]((https://nsfocusglobal.com/apache-log4j-deserialization-and-sql-injection-vulnerability-cve-2022-23302-cve-2022-23305-cve-2022-23307-alert/)) (CVE-2022-23302) in 2022, causing a global disturbance on most Java based systems.

As a rule of thumb, deserialization of untrusted data is inherently dangerous and should be avoided.
Untrusted data should be carefully validated according to the "Serialization and Deserialization" section of the [Secure Coding Guidelines for Java SE](https://docs.oracle.com/pls/topic/lookup?ctx=javase16&id=secure_coding_guidelines_javase). 
As pointed out by Oracle, [Serialization Filtering](https://docs.oracle.com/pls/topic/lookup?ctx=javase16&id=serialization_filter_guide) describes best practices for defensive use of serial filters.

## Unsafe API

The JVM was designed to enforce strong safety guarantees.
However, the class `sun.misc.Unsafe` provides a collection of methods for performing low-level, unsafe operations.

Although the class and all methods are `public`, the use of this class is limited because only trusted code can obtain instances of it.
The class `sun.misc.Unsafe` is `final`, and its constructor is `private`.
Thus, creating an instance requires some tricks.

The following class `UnsafeExamples` illustrates various commons usages:

{% highlight java linenos %}
public class UnsafeExamples {

  Hello greetings;

  /**
   * Dynamic class loading via the Unsafe API.
   * The target class Target is not in the classpath.
   * Target is compiled and loaded at runtime.
   */
  public void instantiateClass() throws Exception {
    byte[] b = compile(this.getClass().getClassLoader(), "unsafe.Target");
    getUnsafe()
        .defineClass(
          "unsafe.Target", b, 0, b.length, this.getClass().getClassLoader(), null
        ).newInstance();
  }

  /**
   * Invoke the Hello.greetings() method without class initialisation.
   */
  public void invokeMethod() throws Exception {
    UnsafeExamples.Hello hello = (Hello) getUnsafe().allocateInstance(Hello.class);
    hello.greetings();
  }

  /**
   * Throw a checked Exception without declaring it
   * in the method contract.
   */
  public void throwException() throws Exception {
    getUnsafe().throwException(new CustomException());
  }

  /**
   * Change the field reference via the unsafe API.
   * This method is supposed to call UnsafeExamples$Hello.greetings(),
   * but the reference value changed to UnsafeExamples$Hi.greetings().
   */
  public void typeConfusion() throws Exception {
    greetings = new Hello();
    getUnsafe().putObject(this,
        getUnsafe().objectFieldOffset(UnsafeExamples.class.getDeclaredField("greetings")),
        new Hi());
    greetings.greetings();
  }

  private sun.misc.Unsafe getUnsafe() throws Exception {
    sun.misc.Unsafe unsafe = null;
    Field f = sun.misc.Unsafe.class.getDeclaredField("theUnsafe");
    f.setAccessible(true);
    unsafe = (sun.misc.Unsafe) f.get(null);
    return unsafe;
  }
  
  private byte[] compile(ClassLoader classLoader, String name) throws IOException {
    // Compile the class (implementation in section "Dynamic Class Loading").
  }

  class Hello { public void greetings() { System.out.println("hello"); } }
  class Hi { public void greetings() { System.out.println("hi"); } }
  class CustomException extends Exception { public CustomException() { super(); } }
}
{% endhighlight %}


Note that the method `getUnsafe()` uses reflection to obtain an instance of `theUnsafe` field of the `sun.misc.Unsafe` class.
We need to use reflection because the `Usafe` class was designed only for internal usage.

The operations that `sun.misc.Unsafe` provides can be dangerous, as they allow developers to circumvent the safety guarantees provided by the Java language and the JVM.
If misused, the consequences can be resource leaks, deadlocks, data corruption, and even JVM crashes.
Therefore, [use it at your own risk](https://dl.acm.org/doi/abs/10.1145/2858965.2814313).

# Challenges of Using Dynamic Features

Java supports Just In Time (JIT) compilation by default.
JIT allows the compiler to “see” frequently accessed code paths and turn them into machine architecture-specific code.
Code that's run frequently enough is adaptively compiled into an architecture-specific form.
This means that the distribution is still a portable JAR that'll run on every operating system.

The Java runtime has grown considerably over the years.
And since Java supports a lot of dynamic behavior, the Java runtime can't be sure about what code is being used, so it loads everything.
This slows down application startup time and balloons the application's RAM footprint.
Also, Java is still ~~mostly~~ interpreted, so it's possible to get parts of the application that run at native speeds.
However, today it is possible to achieve native speeds by compiling Java applications directly to machine code.

For this purpose, Java supports Ahead of Time Compilation (AOT) through the GraalVM compiler.
The AOT mechanism in GraalVM relies on points-to analysis to statically determine the types of variables and the types of objects that are reachable from a given entry point in the application.
It statically analyzes the app and chucks out everything that's not being used at runtime.
It can't possibly know what's being used at runtime when it's compiling the code at compile time, so we need to give it some extra information or hints.
It provides those hints and tells it what things should be retained so that your application can run and so that it can keep only the parts that are required for your application to run.
The results are Java applications that start up in tens of milliseconds and take tens of megabytes of RAM instead of hundreds.
These applications are ideal for a production environment like Kubernetes, which wants to be the best bin packer to cram together all your applications as efficiently as possible to save money and reduce server infrastructure and carbon footprints.
And for the most part, this works great.

However, the problem of using dynamic features is that they make AOT reachability analysis unsound.
Point-to analysis in GraalVM is based on static analysis.
And as we observe from the previous examples, static analysis doesn't know how to handle dynamic features.

To mitigate this problem, GraalVM provides a [tracing agent](https://www.graalvm.org/22.0/reference-manual/native-image/Agent/) that analyses the program at runtime.
It generates configuration files for GraalVM in a way that is straightforward and more convenient.
The agent tracks all usages of dynamic features after a regular execution of an application on the JVM.
Undetected usages of these dynamic features need to be provided to the native-image tool in the form of configuration files.

In GraalVM 22.2, to make it easier to use popular libraries that require additional reachability metadata, the Oracle GraalVM team, in conjunction with the Spring and Quarkus teams, has created a [GitHub repository](https://github.com/oracle/graalvm-reachability-metadata) where metadata for popular libraries can be published.
Using this metadata is as easy as setting a property in the GraalVM Native Build Tools Maven or Gradle plugins.
For example, in Gradle, you can enable the use of the reachability metadata repository with:

{% highlight groovy linenos %}
graalvmNative {
  metadataRepository {
    enabled = true
  }
}
{% endhighlight %}

# Conclusion

This post covered the principal dynamic features of the Java language and the JVM.
As a corollary, we observe that the notions of **actual programs behaviour** and **possible program executions** are not clear concepts in the presence of dynamic features.
This is particularly surprising in the context of Java, which firmly focused on writing code once and running it anywhere with consistent program behavior.
Furthermore, the existence of dynamic features also has implications for the very definitions of soundness and precision of static analysis.
In particular, the point-to analysis in the GraalVM compiler is not sound in the presence of dynamic features.

Personally, I think that the use of dynamic features should be avoided as much as possible.
In most cases, they just cause obfuscation and introduce bugs.
Although these advanced language features might perfectly solve a problem for an expert who knows how to leverage them, powerful features are often more difficult to understand and are not widely used.
Simple, straightforward code that is easy to understand and maintain has a higher value.
I expect that, in the future, developers will be more careful about introducing dynamic behaviors into their applications for the sake of consistency and performance.

# Further Reading

- [Guide to Java Reflection](https://www.baeldung.com/java-reflection)
- [On the Soundness of Call Graph   Construction in the Presence of Dynamic Language Features - A Benchmark and Tool Evaluation](https://link.springer.com/chapter/10.1007/978-3-030-02768-1_4)
- [Challenges for Static Analysis of Java Reflection – Literature Review and Empirical Study](https://dl.acm.org/doi/pdf/10.1109/ICSE.2017.53)
- [Judge: Identifying, Understanding, and Evaluating Sources of Unsoundness in Call Graphs](https://dl.acm.org/doi/10.1145/3293882.3330555)
- [On the Recall of Static Call Graph Construction in Practice](https://ieeexjplore.ieee.org/abstract/document/9283958)
- [A Study of Call Graph Construction for JVM-Hosted Languages](https://ieeexplore.ieee.org/abstract/document/8944149)
- [Identifying Java Calls in Native Code via Binary Scanning](https://dl.acm.org/doi/pdf/10.1145/3395363.3397368)
- [Serialization-Aware Call Graph Construction](https://dl.acm.org/doi/pdf/10.1145/3460946.3464319)
- [A Micro-Benchmark for Dynamic Program Behaviour in Java](https://bitbucket.org/Li_Sui/micro-benchmark/src/master/)

# Footnotes

[^1]: In OpenJDK 9, `invokedynamic` is also used for string concatenation.

