function [X_stft, vecT, vecF] = stft_ece_help(x,win,overlap,fs)
% The STFT : How to implement
% The idea in STFT is to take a small chunk using a window, compute its DFT and place it as the column of a matrix. Then, you move the window a little and compute the DFT again. We will collect the STFT coefficients into the matrix Z. Here is the first step.

F = fft( x(1:N) .* win );
Z = F; %F is the first column of Z
% The next column is obtained by sliding the window by 'hop' samples. This is also referred to as the 'hop-size'.

F = fft( x( hop + (1:N) ) .* win ); % this is equivalent to sliding the window. You could also use a FOR-Loop to solve this problem
Z(:,2) = F;
% You see the pattern ...

F = fft( x( 2*hop + (1:N) ) .* win ); % this is equivalent to sliding the window
Z(:,3) = F;

% This is continued until you reach the end of 'x'. Write a function called STFT which can be called as above.
end