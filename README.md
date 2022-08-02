# Minimum Spanning Tree
A spanning tree of a graph is a collection of connected edges that include every vertex in the graph, but that do not form a cycle. Many such spanning trees may exist for a graph. A Minimum Spanning Tree (MST) or minimum weight spanning tree for a weighted, connected, undirected graph is a spanning tree having a cumulative weight less than or equal to the weights of every other possible spanning tree. The cumulative weight of a spanning tree is the sum of weights given to each edge of the spanning tree. 

Minimum spanning trees are invaluable in many applications and algorithms. MSTs have direct utilization in the design of networks, including computer networks, telecommunications networks, transportation networks, water supply networks, and electrical grids (which they were first invented for).

The repository contains implementation of Kruskal and Prim's algorithm for a weighted, undirected graph. 
<p align="center">
  <img src="https://github.com/rimshasaeed/minimum-spanning-tree/blob/main/results/figure1.jpg", alt="weighted-undirected graph" width="40%">
  <br>
  <i>Weighted-undirected graph with 9 nodes</i>
</p>


### Kruskal Algorithm
Kruskal generates the minimum spanning tree starting from the least weighted edge.
<p align="center">
  <img src="https://github.com/rimshasaeed/minimum-spanning-tree/blob/main/results/figure2.jpg", alt="mst-using-kruskal-algorithm" width="40%">
  <br>
  <i>Minimum Spanning Tree</i>
</p>

### Prim's Algorithm
Prim's algorithm generates the minimum spanning tree starting from the root vertex. Also, the algorithm is considered to run faster in dense graphs.
<p align="center">
  <img src="https://github.com/rimshasaeed/minimum-spanning-tree/blob/main/results/figure3.jpg", alt="mst-using-prims-algorithm" width="40%">
  <br>
  <i>Minimum Spanning Tree</i>
</p>
