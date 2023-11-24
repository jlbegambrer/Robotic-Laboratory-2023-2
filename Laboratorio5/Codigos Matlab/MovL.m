function [Ppath] = MovL(port_num,PROTOCOL_VERSION,P,Theta,speed,deltaLmax,deltat)
    %MOVL Summary of this function goes here
    %   Detailed explanation goes here
    [~,Pin,~] =ActualPosition(port_num,PROTOCOL_VERSION);
    Dtotal = norm(P-Pin);
    Puni = (P-Pin)/Dtotal;
    Npaso = Dtotal/deltaLmax;
    N = floor(Npaso);
    Ppath = zeros([N 3]);
    for i=1:N
        Ppath(i,:) = Pin + i*deltaLmax*Puni;
    end
    for i=1:N
        MovJ(port_num,PROTOCOL_VERSION,Ppath(i,:),Theta,speed);
        pause(deltat);
    end
end