---
layout: post
title: Fundamental Concepts of Unit Testing
subtitle: With examples in Java
tags: tools
description: TODO
keywords:
  - JUnit 5,
  - mocking in Java,
  - Oracle in software testing,
  - Stubbing
image: ../img/posts/2022/walking_alone_cover.jpg
share-img: ../img/posts/2022/walking_alone_cover.jpg
show-avatar: false
toc: true
date: 2022/06/13
author: cesarsotovalero
published: false
---

Software testinggets a bad rap for being difficult, time-consuming, redundant, and above all - boring. But in fact, it is a proven way to ensure that your software will work flawlessly andcan meet release schedules.
In a two-course series, we will teach you automated software testing in an inspiring way. We will show you that testing is not as daunting a task as you might think, and how automated testing will make you a better developer who programs excellent software.
This first course will teach you specification-based testing, boundary testing, test adequacy and code coverage, unit vs system testing, mock objects, design for testability, and test code quality.
This is a highly practical course. Throughout the lessons, you will test various programs by means of different techniques. By the end, you will be able to choose the best testing strategies for different projects.
If you are or want to become a five-star software developer, QA engineer, or software tester, join this course. Testing will never be the same again!

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/walking_alone.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; Doing software development without proper testing dangerous, like running away with no clear direction. Photo of my little son in <a href="https://goo.gl/maps/1awrQ9VeArmtY8Fr5">Tessinparken</a>, where my little son happily plays without caring about anything else.
  </figcaption>
</figure>

# Basic Concepts

## Oracle

> The oracle in a unit test specifies a behavior that is ex as a consequence of running the MUT with a specific test input.

## Assertions

## Mocking

1. Mocking
2. Stubbing
3. Verifying

## Mocking

Be able to apply mock objects in order to unit test a class.
Understand when not to apply mock objects and go for integration tests.

Real objects can be replaced with “fake” implementations called mocks. 

> “Mocking is a mechanism to replace real objects with skeletal implementations that mimic them.” -- [Thomas and Hunt](https://ieeexplore.ieee.org/document/1003449)

## Stubbing

Mocked objects can be stubbed to produce tailored behavior. 

> “Stubbing is the process of initializing a mock object to behave in specific, pre-determined ways.” -- [Martin Fowler](https://martinfowler.com/articles/mocksArentStubs.html)

## Verifying

The  interactions made with the mocks can be verified, such as the number of times  they were triggered with a given input, and in a specific sequence.

> “Verifying a mocked object consists of assessing its behavior for a particular stub.” [Beckman et al.](https://link.springer.com/chapter/10.1007/978-3-642-22655-7_2)


# Advanced Concepts

## Code Coverage

Be able to use the most popular structural testing adequacy criteria, such as line coverage, branch coverage, and path coverage as well as to understand their differences.
Derive a minimal set of tests when your branches (e.g., ifs) are too complex.
Use a standard industry code coverage tool and interpret its results.

## Mutation Testing

## Property-Based Testing

## Automated Test Generation


## Flaky Tests

Understand and avoid flaky tests.

# Conclusion

How to test any software system using current state-of-the-arttechniques
How to derive test cases that deal with exceptional, corner, and bad-weather cases by means of several different techniques
The limitations of current testing techniques and how to decide on the best testing strategies for a given context
How to develop testable architectures and to write maintainable test code

# Footnotes

TODO