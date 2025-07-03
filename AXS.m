% Step 1: Define a Continuous-Time Signal
t = 0:0.01:1;  % time vector
x = sin(2 * pi * 8 * t);  % continuous-time signal

% Step 2: Sampling at Two Different Rates
% Proper sampling rate: 80 Hz
t_sampled_proper = 0:1/80:1;
x_sampled_proper = sin(2 * pi * 8 * t_sampled_proper);

% Under-sampling rate: 15 Hz
t_sampled_under = 0:1/15:1;
x_sampled_under = sin(2 * pi * 8 * t_sampled_under);

% Step 3: Reconstruct and Compare
% Reconstruct the original signal from the sampled signals
t_reconstructed = 0:0.01:1;
x_reconstructed_proper = interp1(t_sampled_proper, x_sampled_proper, t_reconstructed);
x_reconstructed_under = interp1(t_sampled_under, x_sampled_under, t_reconstructed);

% Plot the original continuous signal and the reconstructed signals
figure;

subplot(3,1,1)
plot(t, x, 'b-');
legend('Original Signal', 'Properly Sampled Signal', 'Under-Sampled Signal');
xlabel('Time (s)');
ylabel('Amplitude');
title('Comparison of Original and Reconstructed Signals');
grid on
subplot(3,1,2)
plot(t_reconstructed, x_reconstructed_proper)
legend('Original Signal', 'Properly Sampled Signal', 'Under-Sampled Signal');
xlabel('Time (s)');
ylabel('Amplitude');
title('Comparison of Original and Reconstructed Signals');
grid on 

subplot(3,1,3)
plot(t_reconstructed, x_reconstructed_under);
legend('Original Signal', 'Properly Sampled Signal', 'Under-Sampled Signal');
xlabel('Time (s)');
ylabel('Amplitude');
title('Comparison of Original and Reconstructed Signals');
grid on 