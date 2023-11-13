function vStep = vStepFun(vn)    
  vStep = zeros(size(vn));
  vStep(vn >= 0) = 1;
end
