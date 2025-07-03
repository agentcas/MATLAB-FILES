% Aliasing and Reconstruction

% parameters 
Fs1 = 50; % Sampling frequency > 2*20 Hz
Fs2 = 25; % Sampling frequency < 2*20 Hz
t = 0:0.001:1;
f=20;
x=sin(2*pi*f*t);

t1= 0:1/Fs1:1;
t2= 0:1/Fs2:1;

x1= sin(2*pi*f*t1);
x2=sin(2*pi*f*t2);

x1_reconstructed = interp1(t1, x1, t,'linear');
x2_reconstructed = interp1(t2, x2,t, 'linear');

subplot(3,1,1);
plot(t,x);
title('original signal');
subplot(3,1,2);
plot(t1,x1, 'o', t,x1_reconstructed, '-');
title('Resconstructed Signal (Fs1)');
subplot(3,1,3)
plot(t2,x2, 'o', t,x2_reconstructed, '-');
title('Resconstructed Signal (Fs2)');



