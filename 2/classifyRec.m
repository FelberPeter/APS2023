function result = classifyRec(fs, threshold, freq_low_foi, freq_high_foi, freq_low_foni, freq_high_foni)



RecObj = audiorecorder(fs, 16, 2);
disp('Start speaking.')
recordblocking(RecObj, 2);
disp('End of Recording.');

x = getaudiodata(RecObj);


    % Extract the feature ratio using the calculateRatio function
    ratio = calculateRatio(x, fs, [freq_low_foi, freq_high_foi], [freq_low_foni, freq_high_foni]);

    % Compare with the threshold and classify
    if ratio <= threshold
        result = 'Yes';
    else
        result = 'No';
    end
end
