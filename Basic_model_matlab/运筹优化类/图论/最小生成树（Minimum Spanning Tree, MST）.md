
### 概念

在一个无向图中，最小生成树是包含所有顶点的一个子图，它是一个树结构，并且边的总权重最小。简单来说，最小生成树连接了图中的所有节点，同时不形成环。

### 特点

1. **包含所有节点**：最小生成树包括图中的每一个节点。
2. **边的总权重最小**：在所有可能的生成树中，最小生成树的边权重之和是最小的。
3. **无环**：生成树是一个无环连通图。
4. **唯一性**：如果图中所有边的权重都不同，则最小生成树是唯一的；如果存在相同权重的边，则可能有多个最小生成树。

### 常用算法

1. **Prim 算法**：
    - 从一个初始节点开始，逐步扩展树，每次选择连接树和非树节点的最小边。
    - 适合稠密图。
2. **Kruskal 算法**：
    - 将所有边按权重从小到大排序，然后逐步选择边，确保不形成环。
    - 适合稀疏图。

### 应用
1. **网络设计**：在计算机网络、通信网络中，最小生成树可以用来设计最少成本的网络连接。
2. **交通规划**：在交通网络中，可以用最小生成树来优化道路建设，减少建设成本。
3. **聚类分析**：在数据分析中，最小生成树可用于数据的聚类和分类。

好的，让我们通过一个具体的例子来讲解最小生成树，并用 MATLAB 实现 Kruskal 算法。

### 示例

考虑以下无向图：

```scss
    (A)
    / \
   1   3
  /     \
(B)-----(C)
  \     /
   2   4
    \ /
    (D)
```

**边及其权重**：
- A-B = 1
- A-C = 3
- B-C = 4
- B-D = 2
- C-D = 4

我们希望找到这个图的最小生成树。

### 最小生成树的边

通过 Kruskal 算法，我们可以得到以下最小生成树的边：
- A-B (权重 1)
- B-D (权重 2)
- A-C (权重 3)

总权重为 \(1 + 2 + 3 = 6\)。

### MATLAB Kruskal 算法实现

下面是用 MATLAB 实现 Kruskal 算法的代码：
#sortrows 
#find

```matlab
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
            parent(find(u)) = find(v); % 合并集合
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
```

### 运行结果

当你运行上述 MATLAB 代码时，输出将显示最小生成树的边及其权重。例如：

```
最小生成树的边 (u, v, weight):
     1     2     1
     2     4     2
     1     3     3
```

### 树结构图

<svg width="300" height="200" xmlns="http://www.w3.org/2000/svg">
  <line x1="150" y1="20" x2="100" y2="70" stroke="black" stroke-width="2"/>
  <line x1="150" y1="20" x2="200" y2="70" stroke="black" stroke-width="2"/>
  <line x1="100" y1="70" x2="50" y2="120" stroke="black" stroke-width="2"/>
  
  <circle cx="150" cy="20" r="20" fill="lightblue"/>
  <circle cx="100" cy="70" r="20" fill="lightblue"/>
  <circle cx="200" cy="70" r="20" fill="lightblue"/>
  <circle cx="50" cy="120" r="20" fill="lightblue"/>

  <text x="150" y="20" text-anchor="middle" alignment-baseline="middle">C</text>
  <text x="100" y="70" text-anchor="middle" alignment-baseline="middle">B</text>
  <text x="200" y="70" text-anchor="middle" alignment-baseline="middle">D</text>
  <text x="50" y="120" text-anchor="middle" alignment-baseline="middle">A</text>
</svg>
### `parent` 数组的含义

在这个上下文中，`parent` 数组的索引从 1 开始，表示节点的编号，数组的值表示每个节点的直接父节点。具体来说：

- `parent(1) = 2`：节点 1（A）的父节点是节点 2（B）。
- `parent(2) = 4`：节点 2（B）的父节点是节点 4（D）。
- `parent(3) = 3`：节点 3（C）的父节点是自身，表示节点 C 是一个根节点。
- `parent(4) = 3`：节点 4（D）的父节点是节点 3（C）。

### 形成这个 `parent` 数组的过程

1. **初始化**:
   - 开始时，`parent` 数组初始化为 `[1, 2, 3, 4]`，表示每个节点都是自己的父节点。

2. **处理边**:
   - 按照边的权重从小到大排序，处理每一条边，决定是否将其加入最小生成树。

3. **添加边**:
   - 当处理边 A-B（权重 1）时，发现它们不在同一集合，因此将其加入 MST，并更新 `parent`：
     - `parent(find(1)) = find(2)`，即 `parent(1) = 2`。此时，`parent` 变为 `[2, 2, 3, 4]`。
   - 处理边 B-D（权重 2）时，发现它们不在同一集合，加入 MST，并更新 `parent`：
     - `parent(find(2)) = find(4)`，即 `parent(2) = 4`。此时，`parent` 变为 `[2, 4, 3, 4]`。
   - 处理边 A-C（权重 3）时，发现它们不在同一集合，加入 MST，并更新 `parent`：
     - `parent(find(1)) = find(3)`，即 `parent(1) = 3`。此时，`parent` 变为 `[3, 4, 3, 4]`。
	……
	
1. **最终结果**:
   - 在处理完所有边后，最终的 `parent` 数组为 `[2, 4, 3, 3]`，表示：
     - 节点 A 的父节点是 B。
     - 节点 B 的父节点是 D。
     - 节点 C 的父节点是自身，表示 C 是根节点。
     - 节点 D 的父节点是 C。

### 总结

最终的 `parent` 数组 `[2, 4, 3, 3]` 表示了节点之间的层级关系和连接方式，显示了最小生成树的结构，其中某些节点已经合并到一起，形成了一个树形结构。

### MATLAB Prim 算法实现

下面是用 MATLAB 实现 Prim 算法的代码：

```matlab
function prim_algorithm()
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
```