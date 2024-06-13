---
layout: post
title: Revisiting Ken Thompson’s Reflection on Trusting Trust 
subtitle: One of the most chilling ideas in cybersecurity's history
tags: security
description: |
  TODO
keywords:
  - Ken Thompson
  - Compiler security
  - Trojan horse
  - Self-replicating code
  - Understanding software supply chain attacks
image: ../img/posts/2023/2023-12-27/cross_t_centralen_cover.jpg
share-img: ../img/posts/2023/2023-12-27/cross_t_centralen_cover.jpg
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

Let me ask: 
Would you trust a cracked version of [Adobe Photoshop](https://en.wikipedia.org/wiki/Adobe_Photoshop) downloaded from a random website?
I hope your answer is a radical "no."
But what if I ask you instead:
Do you trust the latest financial transaction processed by your bank's mobile app?
You probably do believe that your payment will be processed securely.
Certainly, our sense of "trust" in a software application varies significantly depending on its origins, and on the reputation of its distributor.
Now, what if I tell you that there exists certain "proof" that **no matter the what the software origin is, you should never trust it**?
This is, in essence, what Ken Thompson claimed during his Turing Award lecture, in 1984.
In his article "Reflections on Trusting Trust," Thompson demonstrated that you cannot trust code that you did not totally create yourself.
His proof was based on the idea that it is possible to insert a [backdoor](https://en.wikipedia.org/wiki/Backdoor_(computing)) into a compiler that would propagate itself invisibly into all programs compiled with it (including next versions of the same compiler).
Thus, creating a self-replicating chain of compromised software applications.
The "Trojan Horse compiler," as he call it, highlights the fundamental issue of trust in software development, independent of the software's origin or reputation of its vendor.
In this post, I'll revisit this famous proof of distrust in software development, 40 years later.
My goal is to reflect on the transcendence of its core message and dig a little bit into the implications it poses to the security of the software development landscape as we know it today.
Let's dig in.

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "0px solid #808080" path: img/posts/2023/2023-12-27/cross_t_centralen.jpg alt: "TODO" %}
  <figcaption class="stroke"> 
    &#169; The legend tells: there's always a backdoor! Photo from Stockholm's <a href="https://goo.gl/maps/57JsiWkcPKBbXWve8">Central Station</a>.
  </figcaption>
</figure>

# What Is It All About?

{% badge /img/badges/first-page-of-reflections-on-trusting-trust.png 140 https://dl.acm.org/doi/10.1145/358198.358210 %}

[Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson) is a prolific Computer Scientist known for being one of the original creators of the UNIX operating system, along with [Dennis Ritchie](https://en.wikipedia.org/wiki/Dennis_Ritchie) in the early 70s.
He created the B programming language, a [precursor](https://www.bell-labs.com/usr/dmr/www/chist.html) to the C programming language.
Thompson and Ritchie received the Turing Award in 1983 "for their development of generic operating systems theory and specifically for the implementation of the UNIX operating system."

## The Concept of Self-Replicating Code

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

# Why Is This important?

Cybersecurity threats are everywhere these days.
I hear about them everywhere: in tech media, at events, and more and more in the public news.
From ransomware attacks[^1] to data breaches, the risks of cyber threats are real and growing.
The sophistication of attacks increases at the same peace as the complexity of software does.
And with every new added feature, the threat exposure grows.

> "An open-source software supply chain attack is the nefarious alteration of a trusted open-source component used later in a trusted program."

In most cases, we assume the existence of a malicious actor trying to exploit vulnerabilities in our systems.
In particular, the [software supply chain](../blog/the-software-supply-chain.html) has become a prime target for attackers.
Indeed, it's not difficult today foreseeing large-scale attacks on software repositories or package managers.
But... what if the threats were (already) hidden in the tools we use (and trust) to build the software itself?
Or in other words: to what extent do you trust the output of your favorite compiler?
This is the question that Ken Thompson, co-creator of Unix, raised in his 1984 during Turing Award lecture.

In this talk, Thompson brilliantly demonstrates that "You can't trust code that you did not totally create yourself."
I the way he proved this assertion made absolutely fascinating.
Forty years ago, open source software was not as prevalent as it is today.
There were no package managers, no GitHub, no GitLab, no Bitbucket.
Yet, he foresaw the risks of trusting software tools and compilers.

Today, creating software from scratch is not a realistic option.
Every component, every library, every tool we use in the software development is composed of open source code, libraries, and compilers.
For its implications, "Reflections on Trusting Trust" could be one of the most bold and thought-provoking ideas in the history of cybersecurity.


# Conclusions

Concludes with thoughts on the continuing relevance of trust in software development and the ongoing efforts to secure software against sophisticated attacks.

<figure class="jb_picture">
  {% responsive_image width: "100%" border: "1px solid #808080" path: img/posts/2023/2023-12-27/kent-thompson-moral.png alt: "Kent Thompson's moral" %}
  <figcaption class="stroke"> 
    Say again: "You can't trust code that you did not totally create yourself."
  </figcaption>
</figure>

# External Resources

- [Running the “Reflections on Trusting Trust” Compiler](https://research.swtch.com/nih)
- [Open Source Supply Chain Security at Google](https://research.swtch.com/acmscored)

# Footnotes

[^1]: Ransomware attacks are one the most common these days. The attacker encrypts the victim's data and demands a ransom for its release. The surge of untraceable cryptocurrencies such as Bitcoin has made it easier for attackers to demand and receive payments without being identified.



