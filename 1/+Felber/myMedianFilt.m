function filteredSignal = myMedianFilt(signal, sampleLength)
    windowcenter = sampleLength/2;

    % Initialize the filtered signal
    filteredSignal = zeros(size(signal));

    %Median für die ersten stellen
    StartMedianValue = median(signal(1:sampleLength));
    filteredSignal(1:windowcenter) = StartMedianValue;

    % Apply median filter
    for i = 1:size(signal)-sampleLength 
        window = signal(i:i + sampleLength-1);
        WindowMedianValue = median(window);
        filteredSignal(i+windowcenter) = WindowMedianValue;
    end
    
    %Median für die ersten stellen
    EndMedianValue = median(signal(end-sampleLength:end));
    filteredSignal(end-windowcenter:end) = EndMedianValue;

end
