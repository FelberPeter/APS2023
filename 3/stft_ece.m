function [X_stft, vecT, vecF] = stft_ece(x, win, overlap, fs)
    % STFT function with support for different window types
    
    % Length of the signal
    N = length(x);
    
    % Window parameters
    windowSize = length(win);
    hop = floor(windowSize * (1 - overlap));
    
    % Calculate the number of time steps
    numTimeSteps = floor((N - windowSize) / hop)+1;
    
    % Initialize STFT matrix
    X_stft = zeros(windowSize, numTimeSteps);
    
    % Compute STFT
    for t = 1:numTimeSteps
        beginWindow = 1 + (hop*(t-1));
        endWindow = beginWindow + windowSize - 1;  
        
        % Extract current windowed segment
        segment = x(beginWindow:endWindow) .* win;
        
        % Compute FFT and store in STFT matrix
        X_stft(:, t) = fft(segment);
    end
    
    % Create time and frequency vectors
    vecT = (0:numTimeSteps-1) * hop / fs;
    vecF = (0:windowSize-1) * fs / windowSize;

end
