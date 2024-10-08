#sortrows
### 语法
1. **基本用法**:
   ```matlab
   B = sortrows(A)
   ```
   - `A` 是要排序的矩阵或表格。
   - `B` 是排序后的结果，按升序排列。

2. **指定列排序**:
   ```matlab
   B = sortrows(A, column_index)
   ```
   - `column_index` 指定用于排序的列的索引。

3. **多列排序**:
   ```matlab
   B = sortrows(A, [column_index1, column_index2, ...])
   ```
   - 可以指定多个列进行排序，按顺序依次排序。

4. **指定排序顺序**:
   ```matlab
   B = sortrows(A, column_index, 'descend')
   ```
   - 使用 `'descend'` 参数可以实现降序排序。

### 示例
假设有一个矩阵 `A`：

```matlab
A = [1 4 3;
     2 3 2;
     3 2 1];
```

1. **按第一列升序排序**:
   ```matlab
   B = sortrows(A)
   ```
   结果为：
   ```
   B = [1 4 3;
        2 3 2;
        3 2 1]
   ```

2. **按第三列升序排序**:
   ```matlab
   B = sortrows(A, 3)
   ```
   结果为：
   ```
   B = [3 2 1;
        2 3 2;
        1 4 3]
   ```

3. **按第一列降序排序**:
   ```matlab
   B = sortrows(A, 1, 'descend')
   ```
   结果为：
   ```
   B = [3 2 1;
        2 3 2;
        1 4 3]
   ```

### 应用场景
- 数据分析：对数据集进行排序以便于观察和分析。
- 图形处理：在处理图的边、节点等时，可能需要按某些属性进行排序。
