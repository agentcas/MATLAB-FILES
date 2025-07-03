% MATLAB Code to convert FIR filter to Lattice structure and simulate output

% Clear workspace
clear; clc; close all;

% Define FIR filter coefficients
b = [1, -0.7, 0.55]; % Coefficients of H(z)

% Number of coefficients
N = length(b);

% Initialize lattice parameters
k = zeros(1, N-1);
% The reflection coefficients for the FIR filter
k(1) = -b(2) / b(1); % First reflection coefficient
for n = 2:N-1
    k(n) = -b(n+1) / (b(1) + sum(b(2:n) .* k(1:n-1)));
end

% Display the reflection coefficients
disp('Reflection coefficients (k):');
disp(k);

% Create a unit step input signal
N_samples = 50; % Number of samples
u = ones(1, N_samples); % Unit step input signal

% Initialize output signal
y = zeros(1, N_samples);

% Lattice filter implementation
for n = 1:N_samples
    % Initialize the input to the lattice structure
    x = u(n);
    
    % Compute the output using the lattice structure
    for m = 1:N-1
        % Update output signal
        y(n) = y(n) + (k(m) * x);
        
        % Update the input for the next stage
        x = x + k(m) * y(n);
    end
end

% Plotting the results
figure;
subplot(2,1,1);
stem(u, 'filled');
title('Unit Step Input Signal');
xlabel('Sample Number');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
stem(y, 'filled');
title('Output Signal from Lattice Structure');
xlabel('Sample Number');
ylabel('Amplitude');
grid on;

% Display the output signal
disp('Output Signal:');
disp(y);
