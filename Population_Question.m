% 定义人口增长模型参数
r = 0.1; % 增长率
K = 1000; % 环境承载力

% 定义微分方程
odefun = @(t, P) r * P * (1 - P / K);

% 设置初始条件和时间范围
P0 = 50; % 初始人口
tspan = [0 100]; % 时间范围

% 使用ode45求解微分方程
[t, P] = ode45(odefun, tspan, P0);

% 绘制结果
figure;
plot(t, P, 'LineWidth', 2);
xlabel('时间');
ylabel('人口');
title('人口增长模型');
grid on;

