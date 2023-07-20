---
layout: post
title: A Prime on Unit Testing
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

Software testing is perceived as a challenging, time-consuming, redundant, and ~~sometimes~~ tedious activity.
However, testing is necessary to ensure that the applications will work flawlessly and can meet release schedules.
Good developers know how to perform automated testing.
This involves writing the tests and designing them, choosing the type of test, examining adequacy and measuring code coverage, designing for testability, test code quality, and so on.
In this post, I cover these concepts using different examples written in Java.
By the end, you will be able to understand the fundamental concepts of software testing and some of the best testing strategies for different scenarios.
If you are (or want) to become a 5 ⭐️ software developer, QA engineer, or software tester, keep reading.
Testing will never be the same again!

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/walking_alone.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; Doing software development without proper testing dangerous, like running away with no clear direction. Photo of my little son in <a href="https://goo.gl/maps/1awrQ9VeArmtY8Fr5">Tessinparken</a>, where my little son happily plays without caring about anything else.
  </figcaption>
</figure>

# Basic Concepts

For testing we need only 3 things:

1. **Inputs:** Set up the system and test data for the action.
2. **Action:** Trigger a part of the software.
3. **Oracle:** Expects an action from the input.

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