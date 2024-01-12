function smoothedData = myWeightedMA(data, sampleLength, weights)
    % Check if the length of weights is equal to sampleLength
    if length(weights) ~= sampleLength
        error('Length of weights must be equal to sampleLength.');
    end
    
    % Normalize weights to ensure they sum to one
    weights = weights / sum(weights);
    
    % Apply weighted moving average
    smoothedData = conv(data, weights, 'same');
end
