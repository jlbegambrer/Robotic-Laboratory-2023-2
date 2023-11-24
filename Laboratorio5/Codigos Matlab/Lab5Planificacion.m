%% Planificación
%
%% Se envia a HOME
Home(port_num,PROTOCOL_VERSION,100);

%% Se abre y se cierra el gripper
%Abierto = 820
Gripper(port_num,PROTOCOL_VERSION,2,820,500)
%Cerrado = <512
Gripper(port_num,PROTOCOL_VERSION,2,510,500)

%% Se ubica en el limite a cierta altura
P = [18 0 20];
Theta = 0;
speed = 100;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Se baja el robot
P = [18 0 15];
Theta = 0;
speed = 100;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Se aproxima al tablero
P = [18 0 11];
Theta = 0;
speed = 100;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Dibuja el arco inicial
pos1B = Angle2Bit(0,0);
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos1B)
pos2B = Angle2Bit(0,30);
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos2B)
pos3B = Angle2Bit(0,-30);
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos3B)
pos1B = Angle2Bit(0,0);
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos1B)

%% Se aleja del tablero
P = [21 0 17];
Theta = 0;
speed = 100;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)
%%
P = [28 0 17];
Theta = 0;
speed = 100;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)
%%
P = [28 -4 12];
Theta = 0;
speed = 150;
Ppath = MovL(port_num,PROTOCOL_VERSION,P,Theta,speed,0.001,0.001);