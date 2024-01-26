function [x_ifft] = istft_ece(X,win,overlap)
% The STFT representation is useful because it allows us to obtain interesting effects via simple operations on the STFT coefficients. So, when processing a signal with the STFT, the idea is to compute the STFT coefficients, modify the coefficients and then invert the STFT to obtain the modified signal in the time domain. 
% We now discuss how to invert the STFT.
% Recall that the columns of Z hold the DFTs of the segments of x, modified by a window. For instance, we can obtain samples of x multipllied by a sliding window as follows.

y1 = ifft( Z(:,1) ); % the first N samples multiplied by the window
y2 = ifft( Z(:,2) ); % the samples in between ( hop + (1:N) ) multiplied by the window.
y3 = ifft( Z(:,3) ); % the samples in between ( 2*hop + (1:N) ) multiplied by the window.

% In an attempt to reconstruct x, we combine these pieces as follows.
                                                                                           
y = zeros(N + 2*hop,1);
y(1:N) = y1;
y( hop + (1:N) ) = y( hop + (1:N) ) + y2;
y( 2*hop + (1:N) ) = y( 2*hop + (1:N) ) + y3;
% We would like y to be equal to the first samples of x but this is not the case. We need to take into account the windowing. In fact y can be seen to be equal to a masked version of x. The mask can be constructed similar to y.

mask = zeros(N + 2*hop,1);
mask(1:N) = win;
mask( hop + (1:N) ) = mask( hop + (1:N) ) + win;
mask( 2*hop + (1:N) ) = mask( 2*hop + (1:N) ) + win;

z = x( 1:(N+2*hop) ) .* mask; % we claim that z is equal to y

% max( abs (y - z) ) % check the claim -- the result should be numerically zero...
end