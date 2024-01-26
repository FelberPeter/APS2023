function [yRec] = istft_ecekevin(X,win,overlap)
N = length(win);
hop = floor(N - N*overlap);

sigLength = length(X(1,:)) + 1;
yRec = zeros(sigLength*hop,1);
mask = zeros(sigLength*hop,1);

for ii = 1 : length(X)
  yfft(ii, :) = ifft( X(:,ii));
end

yRec(1:N) = yfft(1,:);

for ii = 1: sigLength-2
  offset = ii * hop;
  yRec(offset:offset+N-1) = yRec(offset:offset+N-1) + yfft(ii+1, :)';
end

mask(1:N) = win;
for ii = 1: sigLength-2
  offset = ii * hop;
  mask(offset:offset+N-1)  = mask(offset:offset+N-1)  + win;
end


z = X( 1:(N+2*hop) ) .* mask; % we claim that z is equal to y
x_ifft = ifft(z);

% max( abs (y - z) ) % check the claim -- the result should be numerically zero...
end