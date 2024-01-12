function [vX]=computeDTFT(vn,vx,vw)

X = vx' .* exp(-1j .* vn' .* vw);
vX = sum(X, 1);
end