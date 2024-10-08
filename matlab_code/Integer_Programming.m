% 定义目标函数系数
f = [-40, -30]; % 目标函数是最大化，所以取负

% 定义约束矩阵和右侧向量
A = [2, 1]; % 生产时间约束
b = [8];    % 总可用时间

% 定义变量的上限
Aeq = []; % 无等式约束
beq = [];
lb = [0, 0]; % 非负约束
ub = [3, 4]; % 产品 A 和 B 的最大数量

% 定义整数约束
intcon = [1, 2]; % x1 和 x2 都是整数

% 调用 intlinprog 函数求解
options = optimoptions('intlinprog', 'Display', 'off');
[x, fval] = intlinprog(f, intcon, A, b, Aeq, beq, lb, ub, options);

% 输出结果
fprintf('生产产品 A 的数量: %d\n', x(1));
fprintf('生产产品 B 的数量: %d\n', x(2));
fprintf('最大利润: %.2f\n', -fval);











