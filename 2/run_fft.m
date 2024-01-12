%% Generate test signal

Fs = 128;                                                       % Sampling rate
dT = 1/Fs;                                                      % time step
nSamples = 512;                                                 % number of samples
index = 0:1:nSamples-1;                                         % n-Vektor sample vector
t = index.*dT;                                                  % time vector

dF = (Fs / nSamples);                                           % Frequency Resolution

frequ = [13, 56, 96];                                           % Existing frequencies

x = zeros(1,length(t));                                         % just a vector only including zeros
y = sum(sin(2*pi*frequ'*t),1);                                  % signal vector including the frequencies

[Y] = radix_fft_dit(y);                                         % Radix-FFT 

dF = (Fs / length(Y));                                          % Frequency Resolution
index = 0:1:length(Y)-1;
fft_scale = index .* dF; 

stem(fft_scale(1:end), abs(Y(1:end)))
xlabel('Frequency (Hz)','FontSize',14)
xline(Fs/2,'--');