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
Text Notes 11400 2350 0    60   ~ 0
Requirements:\n
$Comp
L Conn_01x02 J?
U 1 1 5AB41D24
P 8100 4700
F 0 "J?" H 8100 4800 50  0000 C CNN
F 1 "Battery" H 8100 4500 50  0000 C CNN
F 2 "" H 8100 4700 50  0001 C CNN
F 3 "" H 8100 4700 50  0001 C CNN
	1    8100 4700
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5AB41E9B
P 6050 4750
F 0 "R?" V 6130 4750 50  0000 C CNN
F 1 "10k" V 6050 4750 50  0000 C CNN
F 2 "" V 5980 4750 50  0001 C CNN
F 3 "" H 6050 4750 50  0001 C CNN
	1    6050 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 4400 5900 4750
$Comp
L Conn_02x04_Counter_Clockwise J?
U 1 1 5AB4216C
P 5750 3350
F 0 "J?" H 5800 3550 50  0000 C CNN
F 1 "Conn_02x04" H 5800 3050 50  0000 C CNN
F 2 "" H 5750 3350 50  0001 C CNN
F 3 "" H 5750 3350 50  0001 C CNN
	1    5750 3350
	0    1    1    0   
$EndComp
$Comp
L Conn_01x02 J?
U 1 1 5AB422D7
P 7450 4700
F 0 "J?" H 7450 4800 50  0000 C CNN
F 1 "Ignition Coil" H 7450 4500 50  0000 C CNN
F 2 "" H 7450 4700 50  0001 C CNN
F 3 "" H 7450 4700 50  0001 C CNN
	1    7450 4700
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5AB4244F
P 5500 4400
F 0 "R?" V 5580 4400 50  0000 C CNN
F 1 "1k" V 5500 4400 50  0000 C CNN
F 2 "" V 5430 4400 50  0001 C CNN
F 3 "" H 5500 4400 50  0001 C CNN
	1    5500 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 4500 7350 4200
Wire Wire Line
	7350 4200 6200 4200
Wire Wire Line
	7450 4500 8000 4500
Connection ~ 6200 4750
$Comp
L Conn_01x03_Female J?
U 1 1 5AB42CE4
P 4400 3850
F 0 "J?" H 4400 4050 50  0000 C CNN
F 1 "P_Transducer" H 4400 3650 50  0000 C CNN
F 2 "" H 4400 3850 50  0001 C CNN
F 3 "" H 4400 3850 50  0001 C CNN
	1    4400 3850
	-1   0    0    1   
$EndComp
Wire Wire Line
	6200 4600 6200 4750
Wire Wire Line
	8100 4500 8100 4400
Wire Wire Line
	8100 4400 6800 4400
Wire Wire Line
	6800 4400 6800 4750
Wire Wire Line
	6800 4750 6200 4750
Wire Wire Line
	4600 3750 5650 3750
Wire Wire Line
	5650 3750 5650 3650
Wire Wire Line
	4600 3850 5750 3850
Wire Wire Line
	5750 3850 5750 3650
Wire Wire Line
	4600 3950 5850 3950
Wire Wire Line
	5850 3950 5850 3650
Text Notes 6100 3800 0    60   ~ 0
1-5V\n2-GND\n3-Tiva A0\n4-Spark plug GND\n5-Fet Gate\n6-\n7-\n8 
Text Notes 3400 4000 0    60   ~ 0
1-5V\n2-GND\n3-Tiva analog pin
Wire Wire Line
	5650 4400 5900 4400
$Comp
L Q_NMOS_DGS Q?
U 1 1 5AB444ED
P 6100 4400
F 0 "Q?" H 6300 4450 50  0000 L CNN
F 1 "Q_NMOS_DGS" H 6300 4350 50  0000 L CNN
F 2 "" H 6300 4500 50  0001 C CNN
F 3 "" H 6100 4400 50  0001 C CNN
	1    6100 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4400 5350 3650
Wire Wire Line
	5350 3650 5550 3650
$EndSCHEMATC
