function [vxe, vxo] = analyzeSignal(vn, vx)
    % vn: Zeitvektor
    % vx: Eingangssignal

    % Bestimme die Parität von vn
    is_odd = mod(vn, 2) == 1;

    % Berechne die geraden (vxe) und ungeraden (vxo) Teile basierend auf der Parität
    vxe = vx;
    vxe(is_odd) = 0;  % Setze den ungeraden Teil von vxe auf 0

    vxo = vx;
    vxo(~is_odd) = 0;  % Setze den geraden Teil von vxo auf 0
end
