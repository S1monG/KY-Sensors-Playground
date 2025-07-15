# KY-Sensors-Playground

This repo contains simple usage examples of some KY-series sensors on an FPGA written in Verilog. KY-series sensors are a collection of generic, low-cost sensor modules. They are usually best used with microcontrollers but I'm driving them with an FPGA instead. 

The FPGA I use is the Sipeed Tang Nano 9K powered by a Gowin chip and a clock frequency of 27MHz. Most of the examples are tailored for this setup. If running on other setups, dont forget to change the constraint file accordingly.