clc, clearvars, close all

% Node pairs
s = [1 1 2 2 2 3 3 4 4 4 5 5 6 6 6 7 8];
t = [2 3 3 4 5 4 5 5 6 7 6 7 7 8 9 8 9];

% Weights / Edge lengths
wt = [4, 3.16, 5.83, 5.83, 7.07, 8.25, 2, 8, 7.07,...
      2, 1.41, 8.25, 7.07, 3.61, 2.24, 4.12, 2];

% Nodes (notations: 1-9)
n = 9;

% Plot graph
G = graph(s, t, wt, n);
figure;
plot(G, 'EdgeLabel', wt, 'NodeColor', 'k', ....
     'NodeFontWeight', 'bold', 'EdgeLabelColor', 'r');
title('Weighted graph')

% Finding MST using Kruskal algorithm
[G_kruskal, cost] = mst_kruskal(G);
figure;
h = plot(G, 'EdgeLabel', wt, 'NodeColor', 'k', ....
         'NodeFontWeight', 'bold', 'EdgeLabelColor', 'r');
highlight(h, G_kruskal, 'EdgeColor','k', 'LineWidth',2)
title(['Sum of MST weights: ', num2str(cost)])
legend("MST using Kruskal's Algorithm")

% Finding MST using Prim's algorithm
[G_prims, cost] = mst_prims(G, 4);
figure;
h = plot(G, 'EdgeLabel', wt, 'NodeColor', 'k', ....
         'NodeFontWeight', 'bold', 'EdgeLabelColor', 'r');
highlight(h, G_prims, 'EdgeColor','g', 'LineWidth',2)
title(['Sum of MST weights: ', num2str(cost)])
legend("MST using Prim's Algorithm")
