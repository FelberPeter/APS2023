function updateSound(valueG1, valueG2, valueG3)
    % Filter signals
    y1_left = filter(b_1, a_1, x_left);
    y1_right = filter(b_1, a_1, x_right);
    y1 = [y1_left y1_right];

    y2_left = filter(b_2, a_2, x_left);
    y2_right = filter(b_2, a_2, x_right);
    y2 = [y2_left y2_right];

    y3_left = filter(b_3, a_3, x_left);
    y3_right = filter(b_3, a_3, x_right);
    y3 = [y3_left y3_right];

    % Combine signals with gains
    y = valueG1 * y1 + valueG2 * y2 + valueG3 * y3;

    % Play the mixed audio
    sound(y, Fs);
end