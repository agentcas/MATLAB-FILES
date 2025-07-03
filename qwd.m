% Define the original signal parameters
fs_original = 1000;  % original sampling frequency
t_original = 0:1/fs_original:1;  % time vector
x_original = sin(2*pi*10*t_original);  % original signal

% Define the sampling frequency for aliasing
fs_aliasing = 20;  % sampling frequency for aliasing

% Sample the original signal at the aliasing frequency
t_aliasing = 0:1/fs_aliasing:1;
x_aliasing = sin(2*pi*10*t_aliasing);

% Plot the original and aliased signals
figure;
subplot(3,1,1);
plot(t_original, x_original);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal');

subplot(3,1,2);
plot(t_aliasing, x_aliasing);
xlabel('Time (s)');
ylabel('Amplitude');
title('Aliased Signal');

% Define the parameters for reconstruction
fs_reconstruction = 1000;  % sampling frequency for reconstruction
t_reconstruction = 0:1/fs_reconstruction:1;  % time vector

% Reconstruct the original signal using sinc interpolation
x_reconstruction = zeros(size(t_reconstruction));
for i = 1:length(t_reconstruction)
    x_reconstruction(i) = sum(x_aliasing .* sinc((t_reconstruction(i) - t_aliasing) * fs_aliasing));
end

% Plot the reconstructed signal
subplot(3,1,3);
plot(t_reconstruction, x_reconstruction);
xlabel('Time (s)');
ylabel('Amplitude');
title('Reconstructed Signal');