function [Angle] = Bit2Angle(zeroBits,value)
%BIT2ANGLE Summary of this function goes here
%   Detailed explanation goes here
    Nov2Bit = 820-512;
    %Grad2Bit = Nov2Bit/90;
    Bit2Grad = 90/Nov2Bit;
    Angle = (value - zeroBits)*Bit2Grad;
end

