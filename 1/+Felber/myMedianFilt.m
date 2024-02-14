function filteredData = myMedianFilt(data, windowSize)
  dataSize = length(data);
    filteredData = zeros(size(data));

    % Iterate over the data
    for i = 1:dataSize
        % Define the window indices
        startIdx = i - windowSize + 1;
        if startIdx < 1
            startIdx = 1;
        end
        endIdx = i;
        
        % Calculate the mean over the window
        filteredData(i) = median(data(startIdx:endIdx));
    end
end
