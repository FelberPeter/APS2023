function [X] = radix_fft_dit(x)    

p = nextpow2(length(x));                                                   
x = [x zeros(1,(2^p)-length(x))];     % Zero padding 
nSamples = length(x);      

O=log2(nSamples);                                                             
Half=1;

x = bitrevorder(x);  

for stage=1:O                                                              
    for index=0:(2^stage):(nSamples-1)                                            
        for n=0:(Half-1)                                                   
            pos=n+index+1;                                                  
            k=(2^(O-stage))*n;        

            w = exp((-1i)*(2*pi)*k/nSamples); 

            a=x(pos)+x(pos+Half).*w;                                        
            b=x(pos)-x(pos+Half).*w;
            
            x(pos)=a;                                                       
            x(pos+Half)=b;                                                  
        end
    end   
    Half=2*Half;                                                                
end

X=x;                                                                        
end