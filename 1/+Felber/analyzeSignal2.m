function [vxe, vxo] = analyzeSignal2(vn, vx)
    ve = 0.5 * (vx + fliplr(vx));  % Even part
    vo = 0.5 * (vx - fliplr(vx));  % Odd part

    % Shift by vn
    vxe = ve; % circshift(ve, -vn);
    vxo = vo;   %circshift(vo, vn);
end
