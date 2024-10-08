% SEIR Model Simulation

% Parameters
beta = 0.3;      % Infection rate
sigma = 0.1;     % Rate of incubation (1/latent period)
gamma = 0.1;     % Rate of recovery (1/infectious period)

% Initial conditions
N = 10000;       % Total population
S0 = 9990;       % Initial susceptible
E0 = 5;          % Initial exposed
I0 = 5;          % Initial infected
R0 = 0;          % Initial recovered

% Time settings
days = 160;      % Total days to simulate
t = 0:days;      % Time vector

% Initialize arrays
S = zeros(1, days+1);
E = zeros(1, days+1);
I = zeros(1, days+1);
R = zeros(1, days+1);

% Set initial values
S(1) = S0;
E(1) = E0;
I(1) = I0;
R(1) = R0;

% SEIR model differential equations
for day = 1:days
    dS = -beta * S(day) * I(day) / N;
    dE = beta * S(day) * I(day) / N - sigma * E(day);
    dI = sigma * E(day) - gamma * I(day);
    dR = gamma * I(day);
    
    % Update values
    S(day+1) = S(day) + dS;
    E(day+1) = E(day) + dE;
    I(day+1) = I(day) + dI;
    R(day+1) = R(day) + dR;
end

% Plot the results
figure;
plot(t, S, 'g', 'LineWidth', 2); hold on;
plot(t, E, 'y', 'LineWidth', 2);
plot(t, I, 'r', 'LineWidth', 2);
plot(t, R, 'b', 'LineWidth', 2);
xlabel('Days');
ylabel('Population');
title('SEIR Model Simulation');
legend('Susceptible', 'Exposed', 'Infected', 'Recovered');
grid on;
hold off;
