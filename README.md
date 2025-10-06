# ctrl + elec
[<img src="img/logo.png"/>](https://www.ctrl-elec.fr/)

[![View ctrl-elec on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://fr.mathworks.com/matlabcentral/fileexchange/135637-ctrl-elec)

The **ctrl+elec** project focuses on the development of **embedded advanced control strategies for synchronous motors**, ranging from surface-mounted permanent magnet motors to reluctance motors. For more information, visit [www.ctrl-elec.fr](https://www.ctrl-elec.fr/).

---

## Authors

- **Romain DELPOUX** – Associate Professor, INSA de Lyon, Laboratoire Ampère UMR CNRS 5005  
  *(Romain.Delpoux@insa-lyon.fr)*  
- **Lubin KERHUEL** – PhD, Microchip Technology Inc.  
  *(Lubin.Kerhuel@microchip.com)*

---

## Objectives

This repository contains source files (mainly Simulink models) to experiment with embedded motor control examples proposed within the ctrl+elec project.  

Part of the project is dedicated to the **[Motor Control University (MCU)](https://www.ctrl-elec.fr/motor_control_university.html)**, which provides **step-by-step tutorials** for engineers wishing to train or specialize in embedded advanced control of electric motors.  

Additional resources, including tutorials and demonstrations, are available on our **[YouTube page @ctrl_elec](https://www.youtube.com/@ctrl_elec)**:  
[Getting started video](https://youtu.be/fAhIvsgS1aM?si=hjhc9MEHJ1EK3xQb)

------

## 📚 Documentation

The full project documentation is available in the [Wiki](https://github.com/rdelpoux/ctrl-elec/wiki) of this repository. You will find guides, tutorials, and detailed explanations to get started.

### Supported Boards

- [Supported Boards Overview](https://github.com/rdelpoux/ctrl-elec/wiki/01_supportedBoard_SupportedBoards)
  - [MCLV 48V 300W Demo Board](https://github.com/rdelpoux/ctrl-elec/wiki/01_supportedBoard_MCLV_48V_300W_demoBoard)
  - [LVMC Demo Board](https://github.com/rdelpoux/ctrl-elec/wiki/01_supportedBoard_LVMC_demoBoard)
  - [MCLV2 Demo Board](https://github.com/rdelpoux/ctrl-elec/wiki/01_supportedBoard_MCLV2_demoBoard)

### Basic vector control

- [Vector Control Tutorial](https://github.com/rdelpoux/ctrl-elec/wiki/02_basicVectorControl)
- [ctrl+elec Lab Introduction](https://github.com/rdelpoux/ctrl-elec/wiki/02_basicVectorControl_labIntro)
  - [Hardware Specification](https://github.com/rdelpoux/ctrl-elec/wiki/02_basicVectorControl_labHardwareSpecifications)
  - [Block Configuration for Motor Control](https://github.com/rdelpoux/ctrl-elec/wiki/02_basicVectorControl_labBlockConfigurationForMotorControl)
  - [Embedded Motor Control](https://github.com/rdelpoux/ctrl-elec/wiki/02_basicVectorControl_labEmbeddedModel)
  - [Motor Speed Observer Design](https://github.com/rdelpoux/ctrl-elec/wiki/02_basicVectorControl_labObserverDesign)


### Advanced control

- [Vector control with Field Weakening](https://github.com/rdelpoux/ctrl-elec/tree/main/MCU/fieldWeakening) 
- [Regional Pole Placement embedded LMI solver](https://github.com/rdelpoux/ctrl-elec/tree/main/MCU/LMIsolver)
- [Offline real-time high frequency data logging based methodology](https://github.com/rdelpoux/ctrl-elec/tree/main/MCU/dataLogging)

