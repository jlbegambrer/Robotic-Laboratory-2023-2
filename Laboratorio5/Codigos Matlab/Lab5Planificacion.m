%% Planificación
% Ya esta todo conectado y las variables de la Adress Table declaradas

%% Se envia a HOME
Home(port_num,PROTOCOL_VERSION,70);

%% Se aproxima al marcador
P = [9 -22 22];
Theta = 0;
speed = 100;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Baja al marcador
P = [9 -22 12];
Theta = 0;
speed = 20;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Se abre y se cierra el gripper
%Abierto = 820
Gripper(port_num,PROTOCOL_VERSION,2,520,300)
%% Cerrado = <512
Gripper(port_num,PROTOCOL_VERSION, ...
    2,820,300)

%% Se aleja del porta
Pin = P;
P = [9 -22 24];
Theta = 0;

speed = 100;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.01,0.0000001);

%% Se envia a HOME
Home(port_num,PROTOCOL_VERSION,70);

%% Se ubica en el limite inferior a cierta altura
P = [17 0 17];
Theta = 0;
speed = 100;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Se baja el robot
P = [17 0 14];

Theta = 0;
speed = 50;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Se aproxima al tablero
P = [17 0 11];
Theta = 0;
speed = 20;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Dibuja el arco inicial
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,100)
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL2_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,100)
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL3_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,100)
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL4_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,100)
%pause(3)
pos1B = Angle2Bit(0,0);
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos1B)
pause(0.5)
pos2B = Angle2Bit(0,40);
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos2B)
pause(2)
pos3B = Angle2Bit(0,-40);
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos3B)
pause(5)
pos1B = Angle2Bit(0,0);
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos1B)

%% Se aleja del tablero
P = [21 0 17];
Theta = 0;
speed = 50;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Se ubica en el limite superior a cierta altura
Pin = P;
P = [30 0 17];
Theta = 0;
speed = 100;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.01,0.0001)

%% Se baja el robot
P = [30 0 14];
Theta = 0;
speed = 20;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Se aproxima al tablero
P = [30 0 12];
Theta = 0;
speed = 5;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Dibuja el arco final

WriteAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,100)
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL2_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,100)
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL3_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,100)
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL4_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,100)
%pause(3)
pos1B = Angle2Bit(0,0);
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos1B)
pos2B = Angle2Bit(0,30);
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos2B)
pause(4)
pos3B = Angle2Bit(0,-30);
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos3B)
pause(10)
pos1B = Angle2Bit(0,0);
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos1B)

%% Alejo del tablero
P = [23 0 17];
Theta = 0;
speed = 20;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Se envia a HOME
Home(port_num,PROTOCOL_VERSION,70);

%% CJ
%PUNTO INICIAL ALCANZADO

%% Curva 1
Pin = P;
R = 4;
cuadrante = 4;
concavo = 0;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 2
Pin = P;
R = 4;
cuadrante = 3;
concavo = 1;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Linea 1
Pin = P;
P = [P(1)+2 P(2) P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);

%% Curva 3
Pin = P;
R = 2;
cuadrante = 3;
concavo = 1;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 4
Pin = P;
R = 2;
cuadrante = 2;
concavo = 0;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Linea 2
Pin = P;
P = [P(1)+6 P(2) P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);

%% VY
%PUNTO INICIAL ALCANZADO

%% Linea 1
Pin = P;
P = [P(1)-6 P(2)-2 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 2
Pin = P;
P = [P(1)+6 P(2)-2 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 3
Pin = P;
P = [P(1)-4 P(2)-2 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 4
Pin = P;
P = [P(1)+4 P(2)-2 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 5
Pin = P;
P = [P(1)-4 P(2)+2 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 6
Pin = P;
P = [P(1)-2 P(2) P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);

%% JML
%PUNTO INICIAL ALCANZADO
%% Curva 1
Pin = P;
R = 2;
cuadrante = 3;
concavo = 1;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 2
Pin = P;
R = 2;
cuadrante = 2;
concavo = 0;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Linea 1
Pin = P;
P = [P(1)+4 P(2) P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 2
Pin = P;
P = [P(1)-2 P(2)-2 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 3
Pin = P;
P = [P(1)+2 P(2)-2 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 4
Pin = P;
P = [P(1)-6 P(2) P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 5
Pin = P;
P = [P(1) P(2)-4 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);

%% <3
%PUNTO INICIAL ALCANZADO
%% Curva 1
Pin = P;
R = 3;
cuadrante = 2;
concavo = 1;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 2
Pin = P;
R = 3;
cuadrante = 3;
concavo = 0;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 3
Pin = P;
R = 3;
cuadrante = 2;
concavo = 1;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 4
Pin = P;
R = 3;
cuadrante = 3;
concavo = 0;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Linea 1
Pin = P;
P = [P(1)-4 P(2)+6 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 2
Pin = P;
P = [P(1)+4 P(2)+6 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);

%% -oo-
%PUNTO INICIAL ALCANZADO
%% Linea 1
Pin = P;
P = [P(1) P(2)-3 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Curva 1
Pin = P;
R = 3;
cuadrante = 2;
concavo = 1;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 2
Pin = P;
R = 3;
cuadrante = 3;
concavo = 0;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 3
Pin = P;
R = 3;
cuadrante = 2;
concavo = 1;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 4
Pin = P;
R = 3;
cuadrante = 3;
concavo = 0;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Linea 2
Pin = P;
P = [P(1) P(2)-3 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 1
Pin = P;
P = [P(1) P(2)+3 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Curva 5
Pin = P;
R = 3;
cuadrante = 4;
concavo = 1;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 6
Pin = P;
R = 3;
cuadrante = 1;
concavo = 0;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 7
Pin = P;
R = 3;
cuadrante = 4;
concavo = 1;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 8
Pin = P;
R = 3;
cuadrante = 1;
concavo = 0;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)

%% Hojita
%PUNTO INICIAL ALCANZADO
%% Linea 1
Pin = P;
P = [P(1)-2 P(2)+2 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 2
Pin = P;
P = [P(1)-2 P(2)-2 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 3
Pin = P;
P = [P(1)+2 P(2)-2 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 4
Pin = P;
P = [P(1)+2 P(2)+2 P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Linea 5
Pin = P;
P = [P(1)+2 P(2) P(3)];
Theta = 0;
speed = 50;
MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
%% Curva 1
Pin = P;
R = 4;
cuadrante = 1;
concavo = 1;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 2
Pin = P;
R = 4;
cuadrante = 3;
concavo = 1;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 3
Pin = P;
R = 4;
cuadrante = 2;
concavo = 0;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)
%% Curva 4
Pin = P;
R = 4;
cuadrante = 4;
concavo = 0;
Theta = 0;
speed = 50;
[P,~] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
disp(P)