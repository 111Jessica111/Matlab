% 定义目标函数
function f = objective(x)
    f = - (x(1)^2 + (x(2) - 1)^2);
end

% 定义不等式约束
function [c, ceq] = constraints(x)
    c(1) = x(1) + x(2) - 2; % g1: x1 + x2 <= 2
    c(2) = -x(1);           % g2: x1 >= 0
    c(3) = -x(2);           % g3: x2 >= 0
    ceq = [];               % 没有等式约束
end

% 初始猜测
x0 = [0, 0];

% 调用 fmincon 求解
options = optimoptions('fmincon', 'Display', 'iter'); % 显示迭代信息
[x_opt, fval] = fmincon(@objective, x0, [], [], [], [], [], [], @constraints, options);

% 输出结果
fprintf('最优解: x1 = %.4f, x2 = %.4f\n', x_opt(1), x_opt(2));
fprintf('目标函数值: %.4f\n', -fval); % 取负还原目标函数值
