#norm

1. **计算向量的范数：**
	#欧几里得范数 
   ```matlab
   n = norm(v)
   ```
   这里，`v` 是一个向量，`n` 将返回该向量的 L2 范数（即欧几里得范数）。

2. **指定范数类型：**
   ```matlab
   n = norm(v, p)
   ```
   这里，`p` 指定要计算的范数类型：
   - `p = 1`：L1 范数（绝对值之和）
	 #欧几里得范数
   - `p = 2`：L2 范数（平方和开方，默认值）
	 #曼哈顿范数 
   - `p = Inf`：无穷范数（最大绝对值）
   - `p = -Inf`：最小绝对值

3. **计算矩阵的范数：**
   ```matlab
   n = norm(A)
   ```
   对于矩阵 `A`，默认计算其 Frobenius 范数（所有元素平方和的平方根）。
	#Frobenius范数 
1. **指定矩阵范数类型：**
   ```matlab
   n = norm(A, p)
   ```
   对于矩阵，`p` 可以是：
   - `p = 1`：列范数（最大列和）
   - `p = 2`：谱范数（最大奇异值）
   #谱范数 
   - `p = Inf`：行范数（最大行和）

### 示例

```matlab
% 向量的范数
v = [3; 4];
l2_norm = norm(v);          % L2 范数，结果为 5
l1_norm = norm(v, 1);       % L1 范数，结果为 7
inf_norm = norm(v, Inf);    % 无穷范数，结果为 4

% 矩阵的范数
A = [1, 2; 3, 4];
frobenius_norm = norm(A);   % Frobenius 范数，结果为 sqrt(30)
column_norm = norm(A, 1);    % 列范数，结果为 7
row_norm = norm(A, Inf);     % 行范数，结果为 7
```
