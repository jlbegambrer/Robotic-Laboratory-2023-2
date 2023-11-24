function [] = WriteAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,VAL_ADDR,SIZE,VALUE)
    %WriteAddrValue Summary of this function goes here
    %   Detailed explanation goes here
    
    COMM_SUCCESS                = 0;            % Communication Success result value
    
    
    % Change Dynamixel Value
    if SIZE==2
        write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, VAL_ADDR, VALUE);
    elseif SIZE==1
        write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, VAL_ADDR, VALUE);
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
    else
        fprintf('[ID:%03d](ADDR:%03d) Dynamixel Value has change: %03d\n',DXL1_ID,VAL_ADDR,VALUE);
    end
end

