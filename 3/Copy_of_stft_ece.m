% (b) Implementing the Short-Time Fourier Transform (STFT) function
function [X_stft, vecT, vecF] = stft_ece(x, win, overlap, fs)
    % x: input signal
    % win: window function
    % overlap: overlap factor (e.g., 0.5 for 50% overlap)
    % fs: sampling frequency
    
    % Your STFT implementation here
    
    % Example: Using spectrogram function for STFT
    [X_stft, vecF, vecT] = spectrogram(x, win, round(overlap * length(win)), [], fs);
end