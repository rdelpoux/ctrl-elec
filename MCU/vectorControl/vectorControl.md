# Vector Control Tutorial



## Software Requirements

- Microchip IDE + Compiler

<img src="../../img/vectorControl/mplab-xide.png" style="zoom:10%;" /><img src="../../img/vectorControl/xc-compiler.png" style="zoom:80%;" />

- Matlab + Mplab Device Block for Simulink

<img src="../../img/vectorControl/Matlab_Logo.png" style="zoom:80%;" /><img src="../../img/vectorControl/mplab-deviceblocksforsimulink-whitebackground.png" style="zoom:20%;" />

## Hardware Requirements

The demonstration uses a [dsPIC33CK LVMC](https://www.microchip.com/en-us/development-tool/dm330031) board

<img src="../../img/vectorControl/3182-dm330031.jpg" style="zoom:50%;" />

The example can be used with different motors, including

- [Teknic-2310P motor](https://www.digikey.fr/fr/products/detail/texas-instruments/LVSERVOMTR/5005342)

<img src="../../img/vectorControl/hudson_03.jpg" style="zoom:50%;" />

- [Hurst Long - AC300022 - with encoder](https://fr.farnell.com/en-FR/microchip/ac300022/bldc-motor-3-phase-w-encoder/dp/1688718)

<img src="../../img/vectorControl/Hurst.jpg" style="zoom:100%;" />

## Motor Connections

- Phase Voltage (Both motors)

  <img src="../../img/vectorControl/power.jpg" style="zoom:33%;" />

  | PHA   | PHB  | PHC   |
  | ----- | ---- | ----- |
  | White | Red  | Black |

- Encoder

  - Teknic-2310P

  <img src="../../img/vectorControl/encorderTecknic.jpg" style="zoom:50%;" />

  | +5V  | +3.3V | DGND  | QEA  | QEB    | INDX  |
  | ---- | ----- | ----- | ---- | ------ | ----- |
  | Red  | NC    | Black | Blue | Orange | Brown |

  - Hurst Long - AC300022

  <img src="../../img/vectorControl/encoderHurst.jpg" style="zoom:50%;" />

| +5V  | +3.3V | DGND  | QEA   | QEB  | INDX |
| ---- | ----- | ----- | ----- | ---- | ---- |
| Red  | NC    | Black | White | Blue | NC   |

