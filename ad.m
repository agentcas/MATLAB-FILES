
%Define the signal parameters
fs = 100000;  % sampling frequency
f_sig = 45200; % signal frequency
t_end = 0.01; % signal duration
t = np.arange(0, t_end, 1/fs);  % time array

% Generate the original signal
x = np.sin(2 * np.pi * f_sig * t);

% Define the upsampled frequency
fs_up = 7156000;

% Calculate the upsample factor
up_factor = fs_up / fs;

% Upsample the signal with zero filling
x_up = np.zeros(int(len(x) * up_factor))
x_up[::int(up_factor)] = x;
from scipy.signal import butter, lfilter;

% Define the filter parameters
fc = 100000  % cutoff frequency
order = 5

% Design the filter
b, a = butter(order, fc / (fs_up / 2), btype='low')

% Filter the upsampled signal
x_filt = lfilter(b, a, x_up)
plt.figure(figsize=(12, 6))

plt.subplot(3, 1, 1)
plt.plot(t, x)
plt.title('Original Signal')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')

plt.subplot(3, 1, 2)
plt.plot(np.arange(0, len(x_up) / fs_up, 1/fs_up), x_up)
plt.title('Upsampled Signal')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')

plt.subplot(3, 1, 3)
plt.plot(np.arange(0, len(x_filt) / fs_up, 1/fs_up), x_filt)
plt.title('Interpolated Signal')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')

plt.tight_layout()
plt.show()

from scipy.signal import freqz

% Calculate the frequency response
w, h = freqz(b, a, worN=2000);

% Plot the frequency response
plt.figure(figsize=(8, 6))
plt.plot(w / (2 * np.pi), np.abs(h))
plt.title('Low Pass Filter Frequency Response')
plt.xlabel('Frequency (Hz)')
plt.ylabel('Magnitude')
plt.show()
