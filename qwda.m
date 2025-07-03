sound(x,fs)

figure
tiledlayout(2,1)

nexttile
plot(t,x)
ylabel("Amplitude")
title("Audio Signal")
axis tight

nexttile
pitch(x,fs,Method="SRH",WindowLength=winLength,OverlapLength=overlapLength)
title("Pitch Estimations")
