# Meta Medium Coding Interview Questions

A collection of 20 medium-level coding interview questions commonly asked at Meta, with solutions in JavaScript and runtime analysis.

---

## 1. Add Two Numbers (Linked List)

**Problem:**
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

**Example:**
```
Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807
```

**Solution:**
```javascript
function addTwoNumbers(l1, l2) {
    let dummyHead = new ListNode(0);
    let current = dummyHead;
    let carry = 0;
    
    while (l1 !== null || l2 !== null || carry !== 0) {
        let sum = carry;
        
        if (l1 !== null) {
            sum += l1.val;
            l1 = l1.next;
        }
        
        if (l2 !== null) {
            sum += l2.val;
            l2 = l2.next;
        }
        
        carry = Math.floor(sum / 10);
        current.next = new ListNode(sum % 10);
        current = current.next;
    }
    
    return dummyHead.next;
}
```

**Runtime:** O(max(m, n)) where m and n are the lengths of the two linked lists

---

## 2. Longest Substring Without Repeating Characters

**Problem:**
Given a string `s`, find the length of the longest substring without repeating characters.

**Example:**
```
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
```

**Solution:**
```javascript
function lengthOfLongestSubstring(s) {
    let charSet = new Set();
    let left = 0;
    let maxLength = 0;
    
    for (let right = 0; right < s.length; right++) {
        while (charSet.has(s[right])) {
            charSet.delete(s[left]);
            left++;
        }
        charSet.add(s[right]);
        maxLength = Math.max(maxLength, right - left + 1);
    }
    
    return maxLength;
}
```

**Runtime:** O(n) where n is the length of the string

---

## 3. Group Anagrams

**Problem:**
Given an array of strings `strs`, group the anagrams together. You can return the answer in any order.

**Example:**
```
Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
```

**Solution:**
```javascript
function groupAnagrams(strs) {
    let map = new Map();
    
    for (let str of strs) {
        let sorted = str.split('').sort().join('');
        if (!map.has(sorted)) {
            map.set(sorted, []);
        }
        map.get(sorted).push(str);
    }
    
    return Array.from(map.values());
}
```

**Runtime:** O(n * k log k) where n is the number of strings and k is the maximum length of a string

---

## 4. Product of Array Except Self

**Problem:**
Given an integer array `nums`, return an array `answer` such that `answer[i]` is equal to the product of all the elements of `nums` except `nums[i]`. You must solve it in O(n) time without using division.

**Example:**
```
Input: nums = [1,2,3,4]
Output: [24,12,8,6]
```

**Solution:**
```javascript
function productExceptSelf(nums) {
    let n = nums.length;
    let result = new Array(n).fill(1);
    
    // Calculate left products
    let leftProduct = 1;
    for (let i = 0; i < n; i++) {
        result[i] = leftProduct;
        leftProduct *= nums[i];
    }
    
    // Calculate right products and multiply
    let rightProduct = 1;
    for (let i = n - 1; i >= 0; i--) {
        result[i] *= rightProduct;
        rightProduct *= nums[i];
    }
    
    return result;
}
```

**Runtime:** O(n) where n is the length of the array

---

## 5. Validate Binary Search Tree

**Problem:**
Given the root of a binary tree, determine if it is a valid binary search tree (BST).

**Example:**
```
Input: root = [2,1,3]
Output: true
```

**Solution:**
```javascript
function isValidBST(root) {
    function validate(node, min, max) {
        if (node === null) return true;
        
        if (node.val <= min || node.val >= max) {
            return false;
        }
        
        return validate(node.left, min, node.val) && 
               validate(node.right, node.val, max);
    }
    
    return validate(root, -Infinity, Infinity);
}
```

**Runtime:** O(n) where n is the number of nodes in the tree

---

## 6. Number of Islands

**Problem:**
Given an m x n 2D binary grid which represents a map of '1's (land) and '0's (water), return the number of islands.

**Example:**
```
Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3
```

**Solution:**
```javascript
function numIslands(grid) {
    if (!grid || grid.length === 0) return 0;
    
    let count = 0;
    
    function dfs(i, j) {
        if (i < 0 || i >= grid.length || j < 0 || j >= grid[0].length || 
            grid[i][j] === '0') {
            return;
        }
        
        grid[i][j] = '0'; // Mark as visited
        
        dfs(i + 1, j);
        dfs(i - 1, j);
        dfs(i, j + 1);
        dfs(i, j - 1);
    }
    
    for (let i = 0; i < grid.length; i++) {
        for (let j = 0; j < grid[0].length; j++) {
            if (grid[i][j] === '1') {
                count++;
                dfs(i, j);
            }
        }
    }
    
    return count;
}
```

**Runtime:** O(m * n) where m and n are the dimensions of the grid

---

## 7. Binary Tree Level Order Traversal

**Problem:**
Given the root of a binary tree, return the level order traversal of its nodes' values (i.e., from left to right, level by level).

**Example:**
```
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]
```

**Solution:**
```javascript
function levelOrder(root) {
    if (!root) return [];
    
    let result = [];
    let queue = [root];
    
    while (queue.length > 0) {
        let levelSize = queue.length;
        let currentLevel = [];
        
        for (let i = 0; i < levelSize; i++) {
            let node = queue.shift();
            currentLevel.push(node.val);
            
            if (node.left) queue.push(node.left);
            if (node.right) queue.push(node.right);
        }
        
        result.push(currentLevel);
    }
    
    return result;
}
```

**Runtime:** O(n) where n is the number of nodes in the tree

---

## 8. Lowest Common Ancestor of a Binary Tree

**Problem:**
Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

**Example:**
```
Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
Output: 3
```

**Solution:**
```javascript
function lowestCommonAncestor(root, p, q) {
    if (!root || root === p || root === q) {
        return root;
    }
    
    let left = lowestCommonAncestor(root.left, p, q);
    let right = lowestCommonAncestor(root.right, p, q);
    
    if (left && right) return root;
    
    return left ? left : right;
}
```

**Runtime:** O(n) where n is the number of nodes in the tree

---

## 9. Subarray Sum Equals K

**Problem:**
Given an array of integers `nums` and an integer `k`, return the total number of subarrays whose sum equals to `k`.

**Example:**
```
Input: nums = [1,1,1], k = 2
Output: 2
```

**Solution:**
```javascript
function subarraySum(nums, k) {
    let count = 0;
    let sum = 0;
    let map = new Map();
    map.set(0, 1);
    
    for (let num of nums) {
        sum += num;
        
        if (map.has(sum - k)) {
            count += map.get(sum - k);
        }
        
        map.set(sum, (map.get(sum) || 0) + 1);
    }
    
    return count;
}
```

**Runtime:** O(n) where n is the length of the array

---

## 10. Course Schedule

**Problem:**
There are a total of `numCourses` courses you have to take, labeled from `0` to `numCourses - 1`. Given the array `prerequisites` where `prerequisites[i] = [ai, bi]` indicates that you must take course `bi` first if you want to take course `ai`, return true if you can finish all courses.

**Example:**
```
Input: numCourses = 2, prerequisites = [[1,0]]
Output: true
```

**Solution:**
```javascript
function canFinish(numCourses, prerequisites) {
    let graph = new Map();
    let inDegree = new Array(numCourses).fill(0);
    
    // Build graph
    for (let [course, prereq] of prerequisites) {
        if (!graph.has(prereq)) {
            graph.set(prereq, []);
        }
        graph.get(prereq).push(course);
        inDegree[course]++;
    }
    
    // Start with courses that have no prerequisites
    let queue = [];
    for (let i = 0; i < numCourses; i++) {
        if (inDegree[i] === 0) {
            queue.push(i);
        }
    }
    
    let count = 0;
    while (queue.length > 0) {
        let course = queue.shift();
        count++;
        
        if (graph.has(course)) {
            for (let nextCourse of graph.get(course)) {
                inDegree[nextCourse]--;
                if (inDegree[nextCourse] === 0) {
                    queue.push(nextCourse);
                }
            }
        }
    }
    
    return count === numCourses;
}
```

**Runtime:** O(V + E) where V is the number of courses and E is the number of prerequisites

---

## 11. Accounts Merge

**Problem:**
Given a list of accounts where each element `accounts[i]` is a list of strings, where the first element is a name and the rest are emails, merge accounts that belong to the same person.

**Example:**
```
Input: accounts = [["John","johnsmith@mail.com","john_newyork@mail.com"],
                   ["John","johnsmith@mail.com","john00@mail.com"],
                   ["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
Output: [["John","john00@mail.com","john_newyork@mail.com","johnsmith@mail.com"],
         ["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
```

**Solution:**
```javascript
function accountsMerge(accounts) {
    let emailToName = new Map();
    let graph = new Map();
    
    // Build graph
    for (let account of accounts) {
        let name = account[0];
        for (let i = 1; i < account.length; i++) {
            let email = account[i];
            emailToName.set(email, name);
            
            if (!graph.has(email)) {
                graph.set(email, []);
            }
            
            if (i > 1) {
                graph.get(account[1]).push(email);
                graph.get(email).push(account[1]);
            }
        }
    }
    
    let visited = new Set();
    let result = [];
    
    function dfs(email, emails) {
        if (visited.has(email)) return;
        visited.add(email);
        emails.push(email);
        
        if (graph.has(email)) {
            for (let neighbor of graph.get(email)) {
                dfs(neighbor, emails);
            }
        }
    }
    
    for (let email of emailToName.keys()) {
        if (!visited.has(email)) {
            let emails = [];
            dfs(email, emails);
            emails.sort();
            result.push([emailToName.get(email), ...emails]);
        }
    }
    
    return result;
}
```

**Runtime:** O(N * K * log(K)) where N is the number of accounts and K is the maximum length of an account

---

## 12. Minimum Remove to Make Valid Parentheses

**Problem:**
Given a string `s` of '(' , ')' and lowercase English characters, remove the minimum number of invalid parentheses to make the string valid.

**Example:**
```
Input: s = "lee(t(c)o)de)"
Output: "lee(t(c)o)de"
```

**Solution:**
```javascript
function minRemoveToMakeValid(s) {
    let arr = s.split('');
    let stack = [];
    
    // First pass: mark invalid closing parentheses
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] === '(') {
            stack.push(i);
        } else if (arr[i] === ')') {
            if (stack.length > 0) {
                stack.pop();
            } else {
                arr[i] = '';
            }
        }
    }
    
    // Second pass: mark unmatched opening parentheses
    while (stack.length > 0) {
        arr[stack.pop()] = '';
    }
    
    return arr.join('');
}
```

**Runtime:** O(n) where n is the length of the string

---

## 13. Binary Tree Right Side View

**Problem:**
Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

**Example:**
```
Input: root = [1,2,3,null,5,null,4]
Output: [1,3,4]
```

**Solution:**
```javascript
function rightSideView(root) {
    if (!root) return [];
    
    let result = [];
    let queue = [root];
    
    while (queue.length > 0) {
        let levelSize = queue.length;
        
        for (let i = 0; i < levelSize; i++) {
            let node = queue.shift();
            
            // Add the last node of each level
            if (i === levelSize - 1) {
                result.push(node.val);
            }
            
            if (node.left) queue.push(node.left);
            if (node.right) queue.push(node.right);
        }
    }
    
    return result;
}
```

**Runtime:** O(n) where n is the number of nodes in the tree

---

## 14. Decode Ways

**Problem:**
A message containing letters from A-Z can be encoded into numbers using 'A' -> "1", 'B' -> "2", ..., 'Z' -> "26". Given a string `s` containing only digits, return the number of ways to decode it.

**Example:**
```
Input: s = "226"
Output: 3
Explanation: "226" could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
```

**Solution:**
```javascript
function numDecodings(s) {
    if (s[0] === '0') return 0;
    
    let n = s.length;
    let dp = new Array(n + 1).fill(0);
    dp[0] = 1;
    dp[1] = 1;
    
    for (let i = 2; i <= n; i++) {
        let oneDigit = parseInt(s.substring(i - 1, i));
        let twoDigits = parseInt(s.substring(i - 2, i));
        
        if (oneDigit >= 1 && oneDigit <= 9) {
            dp[i] += dp[i - 1];
        }
        
        if (twoDigits >= 10 && twoDigits <= 26) {
            dp[i] += dp[i - 2];
        }
    }
    
    return dp[n];
}
```

**Runtime:** O(n) where n is the length of the string

---

## 15. Continuous Subarray Sum

**Problem:**
Given an integer array `nums` and an integer `k`, return true if `nums` has a continuous subarray of size at least two whose elements sum up to a multiple of `k`.

**Example:**
```
Input: nums = [23,2,4,6,7], k = 6
Output: true
Explanation: [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.
```

**Solution:**
```javascript
function checkSubarraySum(nums, k) {
    let map = new Map();
    map.set(0, -1);
    let sum = 0;
    
    for (let i = 0; i < nums.length; i++) {
        sum += nums[i];
        let remainder = sum % k;
        
        if (map.has(remainder)) {
            if (i - map.get(remainder) >= 2) {
                return true;
            }
        } else {
            map.set(remainder, i);
        }
    }
    
    return false;
}
```

**Runtime:** O(n) where n is the length of the array

---

## 16. Longest Palindromic Substring

**Problem:**
Given a string `s`, return the longest palindromic substring in `s`.

**Example:**
```
Input: s = "babad"
Output: "bab" (or "aba")
```

**Solution:**
```javascript
function longestPalindrome(s) {
    if (s.length < 2) return s;
    
    let start = 0;
    let maxLength = 0;
    
    function expandAroundCenter(left, right) {
        while (left >= 0 && right < s.length && s[left] === s[right]) {
            left--;
            right++;
        }
        return right - left - 1;
    }
    
    for (let i = 0; i < s.length; i++) {
        let len1 = expandAroundCenter(i, i); // Odd length
        let len2 = expandAroundCenter(i, i + 1); // Even length
        let len = Math.max(len1, len2);
        
        if (len > maxLength) {
            maxLength = len;
            start = i - Math.floor((len - 1) / 2);
        }
    }
    
    return s.substring(start, start + maxLength);
}
```

**Runtime:** O(n²) where n is the length of the string

---

## 17. Clone Graph

**Problem:**
Given a reference of a node in a connected undirected graph, return a deep copy (clone) of the graph.

**Example:**
```
Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
Output: [[2,4],[1,3],[2,4],[1,3]]
```

**Solution:**
```javascript
function cloneGraph(node) {
    if (!node) return null;
    
    let map = new Map();
    
    function dfs(node) {
        if (map.has(node.val)) {
            return map.get(node.val);
        }
        
        let clone = new Node(node.val);
        map.set(node.val, clone);
        
        for (let neighbor of node.neighbors) {
            clone.neighbors.push(dfs(neighbor));
        }
        
        return clone;
    }
    
    return dfs(node);
}
```

**Runtime:** O(V + E) where V is the number of vertices and E is the number of edges

---

## 18. Sort Colors

**Problem:**
Given an array `nums` with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue (represented by integers 0, 1, and 2).

**Example:**
```
Input: nums = [2,0,2,1,1,0]
Output: [0,0,1,1,2,2]
```

**Solution:**
```javascript
function sortColors(nums) {
    let low = 0;
    let mid = 0;
    let high = nums.length - 1;
    
    while (mid <= high) {
        if (nums[mid] === 0) {
            [nums[low], nums[mid]] = [nums[mid], nums[low]];
            low++;
            mid++;
        } else if (nums[mid] === 1) {
            mid++;
        } else {
            [nums[mid], nums[high]] = [nums[high], nums[mid]];
            high--;
        }
    }
}
```

**Runtime:** O(n) where n is the length of the array

---

## 19. Kth Largest Element in an Array

**Problem:**
Given an integer array `nums` and an integer `k`, return the kth largest element in the array.

**Example:**
```
Input: nums = [3,2,1,5,6,4], k = 2
Output: 5
```

**Solution:**
```javascript
function findKthLargest(nums, k) {
    function quickSelect(left, right) {
        let pivot = nums[right];
        let p = left;
        
        for (let i = left; i < right; i++) {
            if (nums[i] >= pivot) {
                [nums[p], nums[i]] = [nums[i], nums[p]];
                p++;
            }
        }
        
        [nums[p], nums[right]] = [nums[right], nums[p]];
        
        if (p === k - 1) return nums[p];
        else if (p < k - 1) return quickSelect(p + 1, right);
        else return quickSelect(left, p - 1);
    }
    
    return quickSelect(0, nums.length - 1);
}
```

**Runtime:** O(n) average case, O(n²) worst case

---

## 20. LRU Cache

**Problem:**
Design a data structure that follows the constraints of a Least Recently Used (LRU) cache. Implement `get(key)` and `put(key, value)` operations that run in O(1) time.

**Example:**
```
Input:
["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
Output:
[null, null, null, 1, null, -1, null, -1, 3, 4]
```

**Solution:**
```javascript
class LRUCache {
    constructor(capacity) {
        this.capacity = capacity;
        this.cache = new Map();
    }
    
    get(key) {
        if (!this.cache.has(key)) {
            return -1;
        }
        
        // Move to end (most recently used)
        let value = this.cache.get(key);
        this.cache.delete(key);
        this.cache.set(key, value);
        
        return value;
    }
    
    put(key, value) {
        // If key exists, delete it first
        if (this.cache.has(key)) {
            this.cache.delete(key);
        }
        
        // Add to end
        this.cache.set(key, value);
        
        // If over capacity, remove least recently used (first element)
        if (this.cache.size > this.capacity) {
            let firstKey = this.cache.keys().next().value;
            this.cache.delete(firstKey);
        }
    }
}
```

**Runtime:** O(1) for both get and put operations

---

## Summary

These 20 medium-level problems cover essential data structures and algorithms commonly tested in Meta interviews:

- **Data Structures:** Arrays, Strings, Linked Lists, Trees, Graphs, Hash Maps
- **Algorithms:** Two Pointers, Sliding Window, DFS/BFS, Dynamic Programming, Topological Sort, Quick Select
- **Techniques:** Prefix Sum, Graph Traversal, Level Order Traversal, Union Find (implied in Accounts Merge)

Practice these problems to build strong fundamentals for technical interviews!

