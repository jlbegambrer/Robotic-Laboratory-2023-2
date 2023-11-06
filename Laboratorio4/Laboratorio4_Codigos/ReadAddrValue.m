function [] = ReadAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,VAL_ADDR)
    
    COMM_SUCCESS                = 0;            % Communication Success result value

    % Read value
    dxl_present_torque = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, VAL_ADDR);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end
    
    fprintf('[ID:%03d]  address:%03d Value:%03d\n', DXL1_ID, VAL_ADDR, dxl_present_torque);
end

