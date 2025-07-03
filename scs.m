t=0:01/2000:.02;
x=cos(2*pi*60*t);
t240=0:1/240:.02;
n240=0:length(t240)-1;
x240=cos(2*pi*60/240*n240);
axis([0 4.8 -1 1])
t1000=0:1/1000:.02;
n1000=0:length(t1000)-1;
x1000=cos(2*pi*60/900*n1000);
figure;
subplot(4,1,1)
plot(t,x)
plotyy=("Continuous");
grid on;
subplot(4,1,2)
plot(t240,x240)
text(1,5, 'test')
grid on
subplot(4,1,3)
plot(t1000,x1000)
grid on
