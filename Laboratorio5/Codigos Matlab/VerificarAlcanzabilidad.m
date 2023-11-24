function [Alcanzable] = VerificarAlcanzabilidad(P,Theta,q)
    %VERIFICARALCANZABILIDAD Summary of this function goes here
    %   Detailed explanation goes here
    L1 = 14.3;
    L2 = 10.6;
    L3 = 10.6;
    L4 = 11.0;
    
    dsec = 1.0;
    hsec = 6.5;
    rsec = 18.0;

    xp = P(1);
    yp = P(2);
    zp = P(3);
    zhr = zp - L1;

    wp = sqrt(xp^2 + yp^2);
    rp = sqrt(xp^2 + yp^2 + zhr^2);

    q1 = Angle2Bit(0,q(1));
    q2 = Angle2Bit(0,q(2));
    q3 = Angle2Bit(0,q(3));
    q4 = Angle2Bit(0,q(4));

    if (zp < hsec)
        Alcanzable = false;
    elseif (abs(Theta) > 90)
        Alcanzable = false;
    elseif (wp < rsec)
        Alcanzable = false;
    elseif (q1 > 1023 && q1 < 0)
        Alcanzable = false;
    elseif (q2 > 880 && q2 < 140)
        Alcanzable = false;
    elseif (q3 > 880 && q3 < 140)
        Alcanzable = false;
    elseif (rp >= (L2+L3+L4-dsec))
        Alcanzable = false;
    elseif (q4 > 830 && q4 < 190)
        Alcanzable = false;    
    else 
        Alcanzable = true;
    end
end

