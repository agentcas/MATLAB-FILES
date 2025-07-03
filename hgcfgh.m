% Define the original signal
t = 0:0.1:10;  % time vector
x = sin(t);  % original signal

% Define the interpolation factor
interp_factor = 5;

% Zero-fill the signal
t_interp = 0:1/interp_factor:t(end);  % new time vector
x_interp = zeros(1, length(t_interp));  % initialize interpolated signal
x_interp(1:interp_factor:end) = x;  % zero-fill the signal

% Interpolate the signal using sinc interpolation
x_interp = sinc_interp(x_interp, interp_factor);

% Plot the original and interpolated signals
figure;
plot(t, x, 'bo-', t_interp, x_interp, 'r-');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Signal', 'Interpolated Signal');

% Sinc interpolation function
function y = sinc_interp(x, interp_factor)
    L = length(x);
    y = zeros(1, L);
    for n = 1:L
        for k = -floor(interp_factor/2):floor(interp_factor/2)
            y(n) = y(n) + x(mod(n+k-1, L)+1) * sinc((n-k)/interp_factor);
        end
    end
end