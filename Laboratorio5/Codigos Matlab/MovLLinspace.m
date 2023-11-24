function [Ppath] = MovLLinspace(port_num,PROTOCOL_VERSION,P,Theta,speed,deltaLmax,deltat)
    %MOVL Summary of this function goes here
    %   Detailed explanation goes here
    [~,Pin,~] =ActualPosition(port_num,PROTOCOL_VERSION);
    N = floor(max(P - Pin)/deltaLmax)+1;
    Ppath =[linspace(Pin(1),P(1),N)',linspace(Pin(2),P(2),N)',linspace(Pin(3),P(3),N)'];
    for i=1:N
        MovJ(port_num,PROTOCOL_VERSION,Ppath(i,:),Theta,speed);
        pause(deltat);
    end
end