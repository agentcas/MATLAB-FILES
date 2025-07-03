% Define the data points
n = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
y = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -2840 -4773 -6912];

% Plot the graph
plot(n, y, 'o-');

% Set labels and title
xlabel('n');
ylabel('y[n]');
title('Simulated System Response');

% Set grid
grid on;