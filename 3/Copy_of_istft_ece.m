function [x_ifft] = istft_ece(x,win,overlap)
% The STFT representation is useful because it allows us to obtain interesting effects via simple operations on the STFT coefficients. So, when processing a signal with the STFT, the idea is to compute the STFT coefficients, modify the coefficients and then invert the STFT to obtain the modified signal in the time domain.
% We now discuss how to invert the STFT.
% Recall that the columns of Z hold the DFTs of the segments of x, modified by a window. For instance, we can obtain samples of x multipllied by a sliding window as follows.

% Window parameters
windowSize = length(win);
hop = floor(windowSize * (1 - overlap));
numFrames = size(x, 2);

reconstructedSignal = zeros((numFrames - 1) * hop + windowSize, 1);
%overlapMask = zeros(size(reconstructedSignal));

% Invers FFT
for frameIndex = 1:size(x, 2)
    timeDomainFrame = ifft(x(:, frameIndex));
    reconstructedSignal((frameIndex - 1) * hop + 1:(frameIndex - 1) * hop + windowSize) = timeDomainFrame;
end

% Überlappungseffekt durch Hinzufügen überlappender Abschnitte korrigieren
for frameIndex = 1:numFrames - 1
    startIdx = (frameIndex - 1) * hop + 1;
    endIdx = startIdx + windowSize - 1;
    reconstructedSignal(startIdx:endIdx) = reconstructedSignal(startIdx:endIdx) + ifft(x(:, frameIndex + 1))';
end

% Maske erstellen, um den Überlappungseffekt zu berücksichtigen
    overlapMask(1:windowSize) = win;
    for frameIndex = 1:numFrames 
        startIdx = (frameIndex) * hop ;
        endIdx = startIdx + windowSize -1;
        overlapMask(startIdx:endIdx) = overlapMask(startIdx:endIdx) + win;
    end

% Signal rekonstruieren (reconstructedSignal) durch Elementweises Multiplizieren von
% Spektrogramm mit der Überlappungsmaske
reconstructedSignal = x .* overlapMask;

% Ergebnis zurückgeben
x_ifft = ifft(reconstructedSignal);
end

