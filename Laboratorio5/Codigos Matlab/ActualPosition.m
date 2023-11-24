function [q,P,Theta] = ActualPosition(port_num,PROTOCOL_VERSION)
    %ACTUALPOSITION Summary of this function goes here
    %   Detailed explanation goes here
    
    COMM_SUCCESS                = 0;

    DXL1_ID                     = 1;            % Dynamixel#1 ID: 1
    DXL2_ID                     = 2;            % Dynamixel#2 ID: 2
    DXL3_ID                     = 3;            % Dynamixel#1 ID: 3
    DXL4_ID                     = 4;            % Dynamixel#2 ID: 4
    
    ADDR_MX_PRESENT_POSITION    = 36;

    % Parametros iniciales
    L1 = 14.3;
    L2 = 10.6;
    L3 = 10.6;
    L4 = 11.0;
    
    % Read present position1
    dxl_present_position1 = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_PRESENT_POSITION);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end
    
    fprintf('[ID:%03d] PresPos:%03d\n', DXL1_ID, dxl_present_position1);
    
    % Read present position2
    dxl_present_position2 = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_PRESENT_POSITION);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end
    
    fprintf('[ID:%03d] PresPos:%03d\n', DXL2_ID, dxl_present_position2);
    
    % Read present position3
    dxl_present_position3 = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL3_ID, ADDR_MX_PRESENT_POSITION);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end
    
    fprintf('[ID:%03d] PresPos:%03d\n', DXL3_ID, dxl_present_position3);
    
    % Read present position4
    dxl_present_position4 = read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL4_ID, ADDR_MX_PRESENT_POSITION);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end
    
    fprintf('[ID:%03d] PresPos:%03d\n', DXL4_ID, dxl_present_position4);

    q = [0 0 0 0];
    q(1) = Bit2Angle(512,dxl_present_position1);
    q(2) = Bit2Angle(512,dxl_present_position2 - 20);
    q(3) = Bit2Angle(512,dxl_present_position3);
    q(4) = Bit2Angle(512,dxl_present_position4);

    % Verificaciones con cinematica directa
    alpha1 = q(1);
    alpha2 = q(2) + 90;
    alpha3 = q(3);
    alpha4 = q(4);

    w2 = L2*cosd(alpha2);
    z2 = L1 + L2*sind(alpha2);

    w3 = w2 + L3*cosd(alpha2+alpha3);
    z3 = z2 + L3*sind(alpha2+alpha3);
    
    w4 = w3 + L4*cosd(alpha2+alpha3+alpha4);
    x4 = w4*cosd(alpha1);
    y4 = w4*sind(alpha1);
    z4 = z3 + L4*sind(alpha2+alpha3+alpha4);

    P = [x4 y4 z4];
    
    Theta = atan2d(z4-z3,w4-w3);
    q(3) = q(3) + 90;

    fprintf('P = [x=%03d y=%03d z=%03d Theta=%03d]\n',x4,y4,z4,Theta)
    fprintf('q = [q1=%03d q2=%03d q3=%03d q4=%03d]\n',q(1),q(2),q(3),q(4))

end

