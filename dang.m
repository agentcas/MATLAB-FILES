% MATLAB code to simulate the MIMO system: y[n+1] = -0.5y[n] + 2x[n]

% Parameters
N = 50; % Number of samples
x = ones(1, N); % Input signal (step input)
y = zeros(1, N); % Output signal

% Simulate the system
for n = 1:N-1
    y(n+1) = -0.5 * y(n) + 2 * x(n);
end

% Plot the results
figure;
subplot(2, 1, 1);
stem(0:N-1, x, 'filled');
title('Input Signal x[n]');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(2, 1, 2);
stem(0:N-1, y, 'filled');
title('Output Signal y[n]');
xlabel('n');
ylabel('y[n]');
grid on;

% Enhance the layout
sgtitle('MIMO System Response');