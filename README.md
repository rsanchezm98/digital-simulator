# Digital simulator
Digital simulator of continuous systems implemented in MATLAB.

## Description
There are implemented simulator for both single and multiple equations systems. The list of implemented methods is:
* Euler
* Trapezoidal
* Adaptive trapezoidal
* Adams
* Runge Kutta 2 order
* Runge Kutta 4 order
* ode45

## Manual
To use it you must create a new folder with the model, inputs, and outputs and the system will compute the solution for you. You must specify the folder in the simulator_multi.m and the method to solve the equations. There are two additional files to create the one to one comparison between models and to solve the equations with all the methods.

## Some results of the simulator of a two link robot
* High precision ode45:

![high precision ode45](https://github.com/rsanchezm98/digital-simulator/blob/master/digital_simulator/images/errorbajo.png)

* Low precision ode45:

![low precision ode45](https://github.com/rsanchezm98/digital-simulator/blob/master/digital_simulator/images/erroralto.png)

* Euler vs ode45:

![ode45 vs euler](https://github.com/rsanchezm98/digital-simulator/blob/master/digital_simulator/images/compare.png)
