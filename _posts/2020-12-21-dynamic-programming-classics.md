---
layout: post
title:  Dynamic programming
subtitle: A handful of representative problems solved
tags: programming
published: true
image: https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/posts/backyard.png
share-img: https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/backyard.png
show-avatar: false
date: 2020/12/21
---

Dynamic programming (DP) is one of the most basic and, at the same time, challenging programming paradigms.
Some of the best algorithms that I know, such as the [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance) and [DTW](https://en.wikipedia.org/wiki/Dynamic_time_warping) are implemented using this paradigm.
It consists of simplifying a complicated problem by breaking it down into simpler sub-problems in a recursive manner and then using the sub-problems' precomputed solutions to solve the complicated one.
<aside class="quote">
    <em>DP consists in simplifying a problem by breaking it down into simpler sub-problems recursively.</em>
</aside>
The key advantage of using DP is that it is fast.
There are two key attributes that a problem must have in order for DP to be applicable: [optimal substructure](https://en.wikipedia.org/wiki/Optimal_substructure) and [overlapping sub-problems](https://en.wikipedia.org/wiki/Overlapping_subproblems).
In this post, I'll rely on a set of representative DP problems to perform the two basic solution strategies: [memoization](https://en.wikipedia.org/wiki/Memoization) and tabulation. 
These problems are presented and explained by Alvin Zablan, in [this](https://www.youtube.com/watch?v=oBt53YbR9Kk&t=4700s) excellent video that he prepared for [freeCodeCamp.org](https://www.freecodecamp.org).
I have written my own solutions to the problems in Java.

<figure class="jb_picture">
  {% responsive_image path: img/posts/backyard.png alt: "Trees getting prepared for the winter in Stockholm" %}
  <figcaption class="stroke">
    &#169; Trees getting prepared for the winter in Stockholm
    </figcaption>
</figure>

# Strategies

The first indication that we are dealing with a DP problem is noticing overlapping sub-problems. Then, one has to decide what the trivially smallest input is. Depending on the implementation strategy to use, memoization (recursive) or tabulation (iterative), there are recipes that one can follow to address DP problems. For the memoization strategy, the most challenging step is to visualize the problem as a tree. When using the tabulation, finding the proper way to iterate through the table is usually the most challenging task.

### Memoization

1. Make it work
    - visualize the problem as a tree (**hard**)
    - implement the tree using recursion
    - test it
2. Make it efficient
    - add a memo object
    - add a base case to return memo values
    - store return values into the memo

### Tabulation

1. Visualize the problem as a table 
2. Size the size of the table based on the inputs
3. Initialize the table with default values
4. Seed the trivial answer into the table
5. Iterate through the table (**hard**)
6. Fill further positions based on the current position

# Problems

* [Fibonacci](#fibonacci) ("What is the best way to do it?" -> Optimization problem)
  * [Memoization solution](#memoization-solution)
  * [Tabulation solution](#tabulation-solution)
* [Grid traveler](#grid-traveler) ("How will you do it?" -> Combinatoric problem)
  * [Memoization solution](#memoization-solution-1)
  * [Tabulation solution](#tabulation-solution-1)
* [Can sum](#can-sum) ("Can you do it?" -> Decision problem)
  * [Memoization solution](#memoization-solution-2)
  * [Tabulation solution](#tabulation-solution-2)
* [How sum](#how-sum) ("How will you do it?" -> Combinatoric problem)
  * [Memoization solution](#memoization-solution-3)
  * [Tabulation solution](#tabulation-solution-3)
* [Best sum](#best-sum) ("What is the best way to do it?" -> Optimization problem)
  * [Memoization solution](#memoization-solution-4)
  * [Tabulation solution](#tabulation-solution-4)
* [Can construct](#can-construct) ("Can you do it?" -> Decision problem)
  * [Memoization solution](#memoization-solution-5)
  * [Tabulation solution](#tabulation-solution-5)
* [Count construct](#count-construct) ("How will you do it?" -> Combinatoric problem)
  * [Memoization solution](#memoization-solution-6)
  * [Tabulation solution](#tabulation-solution-6)
* [All construct](#all-construct) ("In how many ways can you do it?" -> Combinatoric problem)
  * [Memoization solution](#memoization-solution-7)
  * [Tabulation solution](#tabulation-solution-7)


# Fibonacci

**Description:** Write a function that returns the n-th number of the fibonacci sequence. 
To generate the next number of the sequence, we sum the previous two. For example, these are the first 10 fibonacci numbers:

| **n** | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| **fib(n)** | 0 | 1 | 1 | 2 | 3 | 5 | 8 | 13 | 21 | 34 | 55 |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
{: .border-bottom-on-table  }

**Example:**
{% highlight java %}
Input: fib(8)
Output: 21
{% endhighlight %}

### Memoization solution

{% highlight java linenos %}
static int fib(int n, Map<Integer, Integer> memo) {
   if (memo.containsKey(n)) return memo.get(n);
   if (n <= 2) return 1;
   int value = fib(n - 1, memo) + fib(n - 2, memo);
   memo.put(n, value);
   return memo.get(n);
}
{% endhighlight %}

### Tabulation solution

{% highlight java linenos %}
static int fib(int n) {
   List<Integer> l = new ArrayList(Collections.nCopies(n + 2, 0));
   l.set(1, 1);
   for (int i = 0; i < n; i++) {
      l.set(i + 1, l.get(i) + l.get(i + 1));
      l.set(i + 2, l.get(i) + l.get(i + 2));
   }
   return l.get(n);
}
{% endhighlight %}

# Grid traveler

**Description:** You are a traveler on a 2D grid. You begin in the top-left corner and your goal is to travel to the bottom-right corner. You may only move down or right. In how many ways can you travel to the goal on a grid with dimensions `n`*`m`.

**Example:**
{% highlight java %}
Input: gridTraveler(2, 3)
Output: 3
{% endhighlight %}

### Memoization solution

{% highlight java linenos %}
static long gridTraveler(int m, int n, Map<String, Long> memo) {
   String key = m + "," + n;
   if (memo.containsKey(key)) return memo.get(key);
   if (n == 1 && m == 1) return 1;
   if (n == 0 || m == 0) return 0;
   memo.put(key, function(n - 1, m, memo) + function(n, m - 1, memo));
   return memo.get(key);
}
{% endhighlight %}

### Tabulation solution

{% highlight java linenos %}
static long gridTraveler(int m, int n) {
   long[][] table = new long[m + 1][n + 1];
   table[1][1] = 1;
   for (int i = 0; i <= m; i++) {
      for (int j = 0; j <= n; j++) {
         long current = table[i][j];
         if (i + 1 <= m) table[i + 1][j] += current;
         if (j + 1 <= n) table[i][j + 1] += current;
      }
   }
   return table[m][n];
}
{% endhighlight %}

# Can sum 

**Description:** Write a function that return _a boolean_ indicating whether it is possible to generate a `targetSum` value by adding number from a given array. Elements of the array are positive integers and can be used as many time as needed.

**Example:**
{% highlight java %}
Input: canSum(7, new int[]{5, 3, 4, 7})
Output: true
{% endhighlight %}

### Memoization solution

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

<!--
Time complexity: 
m = target sum
n = array length

brute force: O(n^m) 
memoized: O(m*n)
-->

### Tabulation solution

{% highlight java linenos %}
static boolean canSum(int targetSum, int[] numbers) {
   boolean[] table = new boolean[targetSum + 1];
   table[0] = true;
   for (int i = 0; i < table.length; i++) {
      if (table[i]) {
         for (Integer num : numbers) {
            if (i + num < table.length) {
               table[i + num] = true;
            }
         }
      }
   }
   return table[targetSum];
}
{% endhighlight %}


# How sum

**Description:** Write a function that return an array containing _any combination_ of elements that add up to exactly the `targetSum`. If there is no combination that adds up to the `targetSum`, then return `null`.

**Example:**
{% highlight java %}
Input: howSum(7, new int[]{5, 3, 4, 7})
Output: [3, 4] // or [7]
{% endhighlight %}

### Memoization solution

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

<!--
Time complexity: 
m = target sum
n = array length

brute force: O(n^m * m) 
memoized: O(m*m^2)
-->

### Tabulation solution

{% highlight java linenos %}
static List<Integer> howSum(int targetSum, int[] numbers) {
   // Initialize a list of null elements except the first element
   List<List<Integer>> table = new ArrayList<>(targetSum + 1);
   table.add(0, new ArrayList<>());
   for (int i = 1; i < targetSum; i++) {
      table.add(i, null);
   }
   // Algorithm
   for (int i = 0; i < targetSum; i++) {
      if (table.get(i) != null) {
         for (int j = 0; j < numbers.length; j++) {
            Integer num = numbers[j];
            List<Integer> l = new ArrayList<>(table.get(i));
            l.add(num);
            table.add(i + num, l);
         }
      }
   }
   return table.get(targetSum);
}
{% endhighlight %}


# Best sum

**Description:** Write a function that returns an array containing _the shortest combination_ of numbers that add up to exactly the `targetSum`. If there is a tie fo the shortest combination, you may return any one of the shortest.

**Example:**
{% highlight java %}
Input: bestSum(7, new int[]{5, 3, 4, 7})
Output: [7]
{% endhighlight %}

### Memoization solution

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

<!--
Time complexity: 
m = target sum
n = array length

brute force: O(n^m * m) 
memoized: O(m*m^2)
-->


### Tabulation solution

{% highlight java linenos %}
static List<Integer> bestSum(int targetSum, int[] numbers) {
   // Initialize a list of null elements except the first element
   List<List<Integer>> table = new ArrayList<>(targetSum + 1);
   table.add(0, new ArrayList<>());
   for (int i = 1; i <= targetSum; i++) {
      table.add(i, null);
   }
   // Algorithm
   for (int i = 0; i < targetSum; i++) {
      if (table.get(i) != null) {
         for (int j = 0; j < numbers.length; j++) {
            int num = numbers[j];
            List<Integer> combination = new ArrayList<>(table.get(i));
            combination.add(num);
            if (i + num <= targetSum) {
               if (table.get(i + num) == null) {
                  table.set(i + num, combination);
               } else if (combination.size() < table.get(i + num).size()) {
                  table.set(i + num, combination);
               }
            }
         }
      }
   }
   return table.get(targetSum);
} 
{% endhighlight %}

# Can construct

**Description:** Write a function that returns _a boolean_ indication whether the `target` string can be constructed by concatenating elements of the `wordBank` array of strings. Elements in `wordBank` can be reused as many times as needed.

**Example:**
{% highlight java %}
Input: canConstruct("abcdef", new String[]{"ab", "abc", "cd", "def", "abcd"}) 
Output: true
{% endhighlight %}

### Memoization solution

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

<!--
brute force: O(n^m * m) 
memoized: O(m*m^2)
-->

### Tabulation solution

{% highlight java linenos %}
static boolean canConstruct(String target, String[] wordBank) {
   // Initialize a list of false boolean elements except the first element
   List<Boolean> table = new ArrayList<>();
   for (int i = 0; i < target.length() + 1; i++) {
      table.add(i, false);
   }
   table.set(0, true);
   // Algorithm
   for (int i = 0; i < table.size(); i++) {
      if (table.get(i)) {
         for (String word : wordBank) {
            // if the word matches the characters starting at position i
            if (target.startsWith(word, i)) {
               table.set(i + word.length(), true);
            }
         }
      }
   }
   return table.get(target.length());
}
{% endhighlight %}

# Count construct 

**Description:** Write a function that returns _the number of ways_ that the `target` can be constructed by concatenating elements of the `wordBank` array. Elements in `wordBank` can be reused as many times as needed.

**Example:**
{% highlight java %}
Input: countConstruct("purple", new String[]{"purp", "p", "ur", "le", "purpl"})
Output: 2
{% endhighlight %}

### Memoization solution

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

<!--
brute force: O(n^m * m)
memoized: O(m*m^2)
-->

### Tabulation solution

{% highlight java linenos %} 
static int countConstruct(String target, String[] wordBank) {
   // Initialize a list of integer elements with zero except the first element
   List<Integer> table = new ArrayList<>();
   for (int i = 0; i < target.length() + 1; i++) {
      table.add(i, 0);
   }
   table.set(0, 1);
   // Algorithm
   for (int i = 0; i < table.size(); i++) {
      for (String word : wordBank) {
         if (target.startsWith(word, i)) {
            int valueAtCurrentPosition = i + word.length();
            table.set(valueAtCurrentPosition, table.get(i) + table.get(valueAtCurrentPosition));
         }
      }
   }
   return table.get(target.length());
}
{% endhighlight %}

# All construct

**Description:** Write a function that returns a 2D array containing _all the ways_ that the `target` can be constructed by concatenating elements of the `wordBank` array. Each element of the 2D array should represent one combination that constructs the `target`. Elements in `wordBank` can be reused as many times as needed.

**Example:**
{% highlight java %}
Input: allConstruct("abcdef", new String[]{"ab", "abc", "cd", "def", "abcd", "ef", "c"})
Output: {["ab", "cd", "ef"],
         ["ab", "c", "def"],
         ["abc", "def"],
         ["abcd", "ef"]
        }
{% endhighlight %}

### Memoization solution

{% highlight java linenos %}
static List<List<String>> allConstruct(String target, String[] wordBank, Map<String, List<List<String>>> memo) {
   if(memo.containsKey(target)) return memo.get(target);
   if (target.equals("")) {
      List<List<String>> tmp = new ArrayList<>();
      List<String> list = new ArrayList<>();
      tmp.add(list);
      return tmp; // a list with one element [[]]
   }
   List<List<String>> result = new ArrayList<>();
   for (String word : wordBank) {
      if (target.startsWith(word)) {
         String suffix = target.substring(word.length());
         List<List<String>> suffixWays = allConstruct(suffix, wordBank, memo);
         List<List<String>> targetWays = new ArrayList<>();
         for (List<String> suffixWay : suffixWays) {
            List<String> tmp = new ArrayList<>(suffixWay);
            tmp.add(0, word);
            targetWays.add(tmp);
         }
         result.addAll(targetWays);
      }
   }
   memo.put(target, result);
   return result;
}
{% endhighlight %}

<!--
brute force: O(n^m * m)
memoized: O(m*m^2)
-->

### Tabulation solution

{% highlight java linenos %} 
static List<List<String>> allConstruct(String target, String[] wordBank) {
   // Initialize a list of lists representing each combination of words from wordBank
   List<List<List<String>>> table = new ArrayList<>();
   for (int i = 0; i < target.length() + 1; i++) {
      table.add(i, new ArrayList<>());
   }
   table.get(0).add(0, new ArrayList<>());
   // Algorithm
   for (int i = 0; i < table.size(); i++) {
      for (String word : wordBank) {
         if (target.startsWith(word, i)) {
            List<List<String>> combinations = new ArrayList<>();
            for (List<String> combination : table.get(i)) {
               combinations.add(new ArrayList<>(combination));
            }
            for (List<String> combination : combinations) {
               combination.add(word);
            }
            for (List<String> combination : combinations) {
               table.get(i + word.length()).add(combination);
            }
         }
      }
   }
   return table.get(target.length());
}
{% endhighlight %}