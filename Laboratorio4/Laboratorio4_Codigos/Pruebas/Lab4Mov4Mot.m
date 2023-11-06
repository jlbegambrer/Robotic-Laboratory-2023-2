clc;
clear all;

lib_name = '';

if strcmp(computer, 'PCWIN')
  lib_name = 'dxl_x86_c';
elseif strcmp(computer, 'PCWIN64')
  lib_name = 'dxl_x64_c';
elseif strcmp(computer, 'GLNX86')
  lib_name = 'libdxl_x86_c';
elseif strcmp(computer, 'GLNXA64')
  lib_name = 'libdxl_x64_c';
elseif strcmp(computer, 'MACI64')
  lib_name = 'libdxl_mac_c';
end

% Load Libraries
if ~libisloaded(lib_name)
    [notfound, warnings] = loadlibrary(lib_name, 'dynamixel_sdk.h', 'addheader', 'port_handler.h', 'addheader', 'packet_handler.h', 'addheader', 'group_sync_write.h');
end

% Control table address
ADDR_MX_TORQUE_ENABLE       = 24;           % Control table address is different in Dynamixel model
ADDR_MX_GOAL_POSITION       = 30;
ADDR_MX_PRESENT_POSITION    = 36;
TORQUE_VAL_ADDR             = 34;

% Data Byte Length
LEN_MX_GOAL_POSITION        = 2;
LEN_MX_PRESENT_POSITION     = 2;

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

TORQUE_ENABLE               = 1;            % Value for enabling the torque
TORQUE_DISABLE              = 0;            % Value for disabling the torque

COMM_SUCCESS                = 0;            % Communication Success result value
COMM_TX_FAIL                = -1001;        % Communication Tx Failed

% Initialize PortHandler Structs
% Set the port path
% Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num = portHandler(DEVICENAME);

% Initialize PacketHandler Structs
packetHandler();

% Open port
if (openPort(port_num))
    fprintf('Succeeded to open the port!\n');
else
    unloadlibrary(lib_name);
    fprintf('Failed to open the port!\n');
    input('Press any key to terminate...\n');
    return;
end

% Set port baudrate
if (setBaudRate(port_num, BAUDRATE))
    fprintf('Succeeded to change the baudrate!\n');
else
    unloadlibrary(lib_name);
    fprintf('Failed to change the baudrate!\n');
    input('Press any key to terminate...\n');
    return;
end

% Initialize Groupsyncwrite instance
group_num = groupSyncWrite(port_num, PROTOCOL_VERSION, ADDR_MX_GOAL_POSITION, LEN_MX_GOAL_POSITION);

%% Enable Dynamixel Torque

% Enable Dynamixel#1 Torque
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
else
    fprintf('Dynamixel M1 has been successfully connected \n');
end

% Enable Dynamixel#2 Torque
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
else
    fprintf('Dynamixel M2 has been successfully connected \n');
end

% Enable Dynamixel#3 Torque
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL3_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
else
    fprintf('Dynamixel M3 has been successfully connected \n');
end

% Enable Dynamixel#4 Torque
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL4_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
else
    fprintf('Dynamixel M4 has been successfully connected \n');
end

%% Change Torque 4 Motors

dxl_torque_value1 = 170;
dxl_torque_value2 = 300;
dxl_torque_value3 = 170;
dxl_torque_value4 = 300;

%Motor 1 write torque value
write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, TORQUE_VAL_ADDR, dxl_torque_value1);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

% Read value
dxl_present_torque = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, TORQUE_VAL_ADDR);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);

if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

fprintf('[ID:%03d]  address:%03d Value:%03d\n', DXL1_ID, TORQUE_VAL_ADDR, dxl_present_torque);

%Motor 2 write torque value
write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, TORQUE_VAL_ADDR, dxl_torque_value2);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

% Read value
dxl_present_torque = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, TORQUE_VAL_ADDR);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);

if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

fprintf('[ID:%03d]  address:%03d Torque Value:%03d\n', DXL2_ID, TORQUE_VAL_ADDR, dxl_present_torque);

%Motor 3 write torque value
write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL3_ID, TORQUE_VAL_ADDR, dxl_torque_value3);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

% Read value
dxl_present_torque = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL3_ID, TORQUE_VAL_ADDR);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);

if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

fprintf('[ID:%03d]  address:%03d Value:%03d\n', DXL3_ID, TORQUE_VAL_ADDR, dxl_present_torque);

%Motor 4 write torque value
write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL3_ID, TORQUE_VAL_ADDR, dxl_torque_value4);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

% Read value
dxl_present_torque = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL4_ID, TORQUE_VAL_ADDR);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);

if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

fprintf('[ID:%03d]  address:%03d Value:%03d\n', DXL4_ID, TORQUE_VAL_ADDR, dxl_present_torque);

%% Move 4 Motors
dxl_goal_position1 = 512;
dxl_goal_position2 = 512;
dxl_goal_position3 = 512;
dxl_goal_position4 = 512;

% Add Dynamixel#1 goal position value to the Syncwrite storage
dxl_addparam_result = groupSyncWriteAddParam(group_num, DXL1_ID, dxl_goal_position1, LEN_MX_GOAL_POSITION);
if dxl_addparam_result ~= true
    fprintf('[ID:%03d] groupSyncWrite addparam failed', DXL1_ID);
    return;
end

% Add Dynamixel#2 goal position value to the Syncwrite parameter storage
dxl_addparam_result = groupSyncWriteAddParam(group_num, DXL2_ID, dxl_goal_position2, LEN_MX_GOAL_POSITION);
if dxl_addparam_result ~= true
    fprintf('[ID:%03d] groupSyncWrite addparam failed', DXL2_ID);
    return;
end

% Add Dynamixel#3 goal position value to the Syncwrite parameter storage
dxl_addparam_result = groupSyncWriteAddParam(group_num, DXL3_ID, dxl_goal_position3, LEN_MX_GOAL_POSITION);
if dxl_addparam_result ~= true
    fprintf('[ID:%03d] groupSyncWrite addparam failed', DXL3_ID);
    return;
end

% Add Dynamixel#4 goal position value to the Syncwrite parameter storage
dxl_addparam_result = groupSyncWriteAddParam(group_num, DXL4_ID, dxl_goal_position4, LEN_MX_GOAL_POSITION);
if dxl_addparam_result ~= true
    fprintf('[ID:%03d] groupSyncWrite addparam failed', DXL4_ID);
    return;
end

% Syncwrite goal position
groupSyncWriteTxPacket(group_num);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
end

% Clear syncwrite parameter storage
groupSyncWriteClearParam(group_num);

pause(2)

% Read 4 Motors

% Read present position1
dxl_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_PRESENT_POSITION);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

fprintf('[ID:%03d] PresPos:%03d\n', DXL1_ID, dxl_present_position);

% Read present position2
dxl_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_PRESENT_POSITION);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

fprintf('[ID:%03d] PresPos:%03d\n', DXL2_ID, dxl_present_position);

% Read present position3
dxl_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL3_ID, ADDR_MX_PRESENT_POSITION);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

fprintf('[ID:%03d] PresPos:%03d\n', DXL3_ID, dxl_present_position);

% Read present position4
dxl_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL4_ID, ADDR_MX_PRESENT_POSITION);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

fprintf('[ID:%03d] PresPos:%03d\n', DXL4_ID, dxl_present_position);

%% Desconexión

% Disable Dynamixel#1 Torque
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

% Disable Dynamixel#2 Torque
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

% Close port
closePort(port_num);

% Unload Library
unloadlibrary(lib_name);

close all;
clear all;