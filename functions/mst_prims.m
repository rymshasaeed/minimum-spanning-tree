function [G_mst, cost] = mst_prims(G, root_node)

% Extract nodes and weight from the graph
nodes = G.Edges.EndNodes;
weights = G.Edges.Weight;

% Find nodes indices containing root node
idx1 = find(nodes(:,1) == root_node);

% Find the smallest weight corresponding to these indices
cost = min(weights(idx1));

% Find the weights indices where weight is the smallest
idx2 = find(weights == cost);

% Duplicate nodes and weights arrays
temp_nodes = nodes;
temp_weights = weights;

% Get first node pair
p = intersect(idx1, idx2);
nodes_mst = temp_nodes(p, :);
current_node = nodes_mst;

% Remove selected nodes and weights
temp_nodes(p,:) = [];
temp_weights(p,:) = [];

% Number of nodes/vertices
v = numel(unique(nodes));

% Begin Prims algorithm
n = v-2;
while n>0
    k = [];
    % Find nodes indices corresponding to previous node
    for i = 1:size(temp_nodes,1)
        for j = 1:size(temp_nodes, 2)
            if find(temp_nodes(i,j) == current_node(2))
                k = [k; i];
            end
        end
    end

    % Find minimum weight corresponding to the above indices
    w = min(temp_weights(k,:));
    
    % Update cost
    cost = cost + w;
    
    % Find node index corresponding to smallest adjacent weight
    idx3 = find(temp_weights == w);
    if numel(idx3)>1
        idx3 = intersect(k, idx3);
    end    
    
    % Update MST nodes
    current_node = temp_nodes(idx3, :);
    if nodes_mst(end) == current_node(2)
        current_node = flip(current_node);
    end
    nodes_mst = [nodes_mst; current_node];
    
    % Remove selected nodes and weights
    temp_nodes(idx3,:) = [];
    temp_weights(idx3,:) = [];
    
    % Decrement loop
    n = n-1;
end

% Generate adjacency matrix of the minimum spanning tree
mst_Ad = zeros(v);
for k = 1:size(nodes_mst, 1)
    mst_Ad(nodes_mst(k,1), nodes_mst(k,2)) = 1;
end

% Generate MST graph from adjacency matrix
G_mst = digraph(mst_Ad);

end