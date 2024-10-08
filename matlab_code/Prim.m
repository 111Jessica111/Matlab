function Prim()
    % 定义图的邻接矩阵
    graph = [0 1 3 0 0;  % A
             1 0 4 2 0;  % B
             3 4 0 4 0;  % C
             0 2 4 0 0;  % D
             0 0 0 0 0]; % (无其他节点)
         
    num_nodes = size(graph, 1);
    selected = false(1, num_nodes);
    selected(1) = true; % 从第一个节点 (A) 开始
    edges = [];
    
    for i = 1:num_nodes-1
        min_edge = inf;
        a = 0; b = 0;
        
        for j = 1:num_nodes
            if selected(j)
                for k = 1:num_nodes
                    if ~selected(k) && graph(j, k) > 0 && graph(j, k) < min_edge
                        min_edge = graph(j, k);
                        a = j;
                        b = k;
                    end
                end
            end
        end

        if b > 0 % 确保 b 是有效的节点索引
            selected(b) = true;
            edges = [edges; a, b, min_edge];
        else
            break; % 如果没有找到有效的边，退出循环
        end
    end
    disp('Prim算法生成的最小生成树的边及其权重：');
    disp(edges);
end