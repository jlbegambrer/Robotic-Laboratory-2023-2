# Laboratorio 2 - Robótica Industrial
En esta carpeta se encuentra el material para el informe del laboratorio 2 de la asignatura de Robótica del pregrado de ingeniería mecatrónica.
## Descripción de la solución planteada:
Con la experiencia del laboratorio 1, se crearon las rutinas de trabajo, definiendo los puntos de aproximación y el de mantenimiento para cambiar la pieza, con el fin de iniciar y finalizar el trabajo.
Además se crearon 2 entradas digitales y 2 salidas digitales que posteriomente se renombraron según el nombre indicado en el Flexpendant, denominadas DI_01, DI_02 y DO_03, del robot industrial del laboratorio del LABSIR.


Por otro lado, dentro de la solución planteada se crean las trayectorias indeoendientes con los punto de cada letra a dibujar, además la posición de Home y la del mantenimiento para el cambio de la herramienta.

Luego, se define un main  o path en el cual se colocan las trayectorias con una serie instrucciones que se activan con las entradas digitales las cuales dan inicio a la rutina de trabajo y/o el movimiento para el cambio de la herramienta.
Adicionalmente, se define  el set y off para una salida digital con el fin de mantener en alto una salida digital para un LED. Durante el movimiento hacia el  Home y  el mantenimiento se implementaron los comandos de MoveJ y para la rutina de trabajo MoveL a una velocidad.

![image](https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/47c19c53-1003-4273-966b-d9c16a33a786)

Se muestra el segmento de código para el mantenimiento o cambio de la herramienta:
![image](https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/ee5cb00d-11d9-451b-8072-d5c69b2b0abe)

## Simulación en Robot Studio

En el siguiente video se presenta la simulación en el entorno de RobotStudio de los botones de mantenimiento y de inicio de la trayectoria.


https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/b84b1036-1a80-4005-8ea2-48bd233b75ad

Por otro lado, se muestra otra versión de la simulación en la cual se ve el uso de las entradas  y su respectiva respuesta en el Robot, como se ve a continuación:



https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/e05f2beb-0933-41ba-ba42-ae07f76b3beb



## Resultado del laboratorio:
Por medio de los dos videos que se muestra a continuación se expone la implementación en el Robot:

Primero, se muestra la prueba en vacio sin herramienta, en la cual se prueba el funcionamiento de las entradas digitales.


https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/2f096944-9076-4a17-81c9-195d10d110d5

Luego , en el siguiente video se coloca la herramienta, en este se puede se puede observar el uso de las dos entradas digitales, el botón dos para mantenimiento y el botón 1 para el home.


https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/ad3d934e-fd5b-4d13-8e69-27523106e34f




