---
layout: post
title:  Dynamic programming
subtitle: A handful of classical problems explained
tags: programming
published: false
image: ../img/posts/word_cloud.jpg
share-img: ../img/posts/word_cloud.jpg
show-avatar: false
date: 2020/4/06
---

https://www.youtube.com/watch?v=oBt53YbR9Kk&t=4700s
Dynamic programming (DP) is one of the basic all-times programming paradigms. 
It refers to simplifying a complicated problem by breaking it down into simpler sub-problems in a recursive manner.
There are two key attributes that a problem must have in order for DP to be applicable: [optimal substructure](https://en.wikipedia.org/wiki/Optimal_substructure) and [overlapping sub-problems](https://en.wikipedia.org/wiki/Overlapping_subproblems).

<aside class="quote">
    <em>DP consists in simplifying a problem by breaking it down into simpler sub-problems recursively.</em>
</aside>


This course was developed by Alvin Zablan for [freeCodeCamp.org](https://www.freecodecamp.org).

# Memoization recipe

1. Make it work
    - visualize the problem as a tree
    - implement the tree using recursion
    - test it
2. Make it efficient
    - add a memo object
    - add a base case to return memo values
    - store return values into the memo

# Fibonacci memoization

{% highlight java linenos %}
static int fib(int n, Map<Integer, Integer> memo) {
      if (memo.containsKey(n)) return memo.get(n);
      if (n <= 2) return 1;
      int value = fib(n - 1, memo) + fib(n - 2, memo);
      memo.put(n, value);
      return memo.get(n);
   }
{% endhighlight %}

# Grid traveler memoization

{% highlight java linenos %}
static long function(int m, int n, Map<String, Long> memo) {
   String key = m + "," + n;
   if (memo.containsKey(key)) return memo.get(key);
   if (n == 1 && m == 1) return 1;
   if (n == 0 || m == 0) return 0;
   memo.put(key, function(n - 1, m, memo) + function(n, m - 1, memo));
   return memo.get(key);
}
{% endhighlight %}


# Can sum memoization

**Description.** Write a function that return _a boolean_ indicating whether it is possible to generate a `targetSum` value by adding number from a given array. Elements of the array are positive integers and can be used as many time as needed. 

{% highlight java linenos %}
static boolean canSum(int targetSum, int[] numbers, Map<Integer, Boolean> memo) {
   if (memo.containsKey(targetSum)) return memo.get(targetSum);
   if (targetSum == 0) return true;
   if (targetSum < 0)  return false;
   for (int number : numbers) {
      int remainder = targetSum - number;
      if (canSum(remainder, numbers, memo)){
         memo.put(targetSum, true);
         return true;
      }
   }
   memo.put(targetSum, false);
   return false;
}
{% endhighlight %}

Time complexity: 
m = target sum
n = array length

brute force: O(n^m) 
memoized: O(m*n)

# How sum memoization

**Description.** Write a function that return an array containing _any combination_ of elements that add up to exactly the `targetSum`. If there is no combination that adds up to the `targetSum`, then return `null`.

{% highlight java linenos %}
static List<Integer> howSum(int targetSum, int[] numbers, Map<Integer, List<Integer>> memo) {
   if (memo.containsKey(targetSum)) return memo.get(targetSum);
   if (targetSum == 0) return new ArrayList<>();
   if (targetSum < 0)  return null;
   for (int number : numbers) {
      int remainder = targetSum - number;
      List<Integer> result = howSum(remainder, numbers, memo);
      if (result != null) {
         result.add(number);
         memo.put(targetSum, result);
         return memo.get(targetSum);
      }
   }
   memo.put(targetSum, null);
   return null;
}
{% endhighlight %}


Time complexity: 
m = target sum
n = array length

brute force: O(n^m * m) 
memoized: O(m*m^2)

# Best sum memoization

**Description.** Write a function that returns an array containing _the shortest combination_ of numbers that add up to exactly the `targetSum`. If there is a tie fo the shortest combination, you may return any one of the shortest.

{% highlight java linenos %}
static List<Integer> bestSum(int targetSum, int[] numbers, Map<Integer, List<Integer>> memo) {
   if (memo.containsKey(targetSum)) return memo.get(targetSum);
   if (targetSum == 0) return new ArrayList<>();
   if (targetSum < 0) return null;
   List<Integer> shortestCombination = null;
   for (int num : numbers) {
      int remainder = targetSum - num;
      List<Integer> remainderCombination = bestSum(remainder, numbers, memo);
      if (remainderCombination != null) {
         List<Integer> combination = new ArrayList<>();
         combination.addAll(remainderCombination);
         combination.add(num);
         if (shortestCombination == null ||
                 combination.size() < shortestCombination.size()) {
            shortestCombination = combination;
         }
      }
   }
   memo.put(targetSum, shortestCombination);
   return shortestCombination;
}
{% endhighlight %}

Time complexity: 
m = target sum
n = array length

brute force: O(n^m * m) 
memoized: O(m*m^2)


# Can construct memoization

**Description**: Write a function that returns _a boolean_ indication whether the `target` string can be constructed by concatenating elements of the `wordBank` array of strings. Elements in `wordBank` can be reused as many times as needed.


{% highlight java linenos %}
static boolean canConstruct(String target, String[] wordBank, Map<String, Boolean> memo) {
   if (memo.containsKey(target)) return memo.get(target);
   if (target.equals("")) return true;
   for (String word : wordBank) {
      if (target.startsWith(word)) {
         String reducedTarget = target.substring(word.length());
         if (canConstruct(reducedTarget, wordBank, memo)) {
            memo.put(reducedTarget, true);
            return true;
         }
      }
   }
   memo.put(target, false);
   return false;
}
{% endhighlight %}

brute force: O(n^m * m) 
memoized: O(m*m^2)

# Count construct memoization

**Description**: Write a function that returns _the number of ways_ that the `target` can be constructed by concatenating elements of the `wordBank` array. Elements in `wordBank` can be reused as many times as needed.

{% highlight java linenos %}
static int countConstruct(String target, String[] wordBank, Map<String, Integer> memo) {
   if (memo.containsKey(target)) return memo.get(target);
   if (target.equals("")) return 1;
   int totalCount = 0;
   for (String word : wordBank) {
      if (target.startsWith(word)) {
         String reducedTarget = target.substring(word.length());
         int numWaysForRest = countConstruct(reducedTarget, wordBank, memo);
         totalCount += numWaysForRest;
      } 
   }
   memo.put(target, totalCount);
   return totalCount;
}
{% endhighlight %}

brute force: O(n^m * m)
memoized: O(m*m^2)

# All construct memoization

**Description**: Write a function that returns a 2D array containing _all the ways_ that the `target` can be constructed by concatenating elements of the `wordBank` array. Each element of the 2D array should represent one combination that constructs the `target`. Elements in `wordBank` can be reused as many times as needed.



{% highlight java linenos %}

{% endhighlight %}

brute force: O(n^m * m)
memoized: O(m*m^2)

# Wrapping up

- **Can sum**: "Can you do it" yes/no -> Decision problem
- **How sum**: "How will you do it" -> Combinatoric problem
- **Best sum**: "What is the best way to do it" -> Optimization problem



