EESchema Schematic File Version 4
LIBS:power
LIBS:device
LIBS:74xx
LIBS:audio
LIBS:interface
LIBS:Igniter-cache
EELAYER 29 0
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
P 4100 4750
F 0 "J1" H 4100 4950 50  0000 C CNN
F 1 "P_Transducer" H 4100 4550 50  0000 C CNN
F 2 "" H 4100 4750 50  0001 C CNN
F 3 "" H 4100 4750 50  0001 C CNN
	1    4100 4750
	-1   0    0    1   
$EndComp
Text Notes 4075 4875 2    60   ~ 0
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
Wire Wire Line
	5900 4400 5900 5050
Wire Wire Line
	7450 4500 8000 4500
Wire Wire Line
	6200 4600 6200 5050
Wire Wire Line
	8100 4500 8350 4500
Wire Wire Line
	6200 5050 8350 5050
$Comp
L Switch:SW_SPST SW?
U 1 1 5D32EEBB
P 8350 4850
F 0 "SW?" V 8304 4948 50  0000 L CNN
F 1 "SW_SPST" V 8395 4948 50  0000 L CNN
F 2 "" H 8350 4850 50  0001 C CNN
F 3 "~" H 8350 4850 50  0001 C CNN
	1    8350 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 4650 8350 4500
Text Notes 7965 4830 0    50   ~ 0
+
Text Notes 8400 4200 0    50   ~ 0
-
Text Notes 7415 4835 0    50   ~ 0
+
$Comp
L Igniter-rescue:4017-4xxx U?
U 1 1 5D32AA5C
P 3155 3200
F 0 "U?" H 3155 4181 50  0000 C CNN
F 1 "4017" H 3155 4090 50  0000 C CNN
F 2 "" H 3155 3200 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/Intersil/documents/cd40/cd4017bms-22bms.pdf" H 3155 3200 50  0001 C CNN
	1    3155 3200
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:AD797 U?
U 1 1 5D32AFCE
P 5305 3290
F 0 "U?" H 5649 3336 50  0000 L CNN
F 1 "AD797" H 5649 3245 50  0000 L CNN
F 2 "" H 5355 3340 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD797.pdf" H 5355 3440 50  0001 C CNN
	1    5305 3290
	1    0    0    -1  
$EndComp
$EndSCHEMATC
