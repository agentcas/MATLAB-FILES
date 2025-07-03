% MATLAB code to simulate the response of the system to an impulse input

% Define the parameters
N = 50; % Number of samples
x = zeros(1, N); % Input signal
x(1) = 1; % Impulse input at n=0

% Initialize the output signal
y = zeros(1, N);

% Define the coefficients
a1 = 1.5; % Coefficient for y[n-1]
b0 = 1;   % Coefficient for x[n]
b1 = -0.5; % Coefficient for x[n-1]

% Simulate the system using the difference equation
for n = 2:N
    y(n) = a1 * y(n-1) + b0 * x(n) + b1 * x(n-1);
end

% Plot the results
figure;
stem(0:N-1, y, 'filled');
title('Impulse Response of the System');
xlabel('n');
ylabel('y[n]');
grid on;