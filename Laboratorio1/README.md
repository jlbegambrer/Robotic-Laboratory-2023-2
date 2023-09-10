# Laboratorio 1 - Robótica Industrial
En este carpeta se encuentra los archivos sosportes del laboratorio 1 de la asignatura Robótica en el pregrado de Ingeniería mecatrónica en la Universidad Nacional de Colombia
## Diseño de la Herramienta



## Solución Planteada

## Programación de la trayectoria
Una vez definida la herramienta (con su respectivo marco de referencia) se uso el modelo "Tableros" como base para definir la trayectoria que se seguira, tomando como base los tableros inclinados presentes en el laboratorio. Se creo un Work Object en la esquina superior del objeto, de tal manera que el plano xy comprende toda la cara donde estan las letras y el eje z positivo entra al tablero.
![image](https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/72324507/fbd731e3-8634-463a-ae55-d11840091d9c)
Para programar la trayectoria se crearon una serie de puntos en todos los vertices de las letras y de la decoración, para las curvas se incluyó también el punto medio. Los puntos siguen una secuencia logica e incluyen la aproximación, alejamiento y desplazamiento a cada objeto. Con los puntos se creo una trayectoria en donde se tuvieron en cuenta los requisitos de presición y velocidad. Para desplazarse entre letras se usó la instrucción MoveJ, para las lineas se uso la instruccción MoveL y para las curvas se usaron los desplazamientos de inicio-medio y medio-fin de las curvas para formar una instrucción MoveC.
![image](https://github.com/jlbegambrer/Robotic-Laboratory-2023-2/assets/72324507/2e6930e8-2870-413f-b0a1-a0f0a04bc7f8)
Posteriormente se movio el robot a lo largo de la trayectoria para corregir errores de singularidad, alcance y orientación de la herramienta. Una vez todo estuvo correcto se sincronizo la trayectoria en RAPID, incluyendo las instancias de la herramienta y el objeto de trabajo.
