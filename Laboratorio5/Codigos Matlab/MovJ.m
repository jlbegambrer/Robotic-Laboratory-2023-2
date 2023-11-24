function [] = MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)
%MOVJ Summary of this function goes here
%   Detailed explanation goes here

    q = CinematicaInversaPhantom(P,Theta);
    q1 = Angle2Bit(0,q(1));
    q2 = Angle2Bit(0,q(2)) + 20;
    q3 = Angle2Bit(0,q(3));
    q4 = Angle2Bit(0,q(4));

    dxl_goal_position = [q1 q2 q3 q4];
    dxl_mov_speed = [speed speed speed speed];
    
    DXL_ID = [1 2 3 4];
    ADDR_MX_GOAL_POSITION       = 30;
    ADDR_MX_MOV_SPEED           = 32;
    LEN_MX_GOAL_POSITION        = 2;
    LEN_MX_MOV_SPEED            = 2;

    if VerificarAlcanzabilidad(P,Theta,q)~=false
        SyncWrite(port_num,PROTOCOL_VERSION,DXL_ID,dxl_mov_speed,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED)
        SyncWrite(port_num,PROTOCOL_VERSION,DXL_ID,dxl_goal_position,ADDR_MX_GOAL_POSITION,LEN_MX_GOAL_POSITION)
    else
        fprintf('Punto no alcanzable :( \n')
    end
end