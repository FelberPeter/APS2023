clc;
clear all, close all;


[x,Fs] = audioread('bbaq7a.wav'); % Uttering "Been blue at Q 7 again"
x = resample(x,16000,Fs); %How does resample work?

Fs = 16000;
d = rand(48000,1).*0.05; % Noise generation, we will need that later as well

sigmaX1 = var(x);
sigmaX2 = var(d);
Rtarget = 10^(6/20);
Rcurrent = sigmaX1/sigmaX2;
x_mix = x*sqrt(Rtarget/Rcurrent) + d; 

tic
winlen_ms = 68;
overlap = 0.875;

N = floor(winlen_ms*Fs/1000);

% TODO: Call your STFT computation HERE

%% Example for a STFT plot command
% figure
% p = pcolor(vecT,vecF,10*log(abs(P_stft(1:end/2,:))));
% set(p,'EdgeColor','none');
% caxis([-30,40])
% ylabel('Frequency (Hz)');
% xlabel('Time (s)');

% TODO: reproduce the time signal by computing the iSTFT