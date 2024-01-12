function plotdtft(sound,samplingrate)
figure;

N = 1000;
[H_sound, w_sound] = freqz(sound, 1, N, samplingrate);
plot(w_sound, abs(H_sound));
title('DTFT');
xlabel('Frequency (Hz)');
ylabel('|H(w)|');