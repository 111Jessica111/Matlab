#find
### 1. 基本用法

#### 语法

```matlab
index = find(X)
```

- **X**: 输入数组，可以是向量、矩阵或多维数组。
- **index**: 返回一个列向量，包含数组 `X` 中所有非零元素的线性索引。

#### 示例

```matlab
A = [0, 2, 0; 4, 0, 6; 0, 8, 0];
index = find(A);
disp(index);
```

**输出**：
```
     2
     4
     6
     8
```

在这个例子中，`find` 返回了数组 `A` 中非零元素的线性索引。

### 2. 带条件的查找

`find` 也可以用于查找满足特定条件的元素。

#### 语法

```matlab
index = find(X > threshold)
```

- 这里，`threshold` 是你想要比较的值。

#### 示例

```matlab
A = [1, 3, 5; 7, 2, 9];
index = find(A > 5);
disp(index);
```

**输出**：
```
     6
     9
```

在这个例子中，`find` 返回了数组 `A` 中大于 5 的元素的索引。

### 3. 多输出参数

`find` 函数还可以返回行和列索引。

#### 语法

```matlab
[row, col] = find(X)
```

- **row**: 返回非零元素的行索引。
- **col**: 返回非零元素的列索引。

#### 示例

```matlab
A = [0, 2, 0; 4, 0, 6; 0, 8, 0];
[row, col] = find(A);
disp([row, col]);
```

**输出**：
```
     1     2
     2     1
     2     3
     3     2
```

这里，输出显示了每个非零元素的行和列索引。

### 4. 在 Kruskal 算法中的使用

在 Kruskal 算法的实现中，`find` 函数用于查找节点的根节点，以确定两个节点是否属于同一集合。具体实现如下：

```matlab
function p = find(x)
    if parent(x) ~= x
        parent(x) = find(parent(x)); % 路径压缩
    end
    p = parent(x);
end
```

- **路径压缩**：在查找过程中，将节点的父节点直接指向根节点，以加速未来的查找。
- **递归查找**：通过递归调用 `find` 函数，直到找到节点的根节点。

