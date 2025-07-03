%% STEP 1: ZERO FILLING
% Upsample the signal by L (increasing the sample rate)
x_upsampled = upsample(x, L); % Insert L-1 zeros between samples

% Calculate the time vector for the upsampled signal at 159 kHz
t_upsampled_159kHz = 0:1/(L*Fs_in):1;
f_159kHz = 159000;
t_159kHz = 0:1/(L*Fs_in):1/f_159kHz;
x_159kHz = sin(2 * pi * f_159kHz * t_159kHz);

% Plot the upsampled signal with zero filling at 159 kHz
subplot(4,1,2);
stem(t_upsampled_159kHz(1:1000), x_159kHz(1:1000));
title('Upsampled Signal with Zeros at 159 kHz');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;
legend('Upsampled Signal at 159 kHz');
grid on;