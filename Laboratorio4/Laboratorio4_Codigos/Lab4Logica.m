%% Initial configurations

clc;clear;

% Protocol version
PROTOCOL_VERSION            = 1.0;          % See which protocol version is used in the Dynamixel

% Default setting
DXL1_ID                     = 1;            % Dynamixel#1 ID: 1
DXL2_ID                     = 2;            % Dynamixel#2 ID: 2
DXL3_ID                     = 3;            % Dynamixel#1 ID: 3
DXL4_ID                     = 4;            % Dynamixel#2 ID: 4

BAUDRATE                    = 1000000;
DEVICENAME                  = 'COM5';       % Check which port is being used on your controller
                                            % ex) Windows: 'COM1'   Linux: '/dev/ttyUSB0' Mac: '/dev/tty.usbserial-*'

% Control table address
ADDR_MX_TORQUE_ENABLE       = 24;           % Control table address is different in Dynamixel model
ADDR_MX_GOAL_POSITION       = 30;
ADDR_MX_PRESENT_POSITION    = 36;
ADDR_MX_PRESENT_TORQUE      = 34;

LEN_MX_GOAL_POSITION        = 2;
%%                                     
[port_num, group_num,lib_name] = ConnectPhantomX(DEVICENAME,BAUDRATE,PROTOCOL_VERSION,ADDR_MX_GOAL_POSITION,LEN_MX_GOAL_POSITION);
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
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL3_ID,ADDR_MX_PRESENT_POSITION)
%%
pos1 = 0;%80;
pos2 = 0;%-35;
pos3 = 0;%55;
pos4 = 0;%-45;

pos1B = Angle2Bit(0,pos1);
pos2B = Angle2Bit(0,pos2);
pos3B = Angle2Bit(90,pos3);
pos4B = Angle2Bit(0,pos4);
%%
Move1Motor(port_num,PROTOCOL_VERSION,1.5,DXL4_ID,512)
%%
Move2Motors(port_num,PROTOCOL_VERSION,group_num,1.5,DXL3_ID,512,DXL4_ID,512)
%%
Move4Motors(port_num,PROTOCOL_VERSION,group_num,1.5,pos1B,pos2B,pos3B,pos4B)
%%
[pos1,pos2,pos3,pos4]=Mov2Pose(port_num,PROTOCOL_VERSION,group_num,2.5,5);
%%
EnableTorque(port_num,PROTOCOL_VERSION,DXL1_ID,0)
EnableTorque(port_num,PROTOCOL_VERSION,DXL2_ID,0)
EnableTorque(port_num,PROTOCOL_VERSION,DXL3_ID,0)
EnableTorque(port_num,PROTOCOL_VERSION,DXL4_ID,0)
%%
DisconnectPhantomX(port_num,lib_name)