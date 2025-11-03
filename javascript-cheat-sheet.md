# JavaScript Interview Cheat Sheet

## Variable Declaration
```javascript
let x = 5;           // Block-scoped, can reassign
const y = 10;        // Block-scoped, cannot reassign
var z = 15;          // Function-scoped (avoid in interviews)
```

## Data Structures

### Arrays
```javascript
const arr = [1, 2, 3];
arr.push(4);                    // Add to end - O(1)
arr.pop();                      // Remove from end - O(1)
arr.unshift(0);                 // Add to start - O(n)
arr.shift();                    // Remove from start - O(n)
arr.splice(index, deleteCount); // Remove/insert - O(n)
arr.slice(start, end);          // Copy subarray - O(n)
arr.length;                     // Get length
```

### Objects / Hash Maps
```javascript
const obj = { key: 'value' };
obj.key;                        // Access
obj['key'];                     // Access with bracket notation
obj.newKey = 'value';           // Add/update
delete obj.key;                 // Remove
'key' in obj;                   // Check existence
Object.keys(obj);               // Get all keys
Object.values(obj);             // Get all values
Object.entries(obj);            // Get [key, value] pairs
```

### Map (Better for hash tables)
```javascript
const map = new Map();
map.set(key, value);            // O(1) average
map.get(key);                   // O(1) average
map.has(key);                   // O(1) average
map.delete(key);                // O(1) average
map.size;                       // Get size
map.clear();                    // Remove all
map.keys();                     // Iterator of keys
map.values();                   // Iterator of values
map.entries();                  // Iterator of [key, value]
```

### Set
```javascript
const set = new Set([1, 2, 3]);
set.add(4);                     // O(1) average
set.has(2);                     // O(1) average
set.delete(3);                  // O(1) average
set.size;                       // Get size
set.clear();                    // Remove all
```

## Array Methods (Critical for Interviews)

### Iteration
```javascript
arr.forEach((val, idx, array) => {});
arr.map(val => val * 2);        // Transform each element
arr.filter(val => val > 0);     // Keep matching elements
arr.reduce((acc, val) => acc + val, 0); // Reduce to single value
arr.find(val => val > 5);       // First matching element
arr.findIndex(val => val > 5);  // Index of first match
arr.every(val => val > 0);      // All elements match
arr.some(val => val > 0);       // At least one matches
```

### Sorting & Searching
```javascript
arr.sort((a, b) => a - b);      // Sort ascending (in-place)
arr.sort((a, b) => b - a);      // Sort descending
arr.reverse();                  // Reverse in-place
arr.indexOf(val);               // Find index (returns -1 if not found)
arr.includes(val);              // Check if exists
```

### Other Useful Methods
```javascript
arr.join(',');                  // Convert to string
arr.concat(arr2);               // Merge arrays
[...arr1, ...arr2];             // Spread operator merge
Array(n).fill(0);               // Create array of size n
Array.from({length: n}, (_, i) => i); // Create [0,1,2...n-1]
```

## String Methods

```javascript
str.length;                     // Get length
str.charAt(i);                  // Get char at index
str[i];                         // Get char (shorthand)
str.substring(start, end);      // Get substring
str.slice(start, end);          // Get substring (supports negative)
str.split(',');                 // Split into array
str.indexOf('sub');             // Find substring index
str.includes('sub');            // Check if contains
str.startsWith('pre');          // Check prefix
str.endsWith('suf');            // Check suffix
str.toLowerCase();              // Convert to lowercase
str.toUpperCase();              // Convert to uppercase
str.trim();                     // Remove whitespace
str.replace('old', 'new');      // Replace first occurrence
str.replaceAll('old', 'new');   // Replace all occurrences
str.repeat(n);                  // Repeat string n times
[...str];                       // Convert to array of chars
```

## Math Operations

```javascript
Math.floor(x);                  // Round down
Math.ceil(x);                   // Round up
Math.round(x);                  // Round to nearest
Math.max(a, b, c);              // Maximum value
Math.min(a, b, c);              // Minimum value
Math.abs(x);                    // Absolute value
Math.pow(base, exp);            // Power
Math.sqrt(x);                   // Square root
Math.random();                  // Random [0, 1)
Math.floor(Math.random() * n);  // Random integer [0, n)
```

## Common Patterns

### Two Pointers
```javascript
let left = 0, right = arr.length - 1;
while (left < right) {
    // Process
    if (condition) left++;
    else right--;
}
```

### Sliding Window
```javascript
let left = 0, sum = 0;
for (let right = 0; right < arr.length; right++) {
    sum += arr[right];
    while (sum > target) {
        sum -= arr[left++];
    }
}
```

### Frequency Counter
```javascript
const freq = new Map();
for (const val of arr) {
    freq.set(val, (freq.get(val) || 0) + 1);
}
```

### Fast/Slow Pointers (Floyd's Cycle Detection)
```javascript
let slow = head, fast = head;
while (fast && fast.next) {
    slow = slow.next;
    fast = fast.next.next;
    if (slow === fast) return true; // Cycle detected
}
```

## Stack & Queue Patterns

### Stack (using Array)
```javascript
const stack = [];
stack.push(val);                // Add to top
stack.pop();                    // Remove from top
stack[stack.length - 1];        // Peek top
```

### Queue (using Array - inefficient for large data)
```javascript
const queue = [];
queue.push(val);                // Enqueue
queue.shift();                  // Dequeue - O(n)
queue[0];                       // Peek front
```

### Deque (using Array)
```javascript
const deque = [];
deque.push(val);                // Add to back
deque.pop();                    // Remove from back
deque.unshift(val);             // Add to front
deque.shift();                  // Remove from front
```

## Tree/Graph Traversal

### DFS (Recursive)
```javascript
function dfs(node) {
    if (!node) return;
    // Process node
    dfs(node.left);
    dfs(node.right);
}
```

### DFS (Iterative)
```javascript
const stack = [root];
while (stack.length) {
    const node = stack.pop();
    // Process node
    if (node.right) stack.push(node.right);
    if (node.left) stack.push(node.left);
}
```

### BFS
```javascript
const queue = [root];
while (queue.length) {
    const node = queue.shift();
    // Process node
    if (node.left) queue.push(node.left);
    if (node.right) queue.push(node.right);
}
```

### BFS Level Order
```javascript
const queue = [root];
while (queue.length) {
    const levelSize = queue.length;
    for (let i = 0; i < levelSize; i++) {
        const node = queue.shift();
        // Process node
        if (node.left) queue.push(node.left);
        if (node.right) queue.push(node.right);
    }
}
```

## Control Flow

### Loops
```javascript
for (let i = 0; i < n; i++) {}
for (const val of arr) {}       // Iterate values
for (const idx in arr) {}       // Iterate indices (avoid)
while (condition) {}
do {} while (condition);
```

### Conditionals
```javascript
if (condition) {} 
else if (condition) {} 
else {}

const result = condition ? valueIfTrue : valueIfFalse;

switch(val) {
    case 1: break;
    case 2: break;
    default: break;
}
```

## Functions

```javascript
// Function declaration
function name(params) {
    return value;
}

// Arrow function
const name = (params) => {
    return value;
};

// Arrow function (concise)
const name = param => param * 2;

// Default parameters
function name(param = defaultValue) {}

// Rest parameters
function name(...args) {} // args is an array

// Spread operator
name(...arr); // Spread array as arguments
```

## Important JavaScript Quirks

### Type Coercion
```javascript
'5' + 3;        // '53' (string concatenation)
'5' - 3;        // 2 (numeric subtraction)
!!'value';      // true (truthy check)
!!0;            // false (falsy check)
```

### Falsy Values
```javascript
false, 0, -0, '', null, undefined, NaN
// Everything else is truthy
```

### Comparisons
```javascript
==              // Loose equality (type coercion)
===             // Strict equality (no coercion) - USE THIS
!=              // Loose inequality
!==             // Strict inequality - USE THIS
```

### Array/Object Copying
```javascript
const arrCopy = [...arr];           // Shallow copy
const arrCopy = arr.slice();        // Shallow copy
const objCopy = {...obj};           // Shallow copy
const objCopy = Object.assign({}, obj); // Shallow copy
const deep = JSON.parse(JSON.stringify(obj)); // Deep copy (limited)
```

### Destructuring
```javascript
const [a, b, ...rest] = [1, 2, 3, 4];  // a=1, b=2, rest=[3,4]
const {x, y} = {x: 1, y: 2};            // x=1, y=2
const {x: newName} = {x: 1};            // newName=1
```

## Common Edge Cases to Consider

```javascript
// Empty input
if (!arr || arr.length === 0) return default;

// Single element
if (arr.length === 1) return arr[0];

// Null/undefined checks
if (node === null || node === undefined) return;
if (!node) return; // Checks both

// Integer overflow (JavaScript uses floats)
Number.MAX_SAFE_INTEGER;  // 2^53 - 1
Number.MIN_SAFE_INTEGER;  // -(2^53 - 1)

// Division by zero
x / 0;  // Infinity (not error)

// Array bounds
if (i >= 0 && i < arr.length) {}
```

## Complexity Quick Reference

| Operation | Array | Map/Set | Object |
|-----------|-------|---------|--------|
| Access | O(1) | - | O(1) |
| Search | O(n) | O(1)* | O(1) |
| Insert | O(1)† | O(1)* | O(1) |
| Delete | O(n) | O(1)* | O(1) |
| Iterate | O(n) | O(n) | O(n) |

*Average case (O(n) worst case)
†At end; O(n) at beginning/middle

## Useful Built-in Constants

```javascript
Number.MAX_VALUE;               // Largest number
Number.MIN_VALUE;               // Smallest positive number
Number.MAX_SAFE_INTEGER;        // 2^53 - 1
Number.MIN_SAFE_INTEGER;        // -(2^53 - 1)
Infinity;                       // Positive infinity
-Infinity;                      // Negative infinity
NaN;                            // Not a Number
```

## Regular Expressions (Basic)

```javascript
const regex = /pattern/flags;   // Literal
const regex = new RegExp('pattern', 'flags');
str.match(regex);               // Find matches
str.replace(regex, 'new');      // Replace matches
regex.test(str);                // Test if matches

// Common flags:
// g - global (all matches)
// i - case insensitive
// m - multiline

// Common patterns:
\d      // digit
\w      // word character
\s      // whitespace
.       // any character
^       // start of string
$       // end of string
*       // 0 or more
+       // 1 or more
?       // 0 or 1
[abc]   // any of a, b, c
[^abc]  // not a, b, or c
```

## Priority Queue (Heap) - Manual Implementation Needed

JavaScript doesn't have a built-in heap. For interviews, you might need to:
1. Use an array and manually maintain heap property
2. Mention you'd use a library in production
3. Implement a MinHeap/MaxHeap class if time permits

```javascript
// Simple approach: sort after each operation (not optimal)
const pq = [];
pq.push(item);
pq.sort((a, b) => a - b);  // Min heap
const min = pq.shift();

// Note: This is O(n log n) for insertion instead of O(log n)
// Mention this tradeoff in interview
```

## Method Chaining Examples for Interviews

### Example 1: Count Character Frequency
```javascript
// Given a string, return object with character counts
const str = "hello world";
const freq = str
    .split('')
    .filter(char => char !== ' ')
    .reduce((acc, char) => {
        acc[char] = (acc[char] || 0) + 1;
        return acc;
    }, {});
// Result: {h:1, e:1, l:3, o:2, w:1, r:1, d:1}
```

### Example 2: Top K Frequent Elements
```javascript
// Given array of numbers, return k most frequent elements
const nums = [1,1,1,2,2,3];
const k = 2;

const result = Object.entries(
    nums.reduce((acc, num) => {
        acc[num] = (acc[num] || 0) + 1;
        return acc;
    }, {})
)
.sort((a, b) => b[1] - a[1])  // Sort by frequency desc
.slice(0, k)                   // Take top k
.map(([num]) => Number(num));  // Extract just the numbers
// Result: [1, 2]
```

### Example 3: Group Anagrams
```javascript
// Group strings that are anagrams of each other
const strs = ["eat","tea","tan","ate","nat","bat"];

const groups = Object.values(
    strs.reduce((acc, str) => {
        const key = str.split('').sort().join('');
        if (!acc[key]) acc[key] = [];
        acc[key].push(str);
        return acc;
    }, {})
);
// Result: [["eat","tea","ate"],["tan","nat"],["bat"]]
```

### Example 4: Find Unique Elements
```javascript
// Remove duplicates and sort
const arr = [3,1,2,1,3,4,2];
const unique = [...new Set(arr)].sort((a, b) => a - b);
// Result: [1, 2, 3, 4]

// Or get duplicates only
const duplicates = arr.filter((val, idx, array) => 
    array.indexOf(val) !== idx && array.indexOf(val) === idx - 1
);
```

### Example 5: Transform and Filter Data
```javascript
// Given array of objects, filter and transform
const users = [
    {name: "Alice", age: 25, active: true},
    {name: "Bob", age: 17, active: false},
    {name: "Charlie", age: 30, active: true}
];

const activeAdultNames = users
    .filter(user => user.active && user.age >= 18)
    .map(user => user.name)
    .sort();
// Result: ["Alice", "Charlie"]
```

### Example 6: Sum of Squares of Even Numbers
```javascript
const nums = [1, 2, 3, 4, 5, 6];
const sumSquares = nums
    .filter(n => n % 2 === 0)
    .map(n => n * n)
    .reduce((sum, n) => sum + n, 0);
// Result: 56 (4 + 16 + 36)
```

### Example 7: Find Words Longer Than N Characters
```javascript
const sentence = "The quick brown fox jumps over the lazy dog";
const n = 4;

const longWords = sentence
    .toLowerCase()
    .split(' ')
    .filter(word => word.length > n)
    .join(', ');
// Result: "quick, brown, jumps"
```

### Example 8: Flatten and Sum Nested Arrays
```javascript
const nested = [[1, 2], [3, 4], [5]];
const sum = nested
    .flat()                           // [1,2,3,4,5]
    .reduce((acc, n) => acc + n, 0);  // 15

// For deeply nested (use Infinity)
const deepNested = [1, [2, [3, [4]]]];
const flattened = deepNested.flat(Infinity); // [1,2,3,4]
```

### Example 9: Check if All/Some Elements Meet Condition
```javascript
const nums = [2, 4, 6, 8];

const allEven = nums.every(n => n % 2 === 0);     // true
const hasOdd = nums.some(n => n % 2 !== 0);       // false

// Find first element > 5
const firstLarge = nums.find(n => n > 5);         // 6
const firstLargeIdx = nums.findIndex(n => n > 5); // 2
```

### Example 10: Create Frequency Map and Find Max
```javascript
const votes = ['apple', 'banana', 'apple', 'orange', 'banana', 'apple'];

const [winner, count] = Object.entries(
    votes.reduce((acc, vote) => {
        acc[vote] = (acc[vote] || 0) + 1;
        return acc;
    }, {})
)
.reduce((max, [item, count]) => 
    count > max[1] ? [item, count] : max
, ['', 0]);
// Result: winner='apple', count=3
```

### Example 11: Sliding Window with Reduce
```javascript
// Get all subarrays of length k
const arr = [1, 2, 3, 4, 5];
const k = 3;

const windows = Array.from(
    {length: arr.length - k + 1},
    (_, i) => arr.slice(i, i + k)
);
// Result: [[1,2,3], [2,3,4], [3,4,5]]

// Get max of each window
const maxWindows = windows.map(window => Math.max(...window));
// Result: [3, 4, 5]
```

### Example 12: Combine Multiple Arrays
```javascript
const arr1 = [1, 2, 3];
const arr2 = [4, 5];
const arr3 = [6, 7, 8];

// Merge and dedupe
const merged = [...new Set([...arr1, ...arr2, ...arr3])];
// Result: [1,2,3,4,5,6,7,8]

// Zip arrays together
const zipped = arr1.map((val, i) => [val, arr2[i], arr3[i]]);
// Result: [[1,4,6], [2,5,7], [3,undefined,8]]
```

### Example 13: String Transformations
```javascript
const str = "  Hello World  ";

// Chain string operations
const result = str
    .trim()
    .toLowerCase()
    .split(' ')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ');
// Result: "Hello World"
```

### Example 14: Two Sum Using Map
```javascript
// Find two numbers that sum to target
const nums = [2, 7, 11, 15];
const target = 9;

const twoSum = (nums, target) => {
    const map = new Map();
    for (let i = 0; i < nums.length; i++) {
        const complement = target - nums[i];
        if (map.has(complement)) {
            return [map.get(complement), i];
        }
        map.set(nums[i], i);
    }
    return [];
};
// Result: [0, 1] (indices of 2 and 7)
```

### Example 15: Partition Array into Chunks
```javascript
// Split array into chunks of size n
const arr = [1, 2, 3, 4, 5, 6, 7, 8];
const chunkSize = 3;

const chunks = Array.from(
    {length: Math.ceil(arr.length / chunkSize)},
    (_, i) => arr.slice(i * chunkSize, (i + 1) * chunkSize)
);
// Result: [[1,2,3], [4,5,6], [7,8]]
```

### Example 16: Moving Average
```javascript
// Calculate moving average of window size k
const prices = [1, 3, 2, 6, 7, 5, 4];
const k = 3;

const movingAvg = prices
    .map((_, i, arr) => 
        i < k - 1 ? null : arr.slice(i - k + 1, i + 1)
    )
    .filter(window => window !== null)
    .map(window => window.reduce((sum, val) => sum + val, 0) / k);
// Result: [2, 3.67, 5, 6, 5.33]
```

### Example 17: Intersection and Union of Arrays
```javascript
const arr1 = [1, 2, 3, 4];
const arr2 = [3, 4, 5, 6];

// Intersection (common elements)
const intersection = arr1.filter(val => arr2.includes(val));
// Result: [3, 4]

// Union (all unique elements)
const union = [...new Set([...arr1, ...arr2])];
// Result: [1, 2, 3, 4, 5, 6]

// Difference (in arr1 but not arr2)
const difference = arr1.filter(val => !arr2.includes(val));
// Result: [1, 2]
```

### Pro Tips for Method Chaining

1. **Performance Consideration**: Each method creates a new array/iteration
   - Multiple chains = multiple passes through data
   - Sometimes a single `reduce` is more efficient than `filter().map().reduce()`

2. **Readability vs Performance**: 
   - Interviews favor readable code
   - Mention optimization opportunities if asked

3. **Common Mistake**: Forgetting to return in `reduce`
```javascript
// Wrong
.reduce((acc, val) => { acc + val }, 0)  // Returns undefined!

// Right  
.reduce((acc, val) => acc + val, 0)      // Implicit return
.reduce((acc, val) => { return acc + val }, 0)  // Explicit return
```

4. **Debugging Chains**: Insert `.map(x => (console.log(x), x))` to see intermediate values
```javascript
const result = arr
    .filter(x => x > 0)
    .map(x => (console.log('after filter:', x), x))  // Debug
    .map(x => x * 2);
```

