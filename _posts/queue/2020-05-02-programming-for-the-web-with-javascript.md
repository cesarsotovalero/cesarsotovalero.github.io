---
layout: post
title:  Programing for the Web With JavaScript
subtitle: The Language that Browsers Understand
tags: javascript
keywords: javascript, course
description: Personal notes of the EdX course Programing for the web with JavaScript.
published: false
image: ../img/posts/2020/terminal_cover.png
share-img: ../img/posts/2020/terminal_cover.png
show-avatar: false
author: cesarsotovalero
date: 2020/5/23
---


>> "None for now." *― None for now*

# CSS basics

There are three ways to use CSS in an HTML page:

1. using inline `"style"` attributes within each HTML tag
2. using internal CSS in the `<style>` element of the HTML page's header
3. using external CSS in a separate `.css` file that is referred to in the HTML page using the `<link>` tag

# JavaScript basics

## Viewing a variable value

```javascript
document.write("Te courrent date and time is ")
var time = new Date();
document.write(time);
```

```javascript
var age = 12;
console.log(age);
```

## Primitive types

JavaScript has 5 primitive types _Number_, _String_, _Boolean_, _Null_, and _Undefine_.

In JavaScript there a notion of Trusthy and Falsy value. Any value can be use as a boolean, any variable type can become a boolean when used with logical operators.
- "Falsy" values: null, undefined, -, NaN, ''
- "Trusthy" values: "cow", "false", 5, etc.

## Arrays

Arrays in JavaScript can be seen as a list that can grow or shrink dinamically.

### General examples

```javascript
var myArray = ["cars", 12, false];
var age = myArray[1];
console.log(age); // 12
myArray[2] = true;
console.log(2); // true
console.log(myArray.length); // 3
console.log(myArray[4]); // undefined
```

### Array indices

When writing an array value by its index, `arrayVar[index]` will:

- add an element at that index if `index >= arrayVar.length`
- crate a mapping from the index to the element if index < 0

```javascript
myArray[4] = "panda";
console.log(myArray[4]); // "panda"
console.log(myArray[3]); // undefined
myArray[-5] = "elephant";
console.log(myArray[-5]); // "elephant"
```
### Put and remove to the front and end of the array

```javascript
var myArray = ["car", "bike"];
myArray.push("scooter");
console.log(myArray); // car, bike, scooter

myArray.unshift("train")
console.log(myArray); // train, car, bike, scooter

var vehicle = myArray.pop()
console.log(vehicle); // train, car, bike

var vehicle = myArray.shift()
console.log(myArray); // car, bike
```

## Objects

- JavaScript objects are used to store key-value pairs
- Values can be of any type, including arrays and objects
- values can be accessed by `myObject.property` of `myObject["property"]`

```javascript
var person = {
    name: "John Doe",
    age: 25,
    isMale: true,
    personality: ["patient", "loyal"],
    company: {name: "edX", id: 2984}
}
console.log(person.age); // 25
console.log(person["company"].id)
```

- key-value paris can be added to objects, even after their initial declaration

```javascript
var pet = {
    name: "Cooper",
    type: "dog"
}
console.log(pet.age); // undefined
pet.age = 11;
console.log(pet.age); // 11
pet["status"] = "good boy";
console.log(pet.status); // "good boy"
```

Create an empty object:
```javascript
var myObject = {};
```

## Control structures

### Conditionals

Logical operators `===` and `!==` compare value and type.
Objects are only considered equal if the variables are aliases, ie. refer to the same object.

```javascript
var cooper = {age: 11}
var flanders = {age: 11}
if(cooper == flanders) {...} // false!
var myDog = cooper;
if (myDog == cooper) {...} // true!
```

### Loops

```javascript
var n = ...n
var factorial = 1;
// for loop
for (var i=1; i<=n; i++){
   factorial *= i;
}
// while loop
var i = 1;
while (i<=n){
   factorial *= i;
   i++;
}
// do-while loop
var i = 1;
do {
   factorial *= i;
   i++;
} while (i<=n);
```

## Functions

```javascript
function factorial (n) {
   var factorial = 1;
   for (var i=1; i<=n; i++){
      factorial *= i;
   }
   return factorial;
}
```

Applying functions to arrays:

```javascript
// applies the function to
// all elements of the array
var nums = [4, 8, 6];
function print(n) {
   console.log(n);
}
nums.forEach(print);
// if the function is true
// for every element in the array
function isEven(n) {
   return n%2 == 0;
}
nums.every(isEven); // true
// applies a new array with
// function
function square(n){
   return n*n;
}
var squares = nums.map(square); // [16, 68, 36]
```

Primitive arguments are passed by **value**: the function cannot change them:

```javascript
function tryToChange(x){
   x = 4;
}
var y = 11;
tryToChange(y);
console.log(y); // still 11
```

Object arguments are passed by **reference**: the function cannot change them:

```javascript
function tryToChange(obj){
   obj.age++;
}
var p = {age: 30};
tryToChange(p);
console.log(p.age); // now 31
```

### Functions as objects

```javascript
var johnDoe = {
   name : "John Doe",
   age: 32,
   greeting: function(){
      return "Hello!";
   }
}
console.log(johnDoe.greeting())
```

### Object prototypes

- Every object in JavaScript has a prototype, accessed from the __proto\__ property in the object.
- The __proto\__ property is also an object, with its own __proto\__ property and so on
- The root prototype of all objects is `Object.prototype`
- An object inherits the properties of is prototype

We can thinks of this as a class definition, although is not exactly the same.

```javascript
function Person (name, age) {// prototype
   this.name = name;
   this.age = age;
   greeting: function(){
      return "Hello! my name is" + this.name;
   }
}
var johnDoe = new Person("John Doe", 32);
johnDoe.greeting();//"Hello! my name is John Doe
```

### Extending a prototype

```javascript
function Student (name, age, school){
   this.__proto__ = new Person(name, age);
   this.school = school;
}
var sarahBrown = new Student("Sarah Brown", 17, "PennX");
sarahBrown instanceof Person; // true
```

### Prototype properties

Properties and method can be added to prototypes by adding them to the prototype property

```javascript
var Person = function (name, age, occupation){
    this.name = name;
    this.age = age;
    this.occupation = occupation;
}
Person.prototype.planet = "Earth";
Person.prototype.introduction = function (){
   return "I am a " + this.occupation;
}
var johnDoe = new Person("John Doe", 32, "Dentist");
jhohnDoe.planet;// Earth
johnDoe.introduction();// I am a Dentist
```

## Strings

JavaScript string are immutable but provide functions that allow us to create new, modified versions of them.
String have `startWith`, `endsWith`, `includes`, and `search` functions.
We can also use regular expressions' `test` function to check for matches in a string.

Examples:

```javascript
var name = "toucan";
name.length; // 6
name.charAt(3); // 'c'
name[3]; // 'c'
```

We can modify a string but these functions return a new string (since strings are immutable!)


```javascript
var friend = "turtle";
friend.toUpperCase();// "TURTLE"
console.log(friend);// "turtle"

var message = " hello ";
message = message.trim();// "hello"
```

### Regular expressions

- We can specify multiple valid characters that we want to conside for matching

```javascript
var numbers = "5 8 2 5 7 6";
numbers.search(/[012]/); // 4
/[012]/.test(numbers); // true
```

- Or ranges of characters or special characters

```javascript
var password = "password4real";
password.search(/[a-z]/); // 0
password.search(/\d/) // 8
```

- We can combine different ranges

```javascript
var code = "abc123d4e5";
code.search(/[0-9][a-z][0-9]/); // 5
```
- Or look for characters not in a range

```javascript
var chars = "abc123Kd4e5";
code.search(/[^0-9a-z]/); // 6
```

- Quantifiers

```javascript
/[a-z][0-9]?[a-z]/.test("a1b");// true
/[a-z][0-9]?[a-z]/.test("abc");// true
/[a-z][0-9]?[a-z]/.test("a123b");// false
/[a-z][0-9]*[a-z]/.test("a123b");// true
/^[a-z][0-9]/.test("a1b");// true
/^[a-z][0-9]/.test("ab12");// false
/[a-z][0-9]$/.test("123abc");// true
/[a-z][0-9]$/.test("123abc456");// false
```

# Using JavaScript in web pages

## The DOM

The root DOM can be accessed by the object called `document`

```html
<div>
 The current date/time is <span id="dateTime"></span>
</div>
<script>
var dateTimeField = document.getElementById("dateTime");
dateTimeField.innerHTML = new Date();
</script>
```

Date can be stores in the browser across multiple page request using `localStorage`. The following function count the number of times a webpage is loaded.

```html
<div>
 You have visited this page <span id="report"></span> times.
</div>
<script>
var timesVisited = 0;
if(localStorage.timesVisited) { // localStorage does no contain a variable called timesVisited
   timesVisited = parseInt(localStorage.timesVisited);
}
timesVisited += 1;
localStorage.setItem("timesVisited", timesVisited);
var report = document.getElementById("report");
if(timesVisited > 10)
   report.style.backgroundColor = "red";//we can change the style of the element
</script>
```

## Objects as JSON

- JavaScript objects can be converted to a JSON string vi
a `JSON.stringify(myObject)`
- String representations can be onverted back to an object via `JSON.parse(jsonString)`
- All values mus be a string, number, array, boolean, null, or another valid JSON object

A great application of JSON usage is to store JSON strings in local browser storage:

```javascript
localStorage.myJSON = JSON.stringify(myObject);
// ... in a latter session
myObject = JSON.parse(localStorage.myJSON);
```

In summary:

- `document.getElementById('id')` returns the specific HTML element with that ID
- `element.innerHTML` can be modified to change the element's HTML?content
- `element.style` can be modified to change the element's CSS?appearance
- We can use `localStorage` to save values across multiple page requests
- Objects can be converted to string representations known as JSON

Here's a very basic [example of DOM manipulation](https://courses.edx.org/asset-v1:PennX+SD4x+3T2019+type@asset+block/2.7-localstorage).

## DOM events

We can use event-driven programming in JavaScript to modify HTML based on user activity. We do this by defining **callback functions** and associating them with various events by adding event listeners. `element.addEventListener(event, function)`, events: `click`, `mouseover`, `mouseout`, `keyup`.

- The HTML for the button-click example is available [here](https://courses.edx.org/asset-v1:PennX+SD4x+3T2019+type@asset+block/2.8-click).
- The HTML for the mouse-over example is available [here](https://courses.edx.org/asset-v1:PennX+SD4x+3T2019+type@asset+block/2.8-mouse).
- The HTML for the key-press example is available [here](https://courses.edx.org/asset-v1:PennX+SD4x+3T2019+type@asset+block/2.8-key).

## jQuery

Jquery is a powerful library that allows us to select DOM elements using CSS notation. We can then modify their content and appearance programmatically. We can also register event listeners for different elements.

```javascript
<script
    src="https://code.jquery.com/jquery-3.5.1.min.JavaScript"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4yfaTqgFtohetphbbj0="
    crossorigin="anonymous">
</script>
```

In jQuery, $ is used to select DOM elements for manipulation, along with basic CSS element syntax
- `$("*")` selects all elements
- `$("this")` selects the current element
- `$("div")` selects all `<div>`
- `$(".title")` selects all elements with `class="title"`
- `$("#name")` selects the element with `id="name"`

To manipulate DOM content, the general format is `$selector.action(arguments...)`. Examples:
- `$("#name")("Hello");`
- `$("#name").append("World!");`
- `$("#name").addClass("greeting");`
- `$("#name").hide();`
- `$("#name").show();`

To add an event listener to and element, the general format is `(selector).event(callback)`

- The HTML for the button-click example is available [here](https://courses.edx.org/asset-v1:PennX+SD4x+3T2019+type@asset+block/2.9-jquery-click).
- The HTML for the growing list example is available [here](https://courses.edx.org/asset-v1:PennX+SD4x+3T2019+type@asset+block/2.9-jquery-list).
- The HTML for the list item example is available [here](https://courses.edx.org/asset-v1:PennX+SD4x+3T2019+type@asset+block/2.9-jquery-li).


## jQuery event handling

- `$(someNodes).find(selector)` will search `someNodes`' children for selector
- `$` selectors can be chained
  - `$("div.book)` selects the `div` with `class="book"`
  - `$("div, .book")` selects all `divs` and all elements with `class="book"`
- `:` can be used to specify element properties
  - `$("p:hidden")` selects all `<p>` elements that are visually hidden.

- The HTML for the example using the "on" function is available [here](https://courses.edx.org/asset-v1:PennX+SD4x+3T2019+type@asset+block/2.10-jquery-on).

- The HTML for the form example is available [here](https://courses.edx.org/asset-v1:PennX+SD4x+3T2019+type@asset+block/2.11-jquery-form).

- The HTML for the password example is available[here](https://courses.edx.org/asset-v1:PennX+SD4x+3T2019+type@asset+block/2.11-jquery-password).


# Introducing React

- A JavaScript library to building user interfaces.
- HTML page is composed of recyclable, interactive components hat have a lifecycle during which the state of the components changes
- Introduces the notion of VirtualDOM: React identifies the elements in the DOM that are affected by a change and only modifies the part of the DOM that is affected. The process has three steps:
  1. Identify nodes that have changed (**diff**)
  2. Identify nodes that are affected by the change (**reconciliation**
  3. Re-render ONLY the nodes that were affected by the change

There are three steps for using React:
1. Withing the page's HTML, allocate a position on the page in which the desired React component will be rendered, eg. a `div`
2. Create a React component in JavaScript:
  - Establish an initial state
  - Define any events that could change the component's state over its lifecycle
  - Define the function to render the HTML
3. Drop the component into position allocated in Step 1

## JSX

JavaScript XML Syntax Transform. It allows user to write HTML-like tags within JavaScript. It converts HTML to React code.


## Components

React components are JavaScript objects that can be used as HTML elements in the VirtualDOM. A component's `render()` function is used to render its HTML. A component's **properties** are assigned when it is created. A component's **state** can change during its lifecycle. A component's **lifecycle functions** are invoked depending on relevant activities.

### Creating component

```javascript
class HelloComponent extends React.Component {
   render() {
      return (
         <h1>Hello, React!</h1>
      );
   }
}
```

### **Render** component

```javascript
ReactDOM.render(
   <HelloComponent/>,
   document.getElementById('container') // location of the component
);
```

- **Properties** are attributes and values that are set when component is created and should never be modified after initialization

```javascript
ReactDOM.render(
   <HelloUser name="Maria"/>
   document.getElementById("container")
);
```

```javascript
class HelloUser extends React.Component {
   render(){
      <h1>Hello {this.props.name}!</h1> // access the property name in the component
   }
}
```

- **State** are attributes and values that represent the current state off the component, based on what it does/represent, they can be modified during the component's lifecycle

```javascript
class HelloUser extends React.Component {
   constructor(props){
      super(props);
      var timesViewed = 0;
      if(localStorage.timesViewed){
         timesViewed = localStorage.timesViewed;
      }
      timesViewed++;
      this.state = {numViews: timesViewed};
      localStorage.timesViewed = timesViewed;
   }

   render(){
      return <b>{this.state.numViews}</b>;
   }
}
```

```javascript
ReactDOM.render(
   <HelloComponent/>,
   document.getElementById('container') // location of the component
);
```

### Component Lifecycle

The React VirtualDOM invokes callback functions on components finding their lifecycle. These functions fall into three categories: mounting, updating, and unmounting. One can optionally implement these for controlling the component.

Mounting:
- `constructor`: creates component, initializes state based on properties
- `componentWillMount`: invokes before component is added to VirtualDOM
- `componentDidMount`: invoked after component has been added to VirtualDOM and has been rendered
- `componentDidUpdate`: invoked after being rendered

Unmounting:
- componentWillnmount: invoked before component is removed from VirtualDOM and destroyed

The HTML for the TimesViewed example is available [here](https://courses.edx.org/asset-v1:PennX+SD4x+3T2019+type@asset+block/3.2-react-TimesViewed).

# React events

```javascript
class Counter extends React.Component {
  constructor(props) {
    super(props);
    this.state = { count : 0 };
  }
      incrementCount () {
      this.setState({
               count: this.state.count + 1
        });
      }
      render () { // invoked when setState is called
      return (
      <div>Count: { this.state.count }
	    < button type = "button" onClick = { this.incrementCount.bind(this) } > Increment </button> </div>
  );
  }
};

ReactDOM.render(
  <div>
    <Counter />
   </div>,
document.getElementById('container'));
```
