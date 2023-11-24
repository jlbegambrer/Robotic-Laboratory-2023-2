function [] = Gripper(port_num,PROTOCOL_VERSION,time,dxl_goal_position,speed)
    %MOVE1MOTOR Summary of this function goes here
    %   Detailed explanation goes here
    
    fprintf('Moving Gripper')

    ADDR_MX_PRESENT_POSITION    = 36;
    ADDR_MX_MOV_SPEED           = 32;
    ADDR_MX_GOAL_POSITION       = 30;
    LEN_MX_MOV_SPEED            = 2;
    COMM_SUCCESS                = 0;            % Communication Success result value
    DXL_ID = 5;
    
    %Write mov speed
    WriteAddrValue(port_num,PROTOCOL_VERSION,5,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,speed)

    % Write goal position Modify dxl_goal_position
    write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end
    
    fprintf('Moving 1 motors \n');
    pause(time)
    
    % Read Motor
    
    % Read present position1
    dxl_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_PRESENT_POSITION);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end
    
    fprintf('[ID:%03d] GripperPos:%03d\n', DXL_ID, dxl_present_position);

end

