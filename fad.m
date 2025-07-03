% Define the parameters
A = -0.5; % State matrix
B = 2;    % Input matrix
C = 1;    % Output matrix
D = 0;    % Direct transmission matrix

% Define the simulation parameters
n = 0:50; % Time vector
x = sin(0.1 * n); % Input signal (you can change this to any other signal)

% Initialize the state and output vectors
y = zeros(size(n)); % Output vector
y(1) = 0; % Initial condition

% Simulate the system
for i = 1:length(n)-1
    y(i+1) = A * y(i) + B * x(i); % Update the output using the state equation
end

% Plot the results
figure;
subplot(2,1,1);
plot(n, x, 'b', 'LineWidth', 1.5); % Plot input signal
title('Input Signal x[n]');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(2,1,2);
plot(n, y, 'r', 'LineWidth', 1.5); % Plot output signal
title('Output Signal y[n]');
xlabel('n');
ylabel('y[n]');
grid on;

% Improve layout
sgtitle('State Space Analysis of the System');