function [pos1A,pos2A,pos3A,pos4A] = Mov2Pose(port_num,PROTOCOL_VERSION,group_num,time,poseNum)
    %MOV2POSE Summary of this function goes here
    %   Detailed explanation goes here
    switch poseNum
        case 2
            pos1B = Angle2Bit(0,25);
            pos2B = Angle2Bit(0,25);
            pos3B = Angle2Bit(90,20);
            pos4B = Angle2Bit(0,-20);
        case 3
            pos1B = Angle2Bit(0,-35);
            pos2B = Angle2Bit(0,35);
            pos3B = Angle2Bit(90,-30);
            pos4B = Angle2Bit(0,30);
        case 4
            pos1B = Angle2Bit(0,85);
            pos2B = Angle2Bit(0,-20);
            pos3B = Angle2Bit(90,35);
            pos4B = Angle2Bit(0,25);
        case 5
            pos1B = Angle2Bit(0,80);
            pos2B = Angle2Bit(0,-35);
            pos3B = Angle2Bit(90,35);
            pos4B = Angle2Bit(0,-45);
        otherwise
            pos1B = Angle2Bit(0,0);
            pos2B = Angle2Bit(0,0);
            pos3B = Angle2Bit(90,0);
            pos4B = Angle2Bit(0,0);
    end
    
    Move4Motors(port_num,PROTOCOL_VERSION,group_num,time,pos1B,pos2B,pos3B,pos4B);

    % Read 4 Motors
    
    fprintf('Posiciones en ángulos: \n')
    
    ADDR_MX_PRESENT_POSITION = 36;
    COMM_SUCCESS = 0;
    DXL1_ID = 1;
    DXL2_ID = 2;
    DXL3_ID = 3;
    DXL4_ID = 4;

    % Read present position1
    dxl_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_PRESENT_POSITION);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end
    
    pos1A = Bit2Angle(512,dxl_present_position);
    fprintf('[ID:%03d] PresPos: %03d °\n', DXL1_ID, pos1A);
    
    % Read present position2
    dxl_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_PRESENT_POSITION);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end
    
    pos2A = Bit2Angle(512,dxl_present_position);
    fprintf('[ID:%03d] PresPos: %03d °\n', DXL2_ID, pos2A);
    
    % Read present position3
    dxl_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL3_ID, ADDR_MX_PRESENT_POSITION);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end
    
    pos3A = Bit2Angle(820,dxl_present_position);
    fprintf('[ID:%03d] PresPos: %03d °\n', DXL3_ID, pos3A);
    
    % Read present position4
    dxl_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL4_ID, ADDR_MX_PRESENT_POSITION);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end
    
    pos4A = Bit2Angle(512,dxl_present_position);
    fprintf('[ID:%03d] PresPos: %03d °\n', DXL4_ID, pos4A);
end

