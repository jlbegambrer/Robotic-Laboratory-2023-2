# Informe del laboratorio Epson:

Integrantes del equipo:
- Carlos Caucalí.
- Jonathan Leonardo Begambre Rodríguez.

# Descripción de la Solución planteada.

Dentro de la solución que se planteó se inició con la realización del código  antes de ir a la empresa Control de Movimiento, esto se observó en la Guía Práctica EPSON RC + 7.0 - Básica, a continuación se presenta el encabezado:

![image](https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/39a003c8-c5b3-40a2-8a29-5fd213bb673e)

Los objetivos de esta práctica se pueden observar en la siguiente imágen:


![image](https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/3780b487-71e8-43c1-b4f0-f46b628454db)


Para realiza el código, previamente se descargó e instaló el software para ejecutar las instrucciones  y programar el robot. 

# Desarrollo de la práctica:
Se abrió  el Software Epson RC + 7.0 se crea  una conexión virtual y se configura el SCARA T6, posteriormente se abre un proyecto y se configura la posición de Home
como se observa a continuación:

![image](https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/8081b5d0-ece0-4beb-b038-113b6fab52fd)

Luego se genera las funciones de paletizado Z, paletizad S y paletizado externo como se muestra a continuación en el código:
# Código implementado en el Software Epson - Spel +: 

## Función principal
En esta función se ejecuta de manera la lógica principal del algoritmo para hacer el paletizado, como puede verse en las primeras líneas de la línea 3 a la 7 se dá inicio al motor del rogot, se dá potencia al sistema y se asigna una aceleración y velocidad del robot de 30 %  y 50 % de la capacidad del robot, respectivamente. Luego se colocan una sería de condicionales para hacer llamado al paletizado base, Z, S y externo, según sea el caso: esto se puede  buscar en el archivo "Main.prg" en la carpeta denominada Códigos CapacitacionT3" de este mismo repositorio, en la sigueinte imágen observamos el apartado de la función principal: 
![image](https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/04c4b3a8-6273-4ca3-9e33-705ac0db0f2b)

## Función Paletizado Base:
A continuación se presenta la Función de base para el movimiento del Robot, en la cual se hace uso de los cimandos Go, Wait, Jump and Move, los cuales ayudan al movimiento en los eje X y Y y haciendo pausas de 0.5 del  timer.

![image](https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/b87f90f0-e6da-43da-a06a-6c87daa4a31c)


## Función Paletizado_Z

En esta función de los comando pallet y jump y por medio de un ciclo for  se salta te pallet a pallet para hacer el  movimiento en zig-zag, como se puede observar a continuación:

![image](https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/61d3838f-68e0-4981-9980-d5903db2be10)

##  Función Paletizado_S
En esta función se realiza el paletizado en S como se puede observar en la sigueinte figura, a diferencia de la anterior función, esta se hace de manera  discrita cada movimiento con el comando pallet:

![image](https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/d057f13d-f179-48ac-a07e-7953cccdab92)

## Función Paletizado_externo:
Esta fucnión se encargaba de realizar el movimiento en lso pallet externos del movimiento general, se puede observar a continuación: 

![image](https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/8cbfae09-9ce7-41d1-9091-0e32d4d47c61)


#  Videos de Simulación:
Una vez que se implementó el código se procedió a realizar un video con la simulación de los movimientos del robot, el cual se puede visualizar en la siguiente multimedia: 

https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/045462ce-be50-4b02-b5ab-c0489dc3d3a0


# Desarrollo de la Visita en la Empresa - Control de Movimiento:
Durante el desarrollo de la visita a la empresa control de Movimiento, se recibió la capacitación y apoyo de un egresado de la Unal que trabaja en dicha empresa, el cual nos enseñó las princiaples características de Robot SCARA - Epson, el cual tiene integrado los driver, microcontroladores en el Robot, lo que lo hace muy compacto y versátil; luego, se pasó a definir el espacio de trabajo del Robot, para evitar accidentes con el robot, es decir se delimitó las posiciones máximas  al cual el robot podrá moverse, esto para evitar que chocara las paredes del edificio.


## Videos de la experimentación a Baja Potencia con el Robot SCARA:

https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/a136f5ed-a9bd-4eb0-9f6a-992a12d68432
  
## Videos de la experimentación a alta Potencia con el Robot SCARA :

https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/70650382/b836c533-6242-40b3-9c35-0834e8424449



  
