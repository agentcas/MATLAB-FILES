% --- 1. Define Original Signal ---
fs_original = 45200; % Original sampling frequency (Hz)
t_original = 0:1/fs_original:0.001; % Time vector (adjust duration as needed)

% Replace this with your actual signal generation:
original_signal = 0.2*sin(2*pi*1000*t_original); 

% --- 2. Upsampling with Zero Filling ---
upsampling_factor = 7156000/fs_original; % Calculate upsampling factor
upsampled_signal = zeros(1, length(original_signal)*upsampling_factor); % Pre-allocate

% Insert original samples into upsampled signal
upsampled_signal(1:upsampling_factor:end) = original_signal; 

% --- 3. Low-Pass Filter Design ---
cutoff_frequency = 20000; % Hz (Adjust as needed)
% Choose a filter design method (e.g., fir1, butter, etc.)
% Example using a Butterworth filter:
[b, a] = butter(6, cutoff_frequency/(fs_original*upsampling_factor/2)); 

% --- 4. Apply Low-Pass Filter ---
filtered_signal = filter(b, a, upsampled_signal);

% --- 5. Plotting ---
figure;
subplot(4,1,1); plot(t_original, original_signal); 
title('Original Signal'); xlabel('Time (s)'); ylabel('Amplitude');

t_upsampled = 0:1/(fs_original*upsampling_factor):(length(upsampled_signal)-1)/(fs_original*upsampling_factor);
subplot(4,1,2); plot(t_upsampled, upsampled_signal); 
title('Upsampled Signal with Zero Filling'); xlabel('Time (s)'); ylabel('Amplitude');

subplot(4,1,3); plot(t_upsampled, filtered_signal);
title('Interpolated Signal After Low-pass Filtering'); xlabel('Time (s)'); ylabel('Amplitude');

[h, w] = freqz(b, a);
subplot(4,1,4); plot(w/pi*fs_original*upsampling_factor/2, abs(h));
title('Low-pass Filter Frequency Response'); xlabel('Frequency (Hz)'); ylabel('Magnitude');