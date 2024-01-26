function [X_stft, vecT, vecF] = stft_ece2(x, win, overlap, fs)
    % Parameters
    hop = win * (1 - overlap);
    N = length(x);
    
    % Initialize variables
    numWindows = ((N - win) / hop) + 1;
   % X_stft = zeros(win, numWindows);
    vecT = (0:numWindows-1) * hop / fs;
    vecF = (0:win-1) * fs / win;
    
    % Compute STFT
    for i = 1:numWindows
        startIdx = (i - 1) * hop + 1;
        endIdx = startIdx + win - 1;
        windowedSignal = x(startIdx:endIdx) .* win;
        X_stft(:, i) = fft(windowedSignal);
    end
end
