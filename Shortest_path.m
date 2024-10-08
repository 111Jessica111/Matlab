function Shortest_path
    % 定义城市及其对应的索引
    cities = {'A', 'B', 'C', 'D'};
    
    % 构建邻接矩阵
    infValue = inf;
    graph = [
        0, 1, 4, infValue;  % A
        1, 0, 3, 2;         % B
        4, 3, 0, 3;         % C
        infValue, 2, 3, 0   % D
    ];
    
    % 输出邻接矩阵
    % disp('邻接矩阵:');
    % disp(graph);
    
    % 设置起点和终点
    startNode = 1; % A
    endNode = 4;   % D
    
    % 调用 Dijkstra 算法
    [dist, path] = dijkstra(graph, startNode, endNode);
    
    % 输出结果
    fprintf('从 %s 到 %s 的最短距离为: %f\n', cities{startNode}, cities{endNode}, dist(endNode));
    fprintf('最短路径为: %s\n', strjoin(cities(path), ' -> '));
end

function [dist, path] = dijkstra(graph, startNode, endNode)
    numNodes = size(graph, 1);
    dist = inf(1, numNodes); % 初始化距离为无穷大
    dist(startNode) = 0;     % 起点距离为0
    visited = false(1, numNodes); % 访问标记
    prev = NaN(1, numNodes);  % 前驱节点

    for i = 1:numNodes
        % 找到未访问节点中距离最小的节点
        [~, u] = min(dist + visited * inf); 
        visited(u) = true; % 标记为已访问

        % 更新相邻节点的距离
        for u = 1:numNodes
            for v = 1:numNodes
                if graph(u, v) > 0 && ~visited(v) % 只考虑有效边
                    alt = dist(u) + graph(u, v);
                    if alt < dist(v)
                        dist(v) = alt; % 更新最短距离
                        prev(v) = u;   % 更新前驱节点
                    end
                end
            end
        end
    end
    
    % 构建最短路径
    path = [];
    if dist(endNode) < inf
        while ~isnan(prev(endNode))
            path = [endNode, path]; % 记录路径
            endNode = prev(endNode); % 回溯
        end
        path = [startNode, path]; % 添加起点
    end
end
