MODULE LAB2RS
    PERS tooldata MarcadorTCP:=[TRUE,[[65.542,0,135.848],[0.974839064,0,0.222909847,0]],[1,[0,0,1],[1,0,0,0],0,0,0]];
    PERS wobjdata Base_Plana:=[FALSE,TRUE,"",[[0,0,150],[1,0,0,0]],[[853.175,-150,20],[0,0,1,0]]];
    CONST jointtarget JTHOME:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_10:=[[125,272.5,-20],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[125,272.5,0],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[175,272.5,0],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_40:=[[175,272.5,-20],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_50:=[[125,222.5,-20],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_60:=[[125,222.5,0],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_70:=[[175,222.5,0],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_80:=[[175,222.5,-20],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_90:=[[125,182.5,-20],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_100:=[[125,182.5,0],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_110:=[[150,207.5,0],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_120:=[[175,182.5,0],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_130:=[[150,157.5,0],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_140:=[[125,182.5,0],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_150:=[[125,182.5,-20],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_160:=[[125,142.5,-20],[1,0,0,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_170:=[[125,142.5,0],[1,0,0,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_180:=[[175,142.5,0],[1,0,0,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_190:=[[175,92.5,0],[1,0,0,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_200:=[[175,92.5,-20],[1,0,0,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_210:=[[175,77.5,-20],[1,0,0,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_220:=[[175,77.5,0],[1,0,0,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_230:=[[125,52.5,0],[1,0,0,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_240:=[[175,27.5,0],[1,0,0,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_250:=[[175,27.5,-20],[1,0,0,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_260:=[[150,272.5,-20],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_270:=[[150,272.5,0],[1,0,0,0],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_280:=[[150,27.5,0],[1,0,0,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_290:=[[150,27.5,-20],[1,0,0,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget JTMant:=[[0,90,-90,0,-45,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PROC main()
        WHILE TRUE DO
            !Encender salida Activo
            Set DO_03;
            !Verificar BTN_1, Trayectoria
            IF DI_01=1 HOLA;
            !Verificar BTN_2, Mantenimiento
            IF DI_02=1 Mantenimiento;
            !FIN
        ENDWHILE
    ENDPROC
    !Trayectoria
    PROC HOLA()
        TPWrite "Trayectoria";
        Set DO_02 ;
        MoveAbsJ JTHOME,v300,z1,MarcadorTCP\WObj:=Base_Plana;
        MoveJ Target_10,v200,z10,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_20,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_30,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_40,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveJ Target_50,v200,z10,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_60,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_70,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_80,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveJ Target_90,v200,z10,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_100,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveC Target_110,Target_120,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveC Target_130,Target_140,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_150,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveJ Target_160,v200,z10,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_170,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_180,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_190,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_200,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveJ Target_210,v200,z10,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_220,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_230,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_240,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_250,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveJ Target_260,v200,z10,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_270,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_280,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        MoveL Target_290,v100,z5,MarcadorTCP\WObj:=Base_Plana;
        TPWrite "Retorno a HOME";
        MoveAbsJ JTHOME,v300,z1,MarcadorTCP\WObj:=Base_Plana;
        Reset DO_02;
    ENDPROC
    PROC Mantenimiento()
        TPWrite "Mantenimiento";
        MoveAbsJ JTMant,v300,z1,MarcadorTCP\WObj:=Base_Plana;
        Reset DO_03;
        !Mantiene posición hasta retomar trayectoria
        WaitDI DI_01, 1;
        TPWrite "Retornando a HOME...";
        WaitTime 2;
        MoveAbsJ JTHOME,v300,z1,MarcadorTCP\WObj:=Base_Plana;
    ENDPROC
ENDMODULE