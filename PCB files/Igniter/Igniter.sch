EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Igniter-cache
EELAYER 25 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Conn_01x02 J4
U 1 1 5AB41D24
P 8100 4700
F 0 "J4" H 8100 4800 50  0000 C CNN
F 1 "Battery" H 8100 4500 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Altech_AK300-2_P5.00mm" H 8100 4700 50  0001 C CNN
F 3 "" H 8100 4700 50  0001 C CNN
	1    8100 4700
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5AB41E9B
P 6050 5050
F 0 "R2" V 6130 5050 50  0000 C CNN
F 1 "10k" V 6050 5050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5980 5050 50  0001 C CNN
F 3 "" H 6050 5050 50  0001 C CNN
	1    6050 5050
	0    1    1    0   
$EndComp
$Comp
L Conn_01x02 J3
U 1 1 5AB422D7
P 7450 4700
F 0 "J3" H 7450 4800 50  0000 C CNN
F 1 "Ignition Coil" H 7450 4500 50  0000 C CNN
F 2 "" H 7450 4700 50  0001 C CNN
F 3 "" H 7450 4700 50  0001 C CNN
	1    7450 4700
	0    1    1    0   
$EndComp
$Comp
L Conn_01x03_Female J1
U 1 1 5AB42CE4
P 5550 3450
F 0 "J1" H 5550 3650 50  0000 C CNN
F 1 "P_Transducer" H 5550 3250 50  0000 C CNN
F 2 "" H 5550 3450 50  0001 C CNN
F 3 "" H 5550 3450 50  0001 C CNN
	1    5550 3450
	-1   0    0    1   
$EndComp
Text Notes 7600 3750 0    60   ~ 0
1-5V (SD)\n2-GND (SD)\n3-Tiva ADC\n4-PT GND\n5-PT 5v\n6-Fet Input\n\n
Text Notes 5525 3575 2    60   ~ 0
1-5V\n2-GND\n3-Tiva analog pin
$Comp
L Q_NMOS_DGS Q1
U 1 1 5AB444ED
P 6100 4400
F 0 "Q1" H 6300 4450 50  0000 L CNN
F 1 "Q_NMOS_DGS" H 6300 4350 50  0000 L CNN
F 2 "" H 6300 4500 50  0001 C CNN
F 3 "" H 6100 4400 50  0001 C CNN
	1    6100 4400
	1    0    0    -1  
$EndComp
Text GLabel 7300 3150 0    55   Input ~ 0
SD-5v
Text GLabel 7300 3250 0    55   Input ~ 0
SD-GND
Wire Wire Line
	5900 3650 5900 4400
Wire Wire Line
	5900 4400 5900 5050
Wire Wire Line
	7350 4500 7350 4200
Wire Wire Line
	7350 4200 6200 4200
Wire Wire Line
	7450 4500 8000 4500
Connection ~ 6200 5050
Wire Wire Line
	6200 4600 6200 5050
Wire Wire Line
	6200 5050 6800 5050
Wire Wire Line
	8100 4500 8350 4500
Wire Wire Line
	8350 4500 8350 5050
Wire Wire Line
	8350 5050 6800 5050
Wire Wire Line
	6800 5050 6800 5050
$Comp
L Conn_01x06 J2
U 1 1 5AD3D686
P 7500 3350
F 0 "J2" H 7500 3650 50  0000 C CNN
F 1 "Conn_01x06" H 7500 2950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06_Pitch2.54mm" H 7500 3350 50  0001 C CNN
F 3 "" H 7500 3350 50  0001 C CNN
	1    7500 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3450 7300 3450
Wire Wire Line
	5750 3350 7300 3350
Wire Wire Line
	4425 4300 4425 4300
Wire Wire Line
	5750 3550 7300 3550
Wire Wire Line
	5900 3650 7300 3650
Connection ~ 5900 4400
$EndSCHEMATC
