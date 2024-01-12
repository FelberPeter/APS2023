function result = classifyAudio(audioFile, threshold, freq_low_foi, freq_high_foi, freq_low_foni, freq_high_foni)
    % Read the audio file
    [y, fs] = audioread(audioFile);

    % Extract the feature ratio using the calculateRatio function
    ratio = calculateRatio(y, fs, [freq_low_foi, freq_high_foi], [freq_low_foni, freq_high_foni]);

    % Compare with the threshold and classify
    if ratio <= threshold
        result = 'Yes';
    else
        result = 'No';
    end
end
