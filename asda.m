% Original Signal
t = 0:1/44100:0.85;
x = sin(2*pi*440*t);

% Upsampling with Zero Filling
T = 1/(7056000);
x_up = zeros(1, length(t)*160);
x_up(1:160:end) = x;

% Low-pass Filtering
b = fir1(100, 1/(160*T), 'low');
x_interp = filter(b, 1, x_up);

% Plotting
figure(1);
subplot(4,1,1);
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal (44.1 kHz)');

subplot(4,1,2);
t_up = 0:T:0.85*160*T;
plot(t_up, x_up);
xlabel('Time (s)');
ylabel('Amplitude');
title('Upsampled Signal with Zero Filling (7056000 kHz)');

subplot(4,1,3);
plot(t_up, x_interp);
xlabel('Time (s)');
ylabel('Amplitude');
title('Interpolated Signal After Low-pass Filtering');

subplot(4,1,4);
[h, f] = freqz(b, 1, 1024);
plot(f, abs(h));
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Low-pass Filter Frequency Response');