function [filteredData] = myMovingAverage(data, windowSize)
    dataSize = length(data);
    filteredData = zeros(size(data));

    for i = 1:dataSize
        % Bestimme den Start- und Endindex des aktuellen Fensters
        startIdx = max(1, i - floor(windowSize/2));
        endIdx = min(dataSize, i + floor(windowSize/2));

        % Berechne den Mittelwert im aktuellen Fenster
        filteredData(i) = mean(data(startIdx:endIdx));
    end
end