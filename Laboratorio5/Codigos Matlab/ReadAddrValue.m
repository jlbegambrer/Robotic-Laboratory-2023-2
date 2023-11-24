function [Value] = ReadAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,VAL_ADDR,SIZE)
    
    COMM_SUCCESS                = 0;            % Communication Success result value

    % Read value
    if SIZE==2
        dxl_present = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, VAL_ADDR);
    elseif SIZE==1
        dxl_present = read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, VAL_ADDR);
    else
        fprintf('SIZE ERROR');
        return;
    end    
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end
    
    fprintf('[ID:%03d](ADDR:%03d) Value:%03d\n', DXL1_ID, VAL_ADDR, dxl_present);

    Value = dxl_present;
end

