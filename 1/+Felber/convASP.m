function vconOut = convASP(vInput1, vInput2)
    vconOut = zeros(1, length(vInput1) + length(vInput2) - 1);
    
    for n = 1:length(vInput1)
        vconOut(n:n+length(vInput2)-1) = vconOut(n:n+length(vInput2)-1) + vInput1(n) * vInput2;
    end
end