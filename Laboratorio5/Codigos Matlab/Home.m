function [] = Home(port_num,PROTOCOL_VERSION,speed)
    %HOME Summary of this function goes here
    %   Detailed explanation goes here
    
    fprintf('HOME\n')
    %Enable Torque
    EnableTorque(port_num,PROTOCOL_VERSION,1,1)
    EnableTorque(port_num,PROTOCOL_VERSION,2,1)
    EnableTorque(port_num,PROTOCOL_VERSION,3,1)
    EnableTorque(port_num,PROTOCOL_VERSION,4,1)
    
    %Max Torque
    ChangeTorque(port_num,PROTOCOL_VERSION,1,1023)
    ChangeTorque(port_num,PROTOCOL_VERSION,2,1023)
    ChangeTorque(port_num,PROTOCOL_VERSION,3,1023)
    ChangeTorque(port_num,PROTOCOL_VERSION,4,1023)

    pos1B = Angle2Bit(0,0);
    pos2B = Angle2Bit(0,0) + 20;
    pos3B = Angle2Bit(-90,0);
    pos4B = Angle2Bit(0,0);
    
    dxl_goal_position = [pos1B pos2B pos3B pos4B];
    dxl_mov_speed = [speed speed speed speed];
    
    DXL_ID = [1 2 3 4];
    ADDR_MX_GOAL_POSITION       = 30;
    ADDR_MX_MOV_SPEED           = 32;

    LEN_MX_GOAL_POSITION        = 2;
    LEN_MX_MOV_SPEED            = 2;

    SyncWrite(port_num,PROTOCOL_VERSION,DXL_ID,dxl_mov_speed,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED)
    SyncWrite(port_num,PROTOCOL_VERSION,DXL_ID,dxl_goal_position,ADDR_MX_GOAL_POSITION,LEN_MX_GOAL_POSITION)

end