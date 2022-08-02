function [G_mst, cost] = mst_kruskal(G)
% This function finds the minimum spanning tree of the graph where each
% edge has a specified weight using the Kruskal's algorithm.

% Extract nodes and weight from the graph
nodes = G.Edges.EndNodes;
weights = G.Edges.Weight;

% Create a matrix of graph nodes and weight
G = [nodes, weights];

% Create graph's adjacency matrix
Ad = [];
for i = 1 : size(G,1)
    Ad(G(i,1),G(i,2)) = 1;
    Ad(G(i,2),G(i,1)) = 1;
end

% Set True flag to check if the graph is undirected
flag = 1;

% Convert logical adjacent matrix to neighbors' matrix    
if size(Ad,1)==size(Ad,2) && sum(Ad(:)==0)+sum(Ad(:)==1)==numel(Ad)
    if any(any(Ad-Ad'))
        flag = 0;
    end
    if flag
        Nb = zeros(sum(sum(Ad.*triu(ones(size(Ad))))),2);
    else
        Nb = zeros(sum(Ad(:)),2);
    end
    
    count = 1;
    for i = 1:size(Ad,1)
        idx = find(Ad(i,:));        
        if flag
            idx(idx<=i) = [];
        end
        edges = [repmat(i, size(idx)); idx]';
        Nb(count:count+size(edges,1)-1,:) = edges;
        count = count + size(edges,1);
    end
else
    if size(unique(sort(Ad,2),'rows'),1)~=size(Ad,1)
        flag = 0;
    end
    Nb = Ad;
end

% Number of nodes/vertices
v = max(Nb(:));

% Number of edges
e = size(Nb,1);

% Sort edges w.r.t. weights
[weights, idx] = sort(weights);
Nb = Nb(idx,:);

% Initialize: assign each node to itself
repr = (1:v);
rnk  = zeros(1, v);
    
% Initialize an array to store edge indices
edge_idx = zeros(e,1);

% Begin Kruskal's algorithm
for k = 1:e
    i = Nb(k,1);
    j = Nb(k,2);
    if fnd(i,repr) ~= fnd(j,repr)
        edge_idx(k) = 1;
        r_i = fnd(i,repr);
        r_j = fnd(j,repr);
        if rnk(r_i) > rnk(r_j)
            repr(r_j) = r_i;
        else
            repr(r_i) = r_j;
            if rnk(r_i) == rnk(r_j)
                rnk(r_j) = rnk(r_j) + 1;
            end
        end
    end
end

% Get nodes of the minimum spanning tree
idx = find(edge_idx);
mst_nodes = Nb(idx,:);

% Generate adjacency matrix of the minimum spanning tree
mst_Ad = zeros(v);
for k = 1:size(mst_nodes, 1)
    mst_Ad(mst_nodes(k,1), mst_nodes(k,2)) = 1;
    if flag
        mst_Ad(mst_nodes(k,2),mst_nodes(k,1)) = 1;
    end
end

% Generate graph from adjacency matrix
G_mst = digraph(mst_Ad);

% Evaluate the total weight of the minimum spanning tree
cost = sum(weights(idx));

end

function o = fnd(i,repr)
    while i ~= repr(i)
        i = repr(i);
    end
    o = i;
end
