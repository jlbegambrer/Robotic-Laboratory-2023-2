function [] = Move2Motors(port_num,PROTOCOL_VERSION,group_num,time,DXL1_ID,dxl_goal_position1,DXL2_ID,dxl_goal_position2)
    % Move 2 Motors
    
    LEN_MX_GOAL_POSITION        = 2;
    ADDR_MX_PRESENT_POSITION    = 36;
    COMM_SUCCESS                = 0;            % Communication Success result value
    
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
    
    % Syncwrite goal position
    groupSyncWriteTxPacket(group_num);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    end
    
    % Clear syncwrite parameter storage
    groupSyncWriteClearParam(group_num);
    
    fprintf('Moving 2 motors \n');
    pause(time)
    
    % Read 2 Motors
    
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
    
end

