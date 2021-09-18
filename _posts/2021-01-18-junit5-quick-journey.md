---
layout: post
title: JUnit5 annotations
subtitle: A comprehensive description
tags: testing
published: false
image: https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/posts/backyard.gif
share-img: https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/backyard.gif
show-avatar: false
date: 2021/1/18
---

[JUnit5](https://junit.org/junit5) is the 5th of the major testing framework for Java and the JVM.
It provides a lot of new features, enabling different styles of testing.

Video: https://www.youtube.com/watch?v=flpmSXVTqBI&t=1082s
Written tutorial: https://programmingtechie.com/2020/12/26/junit-5-complete-tutorial/

From [this](https://users.encs.concordia.ca/~nikolaos/publications/ICSE_2021.pdf) paper published at ICSE'21 we can read:
(2)Developers: Our findings reveal the usage of test annotations in an ad-hoc manner by some developers. A number of test cases is temporarily disabled until a fix is found;however, the disabled tests are not re-enabled after the fix.Moreover, in several cases, developers are unaware of the features offered by testing frameworks, and thus apply cus-tom suboptimal solutions. These findings indicate the need for educating developers with the best testing practices, and proving recommendation tools to help developers in applying the appropriate test annotations where needed.

# Installation

To start using JUnit, add the following dependency to your Maven `pom.xml`:

{% highlight xml linenos %}
<dependency>
<groupId>org.junit.jupiter</groupId>
<artifactId>junit-jupiter</artifactId>
<version>5.7.0</version>
<scope>test</scope>
</dependency>
{% endhighlight %}

| **Annotation**               | **Location** | **Description**                                                                                                                                                                                                                                                 |
| ---------------------------- | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **@Rule**                    | Field        | @Rule provides a mechanism to enhance tests by running some code around a test case execution, which is similar to fixture and teardown.                                                                                                                        |
| **@Parameterize**            | Field/Method | Test case annotated with @Parameterize can be invoked by using a predefined input (i.e., parameterized test inputs) and expected output.                                                                                                                        |
| **@Test**                    | Method       | @Test indicates that the annotated test code should be executed as a test case. @Test takes optional parameters, such as Timeout to indicate that the test should finish within a given time, or exception to indicate that the test should throw an exception. |
| **@Before/@After**           | Method       | @Before indicates that the annotated test code should be executed as a precondition before each test case (i.e., Database setup). Similarly, @Afterindicates the execution of the annotated test code as a postcondition after each test case.                  |
| **@BeforeClass/@AfterClass** | Method       | @BeforeClass and @AfterClass are similar to @Before and @After annotation types, but indicate the annotated test code to only execute once (i.e.,before or after the test class is invoked).                                                                    |
| **@Ignore**                  | Method/Class | @Ignore indicates that the annotated test case should not execute.                                                                                                                                                                                              |
| **@Category**                | Method/Class | @Category provides a mechanism to label and group tests, giving developers the option to include or exclude groups from execution.                                                                                                                              |
| ------                       | ------       | ------                                                                                                                                                                                                                                                          |

{: .border-bottom-on-table }
