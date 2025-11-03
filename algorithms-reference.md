# Searching and Sorting Algorithms Reference

A comprehensive guide to common searching and sorting algorithms in JavaScript for technical interviews.

---

## Table of Contents
- [Sorting Algorithms](#sorting-algorithms)
  - [Bubble Sort](#bubble-sort)
  - [Selection Sort](#selection-sort)
  - [Insertion Sort](#insertion-sort)
  - [Merge Sort](#merge-sort)
  - [Quick Sort](#quick-sort)
  - [Heap Sort](#heap-sort)
- [Searching Algorithms](#searching-algorithms)
  - [Linear Search](#linear-search)
  - [Binary Search](#binary-search)
  - [Depth First Search (DFS)](#depth-first-search-dfs)
  - [Breadth First Search (BFS)](#breadth-first-search-bfs)

---

## Sorting Algorithms

### Bubble Sort

**Description:**
Repeatedly steps through the list, compares adjacent elements and swaps them if they are in the wrong order. The pass through the list is repeated until the list is sorted.

**Implementation:**
```javascript
function bubbleSort(arr) {
    const n = arr.length;
    
    for (let i = 0; i < n - 1; i++) {
        let swapped = false;
        
        for (let j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]];
                swapped = true;
            }
        }
        
        // If no swaps were made, array is sorted
        if (!swapped) break;
    }
    
    return arr;
}

// Example
console.log(bubbleSort([64, 34, 25, 12, 22, 11, 90]));
// Output: [11, 12, 22, 25, 34, 64, 90]
```

**Complexity:**
- **Time Complexity:** 
  - Best: O(n) - when array is already sorted
  - Average: O(n²)
  - Worst: O(n²)
- **Space Complexity:** O(1)

**When to Use:**
- Educational purposes
- Small datasets
- Nearly sorted data
- When simplicity is preferred over efficiency

---

### Selection Sort

**Description:**
Divides the input list into two parts: sorted and unsorted. Repeatedly selects the smallest (or largest) element from the unsorted portion and moves it to the end of the sorted portion.

**Implementation:**
```javascript
function selectionSort(arr) {
    const n = arr.length;
    
    for (let i = 0; i < n - 1; i++) {
        let minIdx = i;
        
        // Find minimum element in unsorted array
        for (let j = i + 1; j < n; j++) {
            if (arr[j] < arr[minIdx]) {
                minIdx = j;
            }
        }
        
        // Swap minimum element with first element
        if (minIdx !== i) {
            [arr[i], arr[minIdx]] = [arr[minIdx], arr[i]];
        }
    }
    
    return arr;
}

// Example
console.log(selectionSort([64, 25, 12, 22, 11]));
// Output: [11, 12, 22, 25, 64]
```

**Complexity:**
- **Time Complexity:** O(n²) for all cases
- **Space Complexity:** O(1)

**When to Use:**
- Small datasets
- When memory writes are expensive (makes minimum number of swaps)
- When checking all elements is required

---

### Insertion Sort

**Description:**
Builds the final sorted array one item at a time. It takes each element and inserts it into its correct position in the already sorted portion.

**Implementation:**
```javascript
function insertionSort(arr) {
    const n = arr.length;
    
    for (let i = 1; i < n; i++) {
        let key = arr[i];
        let j = i - 1;
        
        // Move elements greater than key one position ahead
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        
        arr[j + 1] = key;
    }
    
    return arr;
}

// Example
console.log(insertionSort([12, 11, 13, 5, 6]));
// Output: [5, 6, 11, 12, 13]
```

**Complexity:**
- **Time Complexity:**
  - Best: O(n) - when array is already sorted
  - Average: O(n²)
  - Worst: O(n²)
- **Space Complexity:** O(1)

**When to Use:**
- Small datasets
- Nearly sorted data
- Online algorithm (can sort data as it receives it)
- Simple implementation needed

---

### Merge Sort

**Description:**
A divide-and-conquer algorithm that divides the input array into two halves, recursively sorts them, and then merges the two sorted halves.

**Implementation:**
```javascript
function mergeSort(arr) {
    if (arr.length <= 1) {
        return arr;
    }
    
    const mid = Math.floor(arr.length / 2);
    const left = mergeSort(arr.slice(0, mid));
    const right = mergeSort(arr.slice(mid));
    
    return merge(left, right);
}

function merge(left, right) {
    let result = [];
    let i = 0;
    let j = 0;
    
    while (i < left.length && j < right.length) {
        if (left[i] <= right[j]) {
            result.push(left[i]);
            i++;
        } else {
            result.push(right[j]);
            j++;
        }
    }
    
    // Add remaining elements
    return result.concat(left.slice(i)).concat(right.slice(j));
}

// Example
console.log(mergeSort([38, 27, 43, 3, 9, 82, 10]));
// Output: [3, 9, 10, 27, 38, 43, 82]
```

**Complexity:**
- **Time Complexity:** O(n log n) for all cases
- **Space Complexity:** O(n)

**When to Use:**
- Large datasets
- Stable sort required (maintains relative order of equal elements)
- Guaranteed O(n log n) performance needed
- Linked lists (excellent for linked lists as no random access needed)
- External sorting (sorting data that doesn't fit in memory)

---

### Quick Sort

**Description:**
A divide-and-conquer algorithm that selects a 'pivot' element and partitions the array around the pivot, placing smaller elements before it and larger elements after it.

**Implementation:**
```javascript
function quickSort(arr, low = 0, high = arr.length - 1) {
    if (low < high) {
        const pivotIndex = partition(arr, low, high);
        quickSort(arr, low, pivotIndex - 1);
        quickSort(arr, pivotIndex + 1, high);
    }
    return arr;
}

function partition(arr, low, high) {
    const pivot = arr[high];
    let i = low - 1;
    
    for (let j = low; j < high; j++) {
        if (arr[j] <= pivot) {
            i++;
            [arr[i], arr[j]] = [arr[j], arr[i]];
        }
    }
    
    [arr[i + 1], arr[high]] = [arr[high], arr[i + 1]];
    return i + 1;
}

// Alternative: Quick Sort with cleaner syntax
function quickSortClean(arr) {
    if (arr.length <= 1) return arr;
    
    const pivot = arr[Math.floor(arr.length / 2)];
    const left = arr.filter(x => x < pivot);
    const middle = arr.filter(x => x === pivot);
    const right = arr.filter(x => x > pivot);
    
    return [...quickSortClean(left), ...middle, ...quickSortClean(right)];
}

// Example
console.log(quickSort([10, 7, 8, 9, 1, 5]));
// Output: [1, 5, 7, 8, 9, 10]
```

**Complexity:**
- **Time Complexity:**
  - Best: O(n log n)
  - Average: O(n log n)
  - Worst: O(n²) - when pivot is always smallest or largest
- **Space Complexity:** O(log n) - recursion stack

**When to Use:**
- Large datasets
- Average case performance is important
- In-place sorting preferred (less memory than merge sort)
- Most practical choice for general-purpose sorting

---

### Heap Sort

**Description:**
Uses a binary heap data structure. First builds a max heap, then repeatedly extracts the maximum element and reconstructs the heap.

**Implementation:**
```javascript
function heapSort(arr) {
    const n = arr.length;
    
    // Build max heap
    for (let i = Math.floor(n / 2) - 1; i >= 0; i--) {
        heapify(arr, n, i);
    }
    
    // Extract elements from heap one by one
    for (let i = n - 1; i > 0; i--) {
        [arr[0], arr[i]] = [arr[i], arr[0]];
        heapify(arr, i, 0);
    }
    
    return arr;
}

function heapify(arr, n, i) {
    let largest = i;
    const left = 2 * i + 1;
    const right = 2 * i + 2;
    
    if (left < n && arr[left] > arr[largest]) {
        largest = left;
    }
    
    if (right < n && arr[right] > arr[largest]) {
        largest = right;
    }
    
    if (largest !== i) {
        [arr[i], arr[largest]] = [arr[largest], arr[i]];
        heapify(arr, n, largest);
    }
}

// Example
console.log(heapSort([12, 11, 13, 5, 6, 7]));
// Output: [5, 6, 7, 11, 12, 13]
```

**Complexity:**
- **Time Complexity:** O(n log n) for all cases
- **Space Complexity:** O(1)

**When to Use:**
- Guaranteed O(n log n) time complexity needed
- Limited memory (in-place sorting)
- Finding k largest/smallest elements
- Priority queue implementation

---

## Searching Algorithms

### Linear Search

**Description:**
Sequentially checks each element in the list until a match is found or the whole list has been searched.

**Implementation:**
```javascript
function linearSearch(arr, target) {
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] === target) {
            return i; // Return index if found
        }
    }
    return -1; // Return -1 if not found
}

// Find all occurrences
function linearSearchAll(arr, target) {
    const indices = [];
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] === target) {
            indices.push(i);
        }
    }
    return indices;
}

// Example
console.log(linearSearch([64, 34, 25, 12, 22, 11, 90], 22));
// Output: 4

console.log(linearSearchAll([1, 2, 3, 2, 4, 2, 5], 2));
// Output: [1, 3, 5]
```

**Complexity:**
- **Time Complexity:**
  - Best: O(1) - element is at first position
  - Average: O(n)
  - Worst: O(n) - element is at last position or not present
- **Space Complexity:** O(1)

**When to Use:**
- Small datasets
- Unsorted data
- Simple implementation needed
- Array doesn't support random access

---

### Binary Search

**Description:**
Efficiently finds a target value in a sorted array by repeatedly dividing the search interval in half.

**Implementation:**
```javascript
// Iterative approach
function binarySearch(arr, target) {
    let left = 0;
    let right = arr.length - 1;
    
    while (left <= right) {
        const mid = Math.floor((left + right) / 2);
        
        if (arr[mid] === target) {
            return mid;
        } else if (arr[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    
    return -1;
}

// Recursive approach
function binarySearchRecursive(arr, target, left = 0, right = arr.length - 1) {
    if (left > right) {
        return -1;
    }
    
    const mid = Math.floor((left + right) / 2);
    
    if (arr[mid] === target) {
        return mid;
    } else if (arr[mid] < target) {
        return binarySearchRecursive(arr, target, mid + 1, right);
    } else {
        return binarySearchRecursive(arr, target, left, mid - 1);
    }
}

// Find first occurrence
function binarySearchFirst(arr, target) {
    let left = 0;
    let right = arr.length - 1;
    let result = -1;
    
    while (left <= right) {
        const mid = Math.floor((left + right) / 2);
        
        if (arr[mid] === target) {
            result = mid;
            right = mid - 1; // Continue searching in left half
        } else if (arr[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    
    return result;
}

// Find last occurrence
function binarySearchLast(arr, target) {
    let left = 0;
    let right = arr.length - 1;
    let result = -1;
    
    while (left <= right) {
        const mid = Math.floor((left + right) / 2);
        
        if (arr[mid] === target) {
            result = mid;
            left = mid + 1; // Continue searching in right half
        } else if (arr[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    
    return result;
}

// Example
console.log(binarySearch([1, 3, 5, 7, 9, 11, 13, 15], 7));
// Output: 3

console.log(binarySearchFirst([1, 2, 2, 2, 3, 4, 5], 2));
// Output: 1

console.log(binarySearchLast([1, 2, 2, 2, 3, 4, 5], 2));
// Output: 3
```

**Complexity:**
- **Time Complexity:**
  - Best: O(1)
  - Average: O(log n)
  - Worst: O(log n)
- **Space Complexity:** 
  - Iterative: O(1)
  - Recursive: O(log n) - recursion stack

**When to Use:**
- Sorted arrays
- Large datasets
- Need efficient searching
- Random access available

---

### Depth First Search (DFS)

**Description:**
Explores as far as possible along each branch before backtracking. Can be implemented recursively or with a stack.

**Implementation:**
```javascript
// DFS for Trees
function dfsTree(root) {
    if (!root) return [];
    
    const result = [];
    
    function traverse(node) {
        if (!node) return;
        
        result.push(node.val); // Pre-order
        traverse(node.left);
        traverse(node.right);
    }
    
    traverse(root);
    return result;
}

// DFS for Trees - All traversals
function dfsTreeTraversals(root) {
    const preorder = [];
    const inorder = [];
    const postorder = [];
    
    function traverse(node) {
        if (!node) return;
        
        preorder.push(node.val);    // Root, Left, Right
        traverse(node.left);
        inorder.push(node.val);     // Left, Root, Right
        traverse(node.right);
        postorder.push(node.val);   // Left, Right, Root
    }
    
    traverse(root);
    return { preorder, inorder, postorder };
}

// DFS for Graphs
function dfsGraph(graph, start) {
    const visited = new Set();
    const result = [];
    
    function dfs(node) {
        if (visited.has(node)) return;
        
        visited.add(node);
        result.push(node);
        
        for (let neighbor of graph[node] || []) {
            dfs(neighbor);
        }
    }
    
    dfs(start);
    return result;
}

// DFS Iterative (using stack)
function dfsIterative(graph, start) {
    const visited = new Set();
    const stack = [start];
    const result = [];
    
    while (stack.length > 0) {
        const node = stack.pop();
        
        if (visited.has(node)) continue;
        
        visited.add(node);
        result.push(node);
        
        // Add neighbors in reverse order to match recursive DFS
        const neighbors = graph[node] || [];
        for (let i = neighbors.length - 1; i >= 0; i--) {
            if (!visited.has(neighbors[i])) {
                stack.push(neighbors[i]);
            }
        }
    }
    
    return result;
}

// Example
const graph = {
    1: [2, 3],
    2: [4, 5],
    3: [6],
    4: [],
    5: [],
    6: []
};

console.log(dfsGraph(graph, 1));
// Output: [1, 2, 4, 5, 3, 6]
```

**Complexity:**
- **Time Complexity:** O(V + E) where V is vertices and E is edges
- **Space Complexity:** O(V) for visited set and recursion stack

**When to Use:**
- Detecting cycles in graphs
- Topological sorting
- Finding connected components
- Solving maze problems
- Path finding (when any path is acceptable)
- Tree traversals

---

### Breadth First Search (BFS)

**Description:**
Explores all vertices at the present depth before moving to vertices at the next depth level. Uses a queue data structure.

**Implementation:**
```javascript
// BFS for Trees (Level Order Traversal)
function bfsTree(root) {
    if (!root) return [];
    
    const result = [];
    const queue = [root];
    
    while (queue.length > 0) {
        const node = queue.shift();
        result.push(node.val);
        
        if (node.left) queue.push(node.left);
        if (node.right) queue.push(node.right);
    }
    
    return result;
}

// BFS with Levels
function bfsTreeLevels(root) {
    if (!root) return [];
    
    const result = [];
    const queue = [root];
    
    while (queue.length > 0) {
        const levelSize = queue.length;
        const currentLevel = [];
        
        for (let i = 0; i < levelSize; i++) {
            const node = queue.shift();
            currentLevel.push(node.val);
            
            if (node.left) queue.push(node.left);
            if (node.right) queue.push(node.right);
        }
        
        result.push(currentLevel);
    }
    
    return result;
}

// BFS for Graphs
function bfsGraph(graph, start) {
    const visited = new Set();
    const queue = [start];
    const result = [];
    
    visited.add(start);
    
    while (queue.length > 0) {
        const node = queue.shift();
        result.push(node);
        
        for (let neighbor of graph[node] || []) {
            if (!visited.has(neighbor)) {
                visited.add(neighbor);
                queue.push(neighbor);
            }
        }
    }
    
    return result;
}

// BFS with Distance/Level tracking
function bfsWithDistance(graph, start) {
    const visited = new Set();
    const queue = [[start, 0]]; // [node, distance]
    const distances = new Map();
    
    visited.add(start);
    distances.set(start, 0);
    
    while (queue.length > 0) {
        const [node, dist] = queue.shift();
        
        for (let neighbor of graph[node] || []) {
            if (!visited.has(neighbor)) {
                visited.add(neighbor);
                distances.set(neighbor, dist + 1);
                queue.push([neighbor, dist + 1]);
            }
        }
    }
    
    return distances;
}

// Example
const graph = {
    1: [2, 3],
    2: [4, 5],
    3: [6],
    4: [],
    5: [],
    6: []
};

console.log(bfsGraph(graph, 1));
// Output: [1, 2, 3, 4, 5, 6]

console.log(bfsWithDistance(graph, 1));
// Output: Map { 1 => 0, 2 => 1, 3 => 1, 4 => 2, 5 => 2, 6 => 2 }
```

**Complexity:**
- **Time Complexity:** O(V + E) where V is vertices and E is edges
- **Space Complexity:** O(V) for queue and visited set

**When to Use:**
- Finding shortest path in unweighted graphs
- Level order traversal of trees
- Finding all nodes at a certain distance
- Web crawling
- Social network connections (friends at distance k)
- GPS navigation systems

---

## Comparison Table

### Sorting Algorithms

| Algorithm | Best | Average | Worst | Space | Stable | In-Place |
|-----------|------|---------|-------|-------|--------|----------|
| Bubble Sort | O(n) | O(n²) | O(n²) | O(1) | Yes | Yes |
| Selection Sort | O(n²) | O(n²) | O(n²) | O(1) | No | Yes |
| Insertion Sort | O(n) | O(n²) | O(n²) | O(1) | Yes | Yes |
| Merge Sort | O(n log n) | O(n log n) | O(n log n) | O(n) | Yes | No |
| Quick Sort | O(n log n) | O(n log n) | O(n²) | O(log n) | No | Yes |
| Heap Sort | O(n log n) | O(n log n) | O(n log n) | O(1) | No | Yes |

### Searching Algorithms

| Algorithm | Data Structure | Prerequisite | Best | Average | Worst | Space |
|-----------|---------------|--------------|------|---------|-------|-------|
| Linear Search | Array/List | None | O(1) | O(n) | O(n) | O(1) |
| Binary Search | Sorted Array | Sorted data | O(1) | O(log n) | O(log n) | O(1)/O(log n) |
| DFS | Graph/Tree | None | O(V+E) | O(V+E) | O(V+E) | O(V) |
| BFS | Graph/Tree | None | O(V+E) | O(V+E) | O(V+E) | O(V) |

---

## Interview Tips

### Common Sorting Questions
1. "Implement Quick Sort/Merge Sort"
2. "Sort an array with only 0s, 1s, and 2s" (Dutch National Flag - Quick Sort partition)
3. "Find Kth largest element" (Quick Select)
4. "Merge k sorted arrays" (Merge Sort technique + Min Heap)

### Common Searching Questions
1. "Search in a rotated sorted array" (Modified Binary Search)
2. "Find first/last occurrence of element" (Binary Search variant)
3. "Find number of islands" (DFS/BFS)
4. "Shortest path in maze" (BFS)
5. "Detect cycle in graph" (DFS)

### Key Points to Remember
1. **Always clarify constraints:**
   - Array size
   - Value ranges
   - Sorted/unsorted
   - Duplicates allowed?

2. **Consider multiple approaches:**
   - Start with brute force
   - Optimize time/space complexity
   - Discuss trade-offs

3. **Edge cases:**
   - Empty array
   - Single element
   - All same elements
   - Already sorted
   - Duplicates

4. **Test your solution:**
   - Walk through with example
   - Consider edge cases
   - Verify time/space complexity

---

## JavaScript Built-in Methods

For reference, JavaScript provides built-in sorting:

```javascript
// Basic sort (lexicographic by default)
[3, 1, 4, 1, 5].sort(); // [1, 1, 3, 4, 5]

// Numeric sort
[3, 1, 4, 1, 5].sort((a, b) => a - b); // [1, 1, 3, 4, 5]

// Reverse sort
[3, 1, 4, 1, 5].sort((a, b) => b - a); // [5, 4, 3, 1, 1]

// Sort objects
const users = [
    { name: 'John', age: 30 },
    { name: 'Jane', age: 25 },
    { name: 'Bob', age: 35 }
];
users.sort((a, b) => a.age - b.age);

// Searching
[1, 2, 3, 4, 5].indexOf(3); // 2
[1, 2, 3, 4, 5].includes(3); // true
[1, 2, 3, 4, 5].find(x => x > 3); // 4
[1, 2, 3, 4, 5].findIndex(x => x > 3); // 3
```

**Note:** JavaScript's `Array.prototype.sort()` uses Timsort (hybrid of Merge Sort and Insertion Sort) in most modern engines, with O(n log n) time complexity.

---

## Practice Resources

- **LeetCode:** Sort/Search tagged problems
- **HackerRank:** Algorithm challenges
- **AlgoExpert:** Curated interview questions
- **Visualizations:** VisuAlgo.net for algorithm animations

Good luck with your Meta interview! 🚀

