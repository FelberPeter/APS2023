function [vTestFunction] = scaleFunc(sig,n,new_n)

% For this implementation sig, n & new_n need to be row vectors

    vTestFunction = sum(sig'.*signals.deltaFunction(new_n-n'));

end