% Define the time vector
time = 0:0.0001:0.02; % Assuming a time step of 0.0001s

% Define the frequency of the signal
frequency = 48; % Hz (adjust based on the graph)

% Generate the signal (sine wave in this case)
signal = sin(2*pi*frequency*time);

% Plot the signal
plot(time, signal);

% Label the axes
xlabel('Time (s)');
ylabel('Amplitude');

% Title the plot
title('Low-pass Filter Frequency Response');

% Adjust the plot limits if needed
xlim([0 0.02]);
ylim([-0.015 0.015]);

% Display the plot
grid on;