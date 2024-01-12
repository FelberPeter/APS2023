function [X_stft, vecT, vecF] = stft_ece(x, win, overlap, fs)
    % STFT function with support for different window types
    
    % Check if the input signal 'x' is a column vector, if not, transpose it
    if size(x, 2) > 1
        x = x';
    end
    
    % Length of the signal
    N = length(x);
    
    % Window parameters
    windowSize = length(win);
    hop = windowSize * (1 - overlap);
    
    % Calculate the number of time steps
    numTimeSteps = floor((N - windowSize) / hop) + 1;
    
    % Initialize STFT matrix
    X_stft = zeros(windowSize, numTimeSteps);
    
    % Compute STFT
    for t = 1:numTimeSteps
        % Extract current windowed segment
        segment = x((t-1)*hop + 1 : (t-1)*hop + windowSize) .* win;
        
        % Compute FFT and store in STFT matrix
        X_stft(:, t) = fft(segment);
    end
    
    % Create time and frequency vectors
    vecT = (0:numTimeSteps-1) * hop / fs;
    vecF = (0:windowSize-1) * fs / windowSize;
    
    % Return results
    return
end
