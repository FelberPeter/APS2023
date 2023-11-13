function vDelta = vDeltaFun(vn)    
  vDelta = zeros(size(vn));
  vDelta(vn == 0) = 1;
end