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

%%
[port_num,lib_name,group_num] = ConnectPhantomX(DEVICENAME,BAUDRATE,PROTOCOL_VERSION,ADDR_MX_GOAL_POSITION,LEN_MX_GOAL_POSITION);

%%
EnableTorque(port_num,PROTOCOL_VERSION,DXL1_ID,1)
EnableTorque(port_num,PROTOCOL_VERSION,DXL2_ID,1)
EnableTorque(port_num,PROTOCOL_VERSION,DXL3_ID,1)
EnableTorque(port_num,PROTOCOL_VERSION,DXL4_ID,1)

%%
ChangeTorque(port_num,PROTOCOL_VERSION,DXL1_ID,700)
ChangeTorque(port_num,PROTOCOL_VERSION,DXL2_ID,700)
ChangeTorque(port_num,PROTOCOL_VERSION,DXL3_ID,700)
ChangeTorque(port_num,PROTOCOL_VERSION,DXL4_ID,700)
%%
pos1 = 0;%80;
pos2 = 0;%-35;
pos3 = 0;%55;
pos4 = 0;%-45;

pos1B = Angle2Bit(0,pos1);
pos2B = Angle2Bit(0,pos2);
pos3B = Angle2Bit(-90,pos3);
pos4B = Angle2Bit(0,pos4);

%%
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,12)

%%
Move2Motors(port_num,PROTOCOL_VERSION,group_num,1.5,DXL1_ID,512,DXL2_ID,pos2B)

%%
Move4Motors(port_num,PROTOCOL_VERSION,group_num,1.5,pos1B,pos2B,pos3B,pos4B)

%%
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL4_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,350)

%%
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED)

%%
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,ADDR_MX_GOAL_POSITION,LEN_MX_GOAL_POSITION,512)

%%
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,ADDR_MX_PRESENT_POSITION,LEN_MX_PRESENT_POSITION)
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL2_ID,ADDR_MX_PRESENT_POSITION,LEN_MX_PRESENT_POSITION)
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL3_ID,ADDR_MX_PRESENT_POSITION,LEN_MX_PRESENT_POSITION)
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL4_ID,ADDR_MX_PRESENT_POSITION,LEN_MX_PRESENT_POSITION)
%%
[pos1,pos2,pos3,pos4]=Mov2Pose(port_num,PROTOCOL_VERSION,group_num,2.5,2);

%%
DXL_ID = [1 2 3 4];
dxl_goal_position = [pos1B pos2B pos3B pos4B];
SyncWrite(port_num,PROTOCOL_VERSION,DXL_ID,dxl_goal_position,ADDR_MX_GOAL_POSITION,LEN_MX_GOAL_POSITION)

%%
Home(port_num,PROTOCOL_VERSION,50);

%%
%P = [29 0 12];
P = [23 3 12];
Theta = 0;
speed = 100;
MovJ(port_num,PROTOCOL_VERSION,P,Theta,speed)

%%
P = [25 0 12];
Theta = 0;
speed = 230;
Ppath = MovLLinspace(port_num,PROTOCOL_VERSION,P,Theta,speed,0.01,0.01);
figure
plot3(Ppath(:,1),Ppath(:,2),Ppath(:,3),'Marker','o')
grid on

%%
%P = [25 0 12];
P = [23 -2 12];
Theta = 0;
speed = 150;
Ppath = MovL(port_num,PROTOCOL_VERSION,P,Theta,speed,0.001,0.001);
figure
plot3(Ppath(:,1),Ppath(:,2),Ppath(:,3),'Marker','o')
grid on

%%
R = 4;
cuadrante = 3;
concavo = 0;
Theta = 0;
speed = 100;
Ppath = MovSCxy(port_num,PROTOCOL_VERSION,R,cuadrante,concavo,Theta,speed,0.001,0.01);
figure
plot3(Ppath(:,1),Ppath(:,2),Ppath(:,3),'Marker','o')
grid on
view(30,30)

%%
[q, P, Theta] = ActualPosition(port_num,PROTOCOL_VERSION);

%%
%Abierto = 820
%Cerrado = <512
Gripper(port_num,PROTOCOL_VERSION,2,840,500)

%%
%REGISTRO ERRORES
dec2bin(ReadAddrValue(port_num,PROTOCOL_VERSION,DXL2_ID,17,1))

%%
DisconnectPhantomX(port_num,lib_name)