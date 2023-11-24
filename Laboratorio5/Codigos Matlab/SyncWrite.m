function [] = SyncWrite(port_num,PROTOCOL_VERSION,DXL_ID,dxl_goal_value,ADDR_MX_VALUE,DXL_LEN)
    
    COMM_SUCCESS                = 0;            % Communication Success result value
    
    fprintf('SyncWrite\n')

    % Initialize Groupsyncwrite instance
    group_num = groupSyncWrite(port_num, PROTOCOL_VERSION, ADDR_MX_VALUE, DXL_LEN);
    
    
    % Add Dynamixel#n goal value to the Syncwrite storage
    dxl_addparam_result = groupSyncWriteAddParam(group_num, DXL_ID(1), dxl_goal_value(1), DXL_LEN);
    if dxl_addparam_result ~= true
        fprintf('[ID:%03d] groupSyncWrite addparam failed', DXL_ID(1));
        return;
    end

    % Add Dynamixel#n goal value to the Syncwrite storage
    dxl_addparam_result = groupSyncWriteAddParam(group_num, DXL_ID(2), dxl_goal_value(2), DXL_LEN);
    if dxl_addparam_result ~= true
        fprintf('[ID:%03d] groupSyncWrite addparam failed', DXL_ID(2));
        return;
    end

    % Add Dynamixel#n goal value to the Syncwrite storage
    dxl_addparam_result = groupSyncWriteAddParam(group_num, DXL_ID(3), dxl_goal_value(3), DXL_LEN);
    if dxl_addparam_result ~= true
        fprintf('[ID:%03d] groupSyncWrite addparam failed', DXL_ID(3));
        return;
    end

    % Add Dynamixel#n goal value to the Syncwrite storage
    dxl_addparam_result = groupSyncWriteAddParam(group_num, DXL_ID(4), dxl_goal_value(4), DXL_LEN);
    if dxl_addparam_result ~= true
        fprintf('[ID:%03d] groupSyncWrite addparam failed', DXL_ID(4));
        return;
    end
    

    % Syncwrite goal value
    groupSyncWriteTxPacket(group_num);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    else
        fprintf('[ID:%03d](ADDR:%03d) Dynamixel Value has change: %03d\n',DXL_ID(1),ADDR_MX_VALUE,dxl_goal_value(1));
        fprintf('[ID:%03d](ADDR:%03d) Dynamixel Value has change: %03d\n',DXL_ID(2),ADDR_MX_VALUE,dxl_goal_value(2));
        fprintf('[ID:%03d](ADDR:%03d) Dynamixel Value has change: %03d\n',DXL_ID(3),ADDR_MX_VALUE,dxl_goal_value(3));
        fprintf('[ID:%03d](ADDR:%03d) Dynamixel Value has change: %03d\n',DXL_ID(4),ADDR_MX_VALUE,dxl_goal_value(4));        
    end
    
    % Clear syncwrite parameter storage
    groupSyncWriteClearParam(group_num);
    
end

