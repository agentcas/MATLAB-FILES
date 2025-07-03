% Define the sampling frequencies
fs1 = 240; % Hz
fs2 = 1000; % Hz

% Define the time vector for the continuous signal
t = linspace(0, 0.02, 1000); 

% Define the continuous signal
x = sin(2*pi*50*t);

% Sample the continuous signal at the different frequencies
x1 = x(1:4:end); % fs1 = 240 Hz
x2 = x(1:16:end); % fs2 = 1000 Hz

% Plot the results
figure;
subplot(3,1,1);
plot(t,x);
xlabel('Time (s)');
ylabel('x(t)');
title('Continuous');
grid on;

subplot(3,1,2);
stem(x1);
xlabel('Sample Index (n)');
ylabel('x[n]');
title('4 samples/period');
axis([0 5 -1 1]);
text(4,0.1,'fs = 240 Hz');
grid on;

subplot(3,1,3);
stem(x2);
xlabel('Sample Index (n)');
ylabel('x[n]');
title('16.67 samples/period');
axis([0 20 -1 1]);
text(18,0.1,'fs = 1000 Hz');
grid on;