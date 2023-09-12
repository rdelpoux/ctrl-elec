# Vector Control Tutorial



## Software Requirements

- Microchip IDE + Compiler

[<img src="../../img/vectorControl/mplab-xide.png" />](https://www.microchip.com/en-us/tools-resources/develop/mplab-x-ide) [<img src="../../img/vectorControl/xc-compiler.png"/>](https://www.microchip.com/en-us/tools-resources/develop/mplab-xc-compilers)



- Matlab + Mplab Device Block for Simulink

[<img src="../../img/vectorControl/Matlab_Logo.png"/>](https://fr.mathworks.com/)[<img src="../../img/vectorControl/mplab-deviceblocksforsimulink-whitebackground.png"/>](https://fr.mathworks.com/matlabcentral/fileexchange/71892-mplab-device-blocks-for-simulink-dspic-pic32-and-sam-mcu)

## Hardware Requirements

The demonstration uses a [dsPIC33CK LVMC](https://www.microchip.com/en-us/development-tool/dm330031) board

<img src="../../img/vectorControl/3182-dm330031.jpg" />

The example can be used with different motors, including

- [Teknic-2310P motor](https://www.digikey.fr/fr/products/detail/texas-instruments/LVSERVOMTR/5005342)

<img src="../../img/vectorControl/hudson_03.jpg" />

- [Hurst Long - AC300022 - with encoder](https://fr.farnell.com/en-FR/microchip/ac300022/bldc-motor-3-phase-w-encoder/dp/1688718)

<img src="../../img/vectorControl/Hurst.jpg" />

## Motor Connections

- Phase Voltage (Both motors)

  <img src="../../img/vectorControl/power.jpg" />

  | PHA   | PHB  | PHC   |
  | ----- | ---- | ----- |
  | White | Red  | Black |

- Encoder

  - Teknic-2310P

  <img src="../../img/vectorControl/encorderTecknic.jpg" />

  | +5V  | +3.3V | DGND  | QEA  | QEB    | INDX  |
  | ---- | ----- | ----- | ---- | ------ | ----- |
  | Red  | NC    | Black | Blue | Orange | Brown |

  - Hurst Long - AC300022

  <img src="../../img/vectorControl/encoderHurst.jpg"/>

| +5V  | +3.3V | DGND  | QEA   | QEB  | INDX |
| ---- | ----- | ----- | ----- | ---- | ---- |
| Red  | NC    | Black | White | Blue | NC   |

