function [Ppath] = MovSCxy(port_num,PROTOCOL_VERSION,R,cuadrante,concavo,Theta,speed,Lmax,deltat)
    %MOVCXY Summary of this function goes here
    %   Detailed explanation goes here
    [~,Pac,~] =ActualPosition(port_num,PROTOCOL_VERSION);
    xin = Pac(1);
    yin = Pac(2);
    zin = Pac(3);
    if concavo == 1
        if cuadrante == 1 || cuadrante == 4
            xr = xin;
            yr = yin + R;
            N = floor(R/Lmax);
            if cuadrante == 1
                x = linspace(xin,xin + R,N)';
            elseif cuadrante == 4
                x = linspace(xin,xin - R,N)';
            end
            y = yr - sqrt(R+x-xr).*sqrt(R-x+xr);
            Ppath = [x y ones([N 1]).*zin];
            for i=1:N
                MovJ(port_num,PROTOCOL_VERSION,Ppath(i,:),Theta,speed);
                pause(deltat);
            end
        elseif cuadrante ==2 || cuadrante == 3
            xr = xin;
            yr = yin - R;
            N = floor(R/Lmax);
            if cuadrante == 2
                x = linspace(xin,xin + R,N)';
            elseif cuadrante == 3
                x = linspace(xin,xin - R,N)';
            end
            y = yr + sqrt(R+x-xr).*sqrt(R-x+xr);
            Ppath = [x y ones([N 1]).*zin];
            for i=1:N
                MovJ(port_num,PROTOCOL_VERSION,Ppath(i,:),Theta,speed);
                pause(deltat);
            end
        end
    else
        if cuadrante == 1 || cuadrante == 2
            xr = xin + R;
            yr = yin;
            N = floor(R/Lmax);
            x = linspace(xin,xr,N)';
            if cuadrante == 1
                y = yr + sqrt(R+x-xr).*sqrt(R-x+xr);
            elseif cuadrante == 2
                y = yr - sqrt(R+x-xr).*sqrt(R-x+xr);
            end
            Ppath = [x y ones([N 1]).*zin];
            for i=1:N
                MovJ(port_num,PROTOCOL_VERSION,Ppath(i,:),Theta,speed);
                pause(deltat);
            end
        elseif cuadrante ==3 || cuadrante == 4
            xr = xin - R;
            yr = yin;
            N = floor(R/Lmax);
            x = linspace(xin,xr,N)';
            if cuadrante == 4
                y = yr + sqrt(R+x-xr).*sqrt(R-x+xr);
            elseif cuadrante == 3
                y = yr - sqrt(R+x-xr).*sqrt(R-x+xr);
            end
            Ppath = [x y ones([N 1]).*zin];
            for i=1:N
                MovJ(port_num,PROTOCOL_VERSION,Ppath(i,:),Theta,speed);
                pause(deltat);
            end
        end
    end
end