# Informe  laboratorio 3 - Robótica de Desarrollo, Intro a ROS:
- Carlos Caucalí Chaparro
- Jonathan Leonardo Begambre Rodríguez

## Metodología:
Dentro de la metodologia seguida se encontró un repositorio (https://github.com/fegonzalez7/rob_unal_clase2). El cual ste permitió configurar e instalar el programa de manera correcta en los computadores.

En una primera terminal se corre el comando “roscore” lo cual nos permite inicializar ROS y se le dice al sistema que una instancia de ROS se va a estar ejecutando. En la segunda terminal se le indica a esa instancia de ROS que se va a correr el programa de “turtlesim”, específicamente, un nodo que muestra mediante una interfaz gráfica la ubicación de una tortuga y que permanentemente esta enviando su ubicación y orientación; de por si hasta este punto no es posible interactuar con la tortuga. En la tercera terminal se ejecuta un nodo el cual es capaz de justamente esto, “turtle_teleop_key” permite registrar entradas de teclado para enviarle instrucciones de movimiento a la tortuga que se pueden ver mediante la interfaz gráfica. 

Ya que la finalidad del laboratorio es realizar comunicaciones desde distintos programas (Python y Matlab) en este primer paso estas instrucciones son enviadas desde consola. Con todos los nodos, para este caso en particular activos, se envía una instrucción desde consola, enviando directamente un mensaje con instrucciones de movimiento para que la tortuga siga una trayectoria deseada. En la imagen siguiente se pueden visualizar las cuatro consolas de Linux abiertas y la interfaz gráfica con el movimiento de la tortuga indicado ya ejecutado junto con el código utilizado e instrucciones. 


## Matlab: 
Para operar Turtlesim mediante Matlab, fue necesario instalar el toolbox de Robotica de Mathworks.

Se probó el script de la guía de laboratorio:

---
```matlab
%%
rosinit; %Conexión con nodo maestro
%%
velPub = rospublisher(’/turtle1/cmd_vel’,’geometry_msgs/Twist’); %Creación publicador
velMsg = rosmessage(velPub); %Creación de mensaje
%%
velMsg.Linear.X = 1; %Valor del mensaje
send(velPub,velMsg); %Envio
pause(1)
```
---
En este se inicia la conexión con el maestro, se crea un publisher
y se envian mensajes con la velocidad para modificar la posición
en la dirección x.

---
Ahora se crea un script para cubrir los otros puntos propuestos por la guía:

---
```matlab
clear
clc
%%
rosinit; %Conexi ́on con nodo maestro
%%
velPub = rospublisher('/turtle1/cmd_vel','geometry_msgs/Twist'); %Creaci ́on publicador
velMsg = rosmessage(velPub); %Creaci ́on de mensaje
sub = rossubscriber('/turtle1/pose','turtlesim/Pose')
msg_twist = rosmessage('geometry_msgs/Twist');

%%
msg_twist.Linear.X = 5;   % Nueva posición X
msg_twist.Linear.Y = -2;   % Nueva posición Y
msg_twist.Linear.Z = 0.0;   % Nueva posición Z
msg_twist.Angular.X = 0.0;  % Nueva orientación X
msg_twist.Angular.Y = 0.0;  % Nueva orientación Y
msg_twist.Angular.Z = pi; % Nueva orientación Z (en radianes)
send(velPub,msg_twist); %Envio
pause(1)
H=sub.LatestMessage
%%
rosshutdown;

```
-------------------------------------------------------------------
con el siguiente comando se creo el suscriber
```matlab
sub = rossubscriber('/turtle1/pose','turtlesim/Pose') 
```
 y en H se almacena el ultimo mensaje obtenido.
 
 Para modificar la pose de la tortuga se usa el mensaje creado en
 msg_twist, en este se puede modificar la posición y orientación
 para despues ser enviado.

--------------------------------------------------------------
 
## Metodología:
sd
##  Pruebas:

sds

## Conclusiones:
sdsd

