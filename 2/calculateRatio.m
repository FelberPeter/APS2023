function ratio = calculateRatio(signal, fs, foi_range, foni_range)
    % Perform FFT
    Y = fft(signal);

    % Frequency vector
    frequencies = linspace(0, fs/2, length(Y)/2);

    % Indices for FOI and FONI
    foi_indices = find(frequencies >= foi_range(1) & frequencies <= foi_range(2));
    foni_indices = find(frequencies >= foni_range(1) & frequencies <= foni_range(2));

    % Calculate the sum of magnitudes for FOI and FONI
    sum_foi = sum(abs(Y(foi_indices)));
    sum_foni = sum(abs(Y(foni_indices)));

    % Calculate the ratio
    ratio = sum_foni / sum_foi;
end
