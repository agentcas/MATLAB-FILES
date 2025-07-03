% Time vector for continuous signal
t = 0:1/2000:0.02; 
x = cos(2*pi*60*t); 

% Time vector for 240 Hz sampled signal
t240 = 0:1/240:0.02; 
n240 = 0:length(t240)-1; 
x240 = cos(2*pi*60/240*n240); 

% Time vector for 1000 Hz sampled signal
t1000 = 0:1/1000:0.02; 
n1000 = 0:length(t1000)-1; 
x1000 = cos(2*pi*60/1000*n1000); 

% Create figure and subplots
figure;

% Subplot 1: Continuous signal
subplot(4,1,1);
plot(t, x);
title('Continuous Signal (60 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Subplot 2: 240 Hz sampled signal
subplot(4,1,2);
plot(t240, x240);
title('Sampled Signal at 240 Hz');
xlabel('Time (s)');
ylabel('Amplitude');
text(1, 0.5, 'Sampled Signal', 'FontSize', 12); % Adjust text position as needed
grid on;

% Subplot 3: 1000 Hz sampled signal
subplot(4,1,3);
plot(t1000, x1000);
title('Sampled Signal at 1000 Hz');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% 
% Optional: Subplot 4 can be added for additional analysis or comparison