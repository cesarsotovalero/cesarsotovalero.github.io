---
layout: post
title: Revisiting Ken Thompson’s Reflection on Trusting Trust 
subtitle: 40 years later
tags: security
description: |
  TODO
keywords:
  - Ken Thompson
  - Compiler security
  - Trojan horse
  - Self-replicating code
  - Understanding software supply chain attacks
image: ../img/posts/img-placeholder_cover.webp
share-img: ../img/posts/img-placeholder_cover.webp
show-avatar: false
toc: true
mathjax: false
date: 2023/12/27
author: cesarsotovalero
published: false
---

[//]: # (I'm solving the problem of developers not realizing the implications of trusting compilers and other foundational tools in the software development process. )
[//]: # (The benefits of solving this problem are raising awareness about the risks associated with compromised tools and encouraging secure development practices. )
[//]: # (The emotion I'm generating is curiosity and caution.)

Cybersecurity threats are everywhere these days.
I hear about them in tech events, seminars, and even in the news.
From ransomware attacks to data breaches, the risks of cyber threats are ever-present.
In most cases, we assume the existence of a malicious actor trying to exploit vulnerabilities in our systems.
The sophistication of attacks increases at the same peace as the complexity of software.
Which each new feature, the threat exposure grows.
In particular, the [software supply chain](../blog/the-software-supply-chain.html) has become a prime target for attackers.
Indeed, it's not difficult today foreseeing large-scale attacks on software repositories or package managers.
But... what if the threats were (already) hidden in the tools we use (and trust) to build the software itself? 
Or in other words: to what extent do you trust the output of your favorite compiler?
This is the question that Ken Thompson, co-creator of Unix, raised in his 1984 Turing Award lecture.
I find the assertion he made absolutely fascinating.
For its implications, "Reflections on Trusting Trust" could be one of the most bold and thought-provoking ideas in the history of cybersecurity. 
So let's revisit Thompson's reflection, 40 years later.

# IMAGE
<figure class="jb_picture">
  {% responsive_image width: "100%" border: "0px solid #808080" path: img/posts/img-placeholder.png alt: "TODO" %}
  <figcaption class="stroke"> 
    &#169; TODO
  </figcaption>
</figure>

# What Thomson Really Said?

## Self-Replicating Code

Discusses the concept introduced by Thompson where a compiler can be modified to insert malicious code during the compilation process without altering the source code.

Creating a self-replicating code example in Java, especially one that mimics the Trojan Horse compiler concept described by Ken Thompson, is a complex and potentially dangerous exercise. However, we can outline a simplified, conceptual demonstration for educational purposes. The example will illustrate how a modified compiler could inject malicious behavior into a Java program.

### Step-by-Step Example

#### Step 1: Understand the Concept
The basic idea is that a compiler (javac) can be modified to insert malicious code into any program it compiles, even if the original source code is clean. This requires:
1. A modified version of the Java compiler (javac).
2. A demonstration Java program that shows the injected behavior.

#### Step 2: Create a Simple Java Program
Let's start with a simple Java program that prints "Hello, World!".

```java
// HelloWorld.java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

#### Step 3: Modify the Java Compiler
This step involves modifying the javac compiler to inject malicious code. We'll demonstrate this conceptually, as modifying a real compiler is both complex and ethically questionable without proper authorization.

1. **Identify the Compilation Process:**
  - Find the part of the javac source code that handles the generation of the bytecode for the `main` method.

2. **Inject Malicious Code:**
  - Modify the compiler to insert additional instructions that execute malicious behavior, such as printing an unauthorized message or performing an unexpected action.

Conceptual pseudo-code for the modified compiler:

```java
// Pseudo-code for a modified compiler
public class ModifiedCompiler {
    public void compile(String sourceCode) {
        // Parse the source code
        // Generate bytecode for the main method
        if (sourceCode.contains("public static void main")) {
            // Inject malicious behavior
            String maliciousCode = "System.out.println(\"Injected by malicious compiler!\");";
            // Add the malicious code to the bytecode
            // (This is a simplified representation)
            sourceCode = injectMaliciousCode(sourceCode, maliciousCode);
        }
        // Continue with the normal compilation process
    }

    private String injectMaliciousCode(String sourceCode, String maliciousCode) {
        // Insert the malicious code into the main method
        int mainMethodIndex = sourceCode.indexOf("public static void main");
        int insertionPoint = sourceCode.indexOf("{", mainMethodIndex) + 1;
        return sourceCode.substring(0, insertionPoint) + "\n" + maliciousCode + sourceCode.substring(insertionPoint);
    }
}
```

#### Step 4: Compile the Java Program with the Modified Compiler
Assume we have the modified compiler in place. Now we compile `HelloWorld.java` using this compiler.

```bash
javac -cp . ModifiedCompiler HelloWorld.java
```

#### Step 5: Run the Compiled Program
After compiling, running the program would exhibit the injected behavior.

```bash
java HelloWorld
```

Expected output:

```
Hello, World!
Injected by malicious compiler!
```

### Important Considerations
1. **Ethics and Legality:** Modifying compilers to inject code is unethical and illegal without proper authorization and context. This example is purely educational.
2. **Complexity:** A real-world implementation of this concept would be significantly more complex, involving deep understanding of compiler design and bytecode manipulation.
3. **Security Practices:** This example underscores the importance of secure compiler development and rigorous code audits to prevent such vulnerabilities.

### Conclusion
This simplified example demonstrates the concept of self-replicating code and the Trojan Horse compiler. It highlights the potential risks associated with trusting software tools and emphasizes the need for secure development practices and vigilant code review processes.

## Trojan Horse Compiler

Explains how Thompson demonstrated a Trojan Horse attack by embedding a backdoor in the Unix login command that could propagate itself invisibly via the compiler.

## Example

Illustrates the attack by showing how the compiler can be modified to insert a backdoor in the login command, which would then propagate itself to the compiler.

# Implications

## Software Supply Chain Attacks

Explores how Thompson’s work laid the foundation for understanding software supply chain attacks, emphasizing the importance of securing compilers and other foundational tools.

## Trust and Verification

Explores the implications of Thompson’s work on the software development lifecycle, emphasizing the need for trust and rigorous verification mechanisms.

## Current Challenges

Analyzes the difficulty in detecting malicious modifications in compilers and other foundational software tools, given their deep integration into the system.

# Conclusions

Concludes with thoughts on the continuing relevance of trust in software development and the ongoing efforts to secure software against sophisticated attacks.

# External Resources

# Footnotes



