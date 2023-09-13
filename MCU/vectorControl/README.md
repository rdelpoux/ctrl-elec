![](../../img/logo.png)

# MATLAB dsPIC33CK LVMC board - FOC Tutorial

## 1. Introduction

This document describes the setup requirement for running the optimize Vector Control, including voltage and current saturations and space vector modulation. The example can be used with different motors. In this example, we show the behavior with 2 different motors. 

## 2. SUGGESTED DEMONSTRATION REQUIREMENTS

### 2.1 MATLAB Model Required for the Demonstration

- MATLAB model can be cloned or downloaded as zip file from the Github repository ([link](https://github.com/rdelpoux/ctrl-elec/tree/main/MCU/vectorControl)).

### 2.2 Software Tools Used for Testing the MATLAB/Simulink Model

- [MPLAB X IDE and IPE (v6.00)](https://www.microchip.com/en-us/tools-resources/develop/mplab-x-ide) and [XC16 compiler (v2.00)](https://www.microchip.com/en-us/tools-resources/develop/mplab-xc-compilers)

[<img src="../../img/vectorControl/mplab-xide.png" />](https://www.microchip.com/en-us/tools-resources/develop/mplab-x-ide) [<img src="../../img/vectorControl/xc-compiler.png"/>](https://www.microchip.com/en-us/tools-resources/develop/mplab-xc-compilers)



- [Matlab R2023a](https://fr.mathworks.com/) and [Mplab Device Block for Simulink (v3.50.34b)](https://fr.mathworks.com/matlabcentral/fileexchange/71892-mplab-device-blocks-for-simulink-dspic-pic32-and-sam-mcu)

[<img src="../../img/vectorControl/Matlab_Logo.png"/>](https://fr.mathworks.com/)[<img src="../../img/vectorControl/mplab-deviceblocksforsimulink-whitebackground.png"/>](https://fr.mathworks.com/matlabcentral/fileexchange/71892-mplab-device-blocks-for-simulink-dspic-pic32-and-sam-mcu)

- Required MATLAB add-on packages
  - Simulink (v10.7)
  - Simulink Coder (v9.8)
  - MATLAB Coder (v5.5)
  - Embedded Coder (v7.9)
  - Fixed-Point Designer (v7.6)

> **_NOTE:_**
> The software used for testing the model during release is listed above. It is recommended to use the version listed above or later versions for building the model.

### 2.3 Hardware Requirements

The demonstration uses a [dsPIC33CK LVMC](https://www.microchip.com/en-us/development-tool/dm330031) board

<img src="../../img/vectorControl/3182-dm330031.jpg" />

The example can be used with different motors, including

- [Teknic-2310P motor](https://www.digikey.fr/fr/products/detail/texas-instruments/LVSERVOMTR/5005342)

<img src="../../img/vectorControl/hudson_03.jpg" />

- [Hurst Long - AC300022 - with encoder](https://fr.farnell.com/en-FR/microchip/ac300022/bldc-motor-3-phase-w-encoder/dp/1688718)

<img src="../../img/vectorControl/Hurst.jpg" />

## 3. Hardware Setup

This section describes hardware setup required for the demonstration.

- Connect the 3-phase wires from the motor to PHA, PHB, and PHC of the J14 connector, provided on the LVMC Board. For both motors:

  <img src="../../img/vectorControl/power.jpg" />

  | PHA   | PHB  | PHC   |
  | ----- | ---- | ----- |
  | White | Red  | Black |

- Connect the encoder wires to +5V, GND, QEA, QEB and QEI of the J8 connector, provided on the from LVMC Board. For both motors:

  - For Teknic-2310P motor:

  <img src="../../img/vectorControl/encorderTecknic.jpg" />

  | +5V  | +3.3V | DGND  | QEA  | QEB    | INDX  |
  | ---- | ----- | ----- | ---- | ------ | ----- |
  | Red  | NC    | Black | Blue | Orange | Brown |

  - For Hurst Long - AC300022

  <img src="../../img/vectorControl/encoderHurst.jpg"/>

| +5V  | +3.3V | DGND  | QEA   | QEB  | INDX |
| ---- | ----- | ----- | ----- | ---- | ---- |
| Red  | NC    | Black | White | Blue | NC   |

- Plug a 24V power supply to **connector J1** on the LVMC Board. Alternatively, the Inverter Board can also be powered through connector J2.
- The board has an onboard programmer **PICkit™ On Board (PKoBv4)** , which can be used for programming or debugging the microcontroller or dsPIC DSC on the Board. To use the onboard programmer, connect a  micro-USB cable between the Host PC and **connector J13** on the LVMC Board.

## 4. BASIC DEMONSTRATION

Follow the below instructions step-by-step, to set up and run the motor control demo application:

## 5. DATA VISUALIZATION USING PICGUI

## 6. REFERENCES:

For more information, refer to the following documents or links.
