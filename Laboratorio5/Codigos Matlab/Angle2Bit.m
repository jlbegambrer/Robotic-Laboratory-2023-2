function [Bits] = Angle2Bit(zeroGrad,value)
    %ANGLE2BIT Summary of this function goes here
    %   Detailed explanation goes here
    Nov2Bit = 820-512;
    Grad2Bit = Nov2Bit/90;
    %Bit2Grad = 90/Nov2Bit;
    Bits = 512 + value*Grad2Bit + zeroGrad*Grad2Bit;
    Bits = floor(Bits);
end

