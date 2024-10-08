% 一维热传导模拟

% 参数设置
L = 10;               % 杆的长度
T0 = 100;             % 左端温度
TL = 0;               % 右端温度
alpha = 0.01;         % 热扩散系数
Nx = 100;             % 空间步数
Nt = 500;             % 时间步数
dx = L / (Nx - 1);    % 空间步长
dt = 0.01;            % 时间步长

% 稳定性条件
if dt > dx^2 / (4 * alpha)
    error('时间步长 dt 过大，需减小以满足稳定性条件！');
end

% 初始化温度分布
x = linspace(0, L, Nx);     % 空间网格
T = zeros(Nx, Nt);          % 温度矩阵
T(:, 1) = T0 + (TL - T0) * (x / L); % 初始条件线性分布

% 时间步进
for n = 1:Nt-1
    for i = 2:Nx-1
        T(i, n+1) = T(i, n) + alpha * dt / dx^2 * (T(i+1, n) - 2*T(i, n) + T(i-1, n));
    end
    % 边界条件
    T(1, n+1) = T0;         % 左边界
    T(Nx, n+1) = TL;       % 右边界
end

% 可视化结果
figure;
for n = 1:50:Nt
    plot(x, T(:, n));
    hold on;
end
xlabel('位置 (x)');
ylabel('温度 (T)');
title('一维热传导模拟');
grid on;
legend(arrayfun(@(n) sprintf('t=%.2f', n*dt), 1:50:Nt, 'UniformOutput', false));
hold off;
