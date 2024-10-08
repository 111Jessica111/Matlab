% 目标函数系数
f = [-3 -5]; % 由于 linprog 进行的是最小化，所以取负值

% 约束条件
A = [2 1; 1 2]; % 约束矩阵
b = [20; 30];   % 约束右侧常数

% 变量下界
lb = [0; 0];    % x1, x2 >= 0

% 求解线性规划
options = optimoptions('linprog', 'Display', 'iter');
[x, fval] = linprog(f, A, b, [], [], lb, [], options);

% 输出结果
fprintf('最优解：\n');
fprintf('产品 A 的生产数量: %.2f\n', x(1));
fprintf('产品 B 的生产数量: %.2f\n', x(2));
fprintf('最大利润: %.2f\n', -fval); % 由于目标函数取了负值，取反
