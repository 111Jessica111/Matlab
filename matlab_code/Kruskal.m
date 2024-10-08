function mst = kruskal(numNodes, edges)
    % edges 是一个 N x 3 的矩阵，每行包含 [u, v, weight]
    % numNodes 是图中节点的数量
    % mst 将存储最小生成树的边

    % 按边权重排序
    edges = sortrows(edges, 3);
    parent = 1:numNodes; % 初始化每个节点的父节点

    function p = find(x)
        while x ~= parent(x)
            x = parent(x);
        end
        p = x;
    end

    mst = []; % 存储最小生成树的边
    for i = 1:size(edges, 1)
        u = edges(i, 1);
        v = edges(i, 2);
        if find(u) ~= find(v) % 如果不在同一集合
            mst = [mst; edges(i, :)]; % 添加边到最小生成树
            parent(find(u)) = find(v); % 合并集合,递归
        end
    end
end

% 示例使用
numNodes = 4; % 节点数量
edges = [
    1, 2, 1; % A-B
    1, 3, 3; % A-C
    2, 3, 4; % B-C
    2, 4, 2; % B-D
    3, 4, 4  % C-D
];

mst = kruskal(numNodes, edges);

% 输出最小生成树的边
disp('最小生成树的边 (u, v, weight):');
disp(mst);


