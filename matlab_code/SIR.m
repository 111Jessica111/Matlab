% SIR模型参数
beta = 0.3; % 感染率
gamma = 0.1; % 恢复率

% 初始条件
N = 10000;  % Total population
S0 = 9990; % 初始易感者
I0 = 10;   % 初始感染者
R0 = 0;   % 初始恢复者

% Time settings
days = 160;      % Total days to simulate
t = 0:days;      % Time vector

% Initialize arrays
S = zeros(1, days+1);
I = zeros(1, days+1);
R = zeros(1, days+1);

% Set initial values
S(1) = S0;
I(1) = I0;
R(1) = R0;

% SIR model differential equations
for day = 1:days
    dS = -beta * S(day) * I(day) / N ;
    dI = beta *S(day) * I(day) / N - gamma * I(day);
    dR = gamma * I(day);  
    % Update values
    S(day+1) = S(day) + dS;
    I(day+1) = I(day) + dI;
    R(day+1) = R(day) + dR;
end

% 绘制结果
figure;
plot(t, S, 'b', 'LineWidth', 2); hold on;
plot(t, I, 'r', 'LineWidth', 2);
plot(t, R, 'g', 'LineWidth', 2);
xlabel('时间 (天)');
ylabel('人数');
legend('易感者 (S)', '感染者 (I)', '恢复者 (R)');
title('SIR模型');
grid on;

