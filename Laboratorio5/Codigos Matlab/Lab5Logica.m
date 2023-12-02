%% Initial configurations
clc;clear;

% Protocol version
PROTOCOL_VERSION            = 1.0;          % See which protocol version is used in the Dynamixel

% Default setting
DXL1_ID                     = 1;            % Dynamixel#1 ID: 1
DXL2_ID                     = 2;            % Dynamixel#2 ID: 2
DXL3_ID                     = 3;            % Dynamixel#1 ID: 3
DXL4_ID                     = 4;            % Dynamixel#2 ID: 4
DXL5_ID                     = 5;            % Dynamixel#2 ID: 5

BAUDRATE                    = 1000000;
DEVICENAME                  = 'COM7';       % Check which port is being used on your controller
                                            % ex) Windows: 'COM1'   Linux: '/dev/ttyUSB0' Mac: '/dev/tty.usbserial-*'

% Control table address
ADDR_CW_Angle_Limit         = 06;
ADDR_CCW_Angle_Limit        = 08;
ADDR_MX_TORQUE_ENABLE       = 24;           % Control table address is different in Dynamixel model
ADDR_MX_TORQUE_LIMIT        = 34;
ADDR_CW_Compl_Margin        = 26;
ADDR_CCW_Compl_Margin       = 27;
ADDR_MX_GOAL_POSITION       = 30;
ADDR_MX_PRESENT_POSITION    = 36;
ADDR_MX_MOV_SPEED           = 32;
ADDR_MX_PRESENT_SPEED       = 38;
ADDR_Present_Load           = 40;

LEN_CW_Angle_Limit          = 2;
LEN_CCW_Angle_Limit         = 2;
LEN_MX_TORQUE_ENABLE        = 1;
LEN_MX_TORQUE_LIMIT         = 2;
LEN_CW_Compl_Margin         = 1;
LEN_CCW_Compl_Margin        = 1;
LEN_MX_GOAL_POSITION        = 2;
LEN_MX_PRESENT_POSITION     = 2;
LEN_MX_MOV_SPEED            = 2;
LEN_MX_PRESENT_SPEED        = 2;
LEN_Present_Load            = 2;

%% Conexión al puerto y configuración
[port_num,lib_name,group_num] = ConnectPhantomX(DEVICENAME,BAUDRATE,PROTOCOL_VERSION,ADDR_MX_GOAL_POSITION,LEN_MX_GOAL_POSITION);

%% Se habilita el Torque de cuatro motores
EnableTorque(port_num,PROTOCOL_VERSION,DXL1_ID,1)
EnableTorque(port_num,PROTOCOL_VERSION,DXL2_ID,1)
EnableTorque(port_num,PROTOCOL_VERSION,DXL3_ID,1)
EnableTorque(port_num,PROTOCOL_VERSION,DXL4_ID,1)

%% Se cambia el valor del torque de cuatro motores
ChangeTorque(port_num,PROTOCOL_VERSION,DXL1_ID,700)
ChangeTorque(port_num,PROTOCOL_VERSION,DXL2_ID,700)
ChangeTorque(port_num,PROTOCOL_VERSION,DXL3_ID,700)
ChangeTorque(port_num,PROTOCOL_VERSION,DXL4_ID,700)
%% Se obtiene el valor en bits de cuatro posiciones angulares
pos1 = 0;%80;
pos2 = 0;%-35;
pos3 = 0;%55;
pos4 = 0;%-45;

pos1B = Angle2Bit(0,pos1);
pos2B = Angle2Bit(0,pos2);
pos3B = Angle2Bit(-90,pos3);
pos4B = Angle2Bit(0,pos4);

%% Se mueve un motor a una posición en bits
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,512)

%% Se mueven dos motores a una posición en bits
Move2Motors(port_num,PROTOCOL_VERSION,group_num,1.5,DXL1_ID,512,DXL2_ID,pos2B)

%% Se mueven cuatro motores a una posición en bits
Move4Motors(port_num,PROTOCOL_VERSION,group_num,1.5,pos1B,pos2B,pos3B,pos4B)

%% Se cambia el valor de una dirección en memoria especifica (Moving speed)
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL4_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,350)

%% Se lee el valor de una dirección de memoria especifica (Moving speed)
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED)

%% Se cambia el valor de una dirección en memoria especifica (Goal position)
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,ADDR_MX_GOAL_POSITION,LEN_MX_GOAL_POSITION,512)

%% Se lee el valor de una dirección de memoria especifica (Goal position)
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,ADDR_MX_PRESENT_POSITION,LEN_MX_PRESENT_POSITION)
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL2_ID,ADDR_MX_PRESENT_POSITION,LEN_MX_PRESENT_POSITION)
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL3_ID,ADDR_MX_PRESENT_POSITION,LEN_MX_PRESENT_POSITION)
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL4_ID,ADDR_MX_PRESENT_POSITION,LEN_MX_PRESENT_POSITION)
%% Se mueve el robot a una de las poses del Lab4 y se obtiene el valor real de los ángulos
[pos1,pos2,pos3,pos4]=Mov2Pose(port_num,PROTOCOL_VERSION,group_num,2.5,2);

%% Se escriben simultaneamente cuatro valores en la dirección especifica (goal position)
DXL_ID = [1 2 3 4];
dxl_goal_position = [pos1B pos2B pos3B pos4B];
SyncWrite(port_num,PROTOCOL_VERSION,DXL_ID,dxl_goal_position,ADDR_MX_GOAL_POSITION,LEN_MX_GOAL_POSITION)

%% Se devueleve el robot a la posición de Home a una velocidad especifica
Home(port_num,PROTOCOL_VERSION,50);

%% Se mueve el robot a un punto usando solo los valores finales de la cinematica inversa
P = [23 3 12];
Theta = 0;
speed = 100;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%% Se mueve el robot en linea recta aproximando los puntos en divisiones iguales de x, y y z
Pin = P;
P = [18 0 12];
Theta = 0;
speed = 230;
Ppath = MovLLinspace(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.01,0.01);
% figure
% plot3(Ppath(:,1),Ppath(:,2),Ppath(:,3),'Marker','o')
% grid on
disp(Ppath)

%% Se mueve el robot en linea recta aproximando los puntos en segmentos iguales
Pin = P;
P = [22 7 11.5];
Theta = 0;
speed = 50;
Ppath = MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.005,0.0001);
% figure
% plot3(Ppath(:,1),Ppath(:,2),Ppath(:,3),'Marker','o')
% grid on
disp(Ppath)

%% Se elaboran cuartos de circunferencia en el plano xy según especificaciones
Pin = P;
R = 2;
cuadrante = 2;
concavo = 1;
Theta = 0;
speed = 50;
[P,Ppath] = MovSCxy(port_num,PROTOCOL_VERSION,Pin,R,cuadrante,concavo,Theta,speed,0.005,0.0001);
% figure
% plot3(Ppath(:,1),Ppath(:,2),Ppath(:,3),'Marker','o')
% grid on
% view(30,30)

%% Ciclo para mover el robot linealmente en x, y y z con teclado numerico
while 1
    disp(P)
    in = input('Ingrese la Instrucción: ');
    Pin = P;
    Theta = 0;
    speed = 50;
    switch in
        case 5
            P = [P(1)+1 P(2) P(3)];
            MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.01,0.0001)
        case 2
            P = [P(1)-1 P(2) P(3)];
            MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.01,0.0001)
        case 3
            P = [P(1) P(2)-1 P(3)];
            MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.01,0.0001)
        case 1
            P = [P(1) P(2)+1 P(3)];
            MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.01,0.0001)
        case 9
            speed = 20;
            P = [P(1) P(2) P(3)+0.5];
            MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.01,0.0001)
        case 6
            speed = 20;
            P = [P(1) P(2) P(3)-0.5];
            MovL(port_num,PROTOCOL_VERSION,Pin,P,Theta,speed,0.01,0.0001)
        case 1234
            break
        otherwise
            disp('Instrucción incorrecta')
    end
end

%% Obtención de la posición leyendo motores y usando cinematica directa
[q, P, Theta] = ActualPosition(port_num,PROTOCOL_VERSION);

%% Se abre y se cierra el Gripper a un valor con cierta velocidad
%Abierto = 820
%Cerrado = <512
Gripper(port_num,PROTOCOL_VERSION,2,840,500)

%% Lectura del registro de errores de los motores
%REGISTRO ERRORES
dec2bin(ReadAddrValue(port_num,PROTOCOL_VERSION,DXL2_ID,17,1))

%% Desconexión y liberación del puerto
DisconnectPhantomX(port_num,lib_name)