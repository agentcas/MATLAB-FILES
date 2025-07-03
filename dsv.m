%% Sample Rate Conversion using Zero-padding and Interpolation

% Original signal parameters
fs1 = 44.1e3; % Original sample rate (44.1 kHz)
t1 = 0:1/fs1:0.01; % Time vector
f_original = 10e3; % Original signal frequency (10 kHz)
x1 = sin(2*pi*f_original*t1); % Original signal

% Upsampling parameters
upsampling_factor = 160; % Upsampling factor
fs2 = fs1 * upsampling_factor; % Upsampled sample rate

% Zero-padding upsampling
x2 = zeros(1, length(x1) * upsampling_factor); % Create zero-padded vector
x2(1:upsampling_factor:end) = x1; % Insert original samples

% Low-pass filter design
cutoff_freq = fs1/2; % Cutoff frequency at Nyquist frequency of the original signal
filter_order = 100; % Filter order
Wn = cutoff_freq/(fs2/2); % Normalized cutoff frequency
[b, a] = butter(filter_order, Wn, 'low'); % Design Butterworth low-pass filter

% Filtering the upsampled signal
x3 = filter(b, a, x2); % Apply low-pass filter

% Downsampling parameters
downsampling_factor = 20; % Downsampling factor
fs3 = fs2 / downsampling_factor; % Downsampled sample rate

% Downsampling
x4 = x3(1:downsampling_factor:end); % Downsample the filtered signal
t4 = 0:1/fs3:length(x4)/fs3 - 1/fs3; % Time vector for downsampled signal

%% Plotting the results

figure;

% Plot the original signal
subplot(6,1,1);
plot(t1, x1);
title('Original Signal (44.1 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot the upsampled signal with zero filling
subplot(6,1,2);
stem(0:1/fs2:length(x2)/fs2-1/fs2, x2);
hold on;
stem(t1,x1,'ro')
legend('Inserted zeros = 159','Original Samples');
title('Upsampled Signal with Zero Filling (7056000 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot the amplitude of the upsampled signal (including zeros)
subplot(6,1,3);
plot(0:1/fs2:length(x2)/fs2-1/fs2, abs(x2));
title('Amplitude of the Upsampled Signal (Including Inserted Zeros)');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot the interpolated signal after low-pass filtering
subplot(6,1,4);
plot(0:1/fs2:length(x3)/fs2-1/fs2, x3);
title('Interpolated Signal After Low-pass Filtering');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot the downsampled signal
subplot(6,1,5);
plot(t4, x4);
title('Downsampled Signal (48 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot the low-pass filter frequency response
[h,f] = freqz(b, a, 1024, fs2);
subplot(6,1,6);
plot(f, abs(h));
title('Low-pass Filter Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Adjust subplot spacing
make_it_tight = true;
if make_it_tight
   % reposition subplots
   pPos = get(gcf,'PaperPosition');
   set(gcf,'PaperPosition',[.25 .25 pPos(3:4)])
   % reposition axis
   for ii=1:4
     tPos = get(subplot(4,1,ii),'Position');
     set(subplot(4,1,ii),...
         'Position',[tPos(1) 1-ii*.23 tPos(3:4)]);
   end
end