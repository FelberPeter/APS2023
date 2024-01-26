function [x_ifft] = istft_ece(x,win,overlap)

% Window parameters
windowSize = length(win);
hop = floor(windowSize * (1 - overlap));
numFrames = size(x, 2);

reconstructedSignal = zeros((numFrames) * hop + windowSize - hop, 1);

% Invers FFT
for frameIndex = 1:numFrames
    beginWindow = 1 + (hop*(frameIndex-1));
    endWindow = beginWindow + windowSize - 1;
    segment = ifft(x(:, frameIndex));
    reconstructedSignal(beginWindow : endWindow) = reconstructedSignal(beginWindow : endWindow) + segment;
end


% Return
x_ifft = reconstructedSignal;
end

