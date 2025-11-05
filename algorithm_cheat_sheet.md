# Algorithm Cheat Sheet

## Stream Heap Sort (Top K)

```javascript
class StreamHeap {
  constructor(k) {
    this.k = k;
    this.heap = [];
  }
  add(val) {
    if (this.heap.length < this.k) {
      this.heap.push(val);
      this.heapifyUp(this.heap.length - 1);
    } else if (val > this.heap[0]) {
      this.heap[0] = val;
      this.heapifyDown(0);
    }
  }
  heapifyUp(i) {
    while (i > 0) {
      const parent = Math.floor((i - 1) / 2);
      if (this.heap[parent] > this.heap[i]) {
        [this.heap[parent], this.heap[i]] = [this.heap[i], this.heap[parent]];
        i = parent;
      } else break;
    }
  }
  heapifyDown(i) {
    while (true) {
      let smallest = i;
      const left = 2 * i + 1;
      const right = 2 * i + 2;
      if (left < this.heap.length && this.heap[left] < this.heap[smallest])
        smallest = left;
      if (right < this.heap.length && this.heap[right] < this.heap[smallest])
        smallest = right;
      if (smallest !== i) {
        [this.heap[i], this.heap[smallest]] = [this.heap[smallest], this.heap[i]];
        i = smallest;
      } else break;
    }
  }
  getTopK() {
    return this.heap.sort((a, b) => b - a);
  }
}
```

## Shortest Path (BFS)

```javascript
const graph = {
  A: ['B', 'C'],
  B: ['D'],
  C: ['D']
};

function bfsShortestPath(graph, start, end) {
  const queue = [[start, [start]]];
  const visited = { [start]: true };

  while (queue.length > 0) {
    const [node, path] = queue.shift();

    if (node === end) {
      return path;
    }

    graph[node].forEach(neighbor => {
      if (!visited[neighbor]) {
        visited[neighbor] = true;
        queue.push([neighbor, [...path, neighbor]]);
      }
    });
  }

  return null;
}
```

