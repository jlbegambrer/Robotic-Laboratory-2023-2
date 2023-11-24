function [q] = CinematicaInversaPhantom(P,Theta)
    %CINEMATICAINVERSAPHANTOM Summary of this function goes here
    %   Detailed explanation goes here
    % Parametros iniciales
    L1 = 14.3;
    L2 = 10.6;
    L3 = 10.6;
    L4 = 11.0;

    % Desacople de 4 gdl a 3 gdl
    xp = P(1);
    yp = P(2);
    zp = P(3);
    wp = sqrt(xp^2 + yp^2);
    zt = zp - L4*sind(Theta);
    wt = wp - L4*cosd(Theta);
    
    % Calculo del ángulo 1
    alpha1 = atan2d(yp,xp);

    % Calculo de los ángulos 2,  3 y 4 en codo arriba
    z0 = zt - L1;
    r2 = wt^2 + z0^2;
    c_alpha3 = (r2 - L2^2 - L3^2)/(2*L2*L3);
    s_alpha3 = -sqrt(1 - c_alpha3^2);
    k1 = L2 + L3*c_alpha3;
    k2 = L3*abs(s_alpha3);
    alpha2 = atan2d(z0,wt) + atan2d(k2,k1);
    alpha3 = atan2d(s_alpha3,c_alpha3);
    alpha4 = Theta - alpha2 -alpha3;

    % Verificaciones con cinematica directa
    w2 = L2*cosd(alpha2);
    z2 = L1 + L2*sind(alpha2);

    w3 = w2 + L3*cosd(alpha2+alpha3);
    z3 = z2 + L3*sind(alpha2+alpha3);
    
    w4 = w3 + L4*cosd(alpha2+alpha3+alpha4);
    x4 = w4*cosd(alpha1);
    y4 = w4*sind(alpha1);
    z4 = z3 + L4*sind(alpha2+alpha3+alpha4);
    
    ThetaFin = atan2d(z4-z3,w4-w3);

    if (abs(x4-P(1))<0.0001) && (abs(y4-P(2))<0.0001) && (abs(z4-P(3))<0.0001) && (abs(ThetaFin-Theta)<0.0001)
        q = [alpha1;(alpha2-90);alpha3;alpha4];
    else
        fprintf('Error en calculo \n')
    end

end
