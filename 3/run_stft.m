clc;
clear all, close all;

[x, Fs] = audioread('speechfiles/bbaq7a.wav'); % Uttering "Been blue at Q 7 again"
x = resample(x, 16000, Fs); % How does resample work?

Fs = 16000;
d = rand(48000, 1) .* 0.05; % Noise generation, we will need that later as well

sigmaX1 = var(x);
sigmaX2 = var(d);
Rtarget = 10^(6/20);
Rcurrent = sigmaX1 / sigmaX2;
x_mix = x * sqrt(Rtarget / Rcurrent) + d;

tic
winlen_ms = 68;
overlap = 0.875;

N = floor(winlen_ms * Fs / 1000);

% Call your STFT computation HERE
win = hamming(N); % You can use any window type, here using Hamming as an example
[X_stft, vecT, vecF] = stft_ece(x_mix, win, overlap, Fs);

% Example for a STFT plot command
figure;
p = pcolor(vecT, vecF, 10 * log10(abs(X_stft(1:end/2, :))));
set(p, 'EdgeColor', 'none');
caxis([-30, 40]);
ylabel('Frequency (Hz)');
xlabel('Time (s)');
title('STFT of Mixed Signal');

% Reproduce the time signal by computing the iSTFT
x_reconstructed = istft_ece(X_stft, win, overlap);

% Plot the original and reconstructed signals
figure;
subplot(2, 1, 1);
plot(x_mix);
title('Mixed Signal');
xlabel('Sample');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(x_reconstructed);
title('Reconstructed Signal');
xlabel('Sample');
ylabel('Amplitude');
