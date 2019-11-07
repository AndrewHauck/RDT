EESchema Schematic File Version 4
LIBS:power
LIBS:device
LIBS:74xx
LIBS:audio
LIBS:interface
LIBS:Igniter-cache
EELAYER 26 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 2
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
L Connector:Conn_01x03_Female J3
U 1 1 5D9DC3E6
P 1665 5760
F 0 "J3" H 1557 5435 50  0000 C CNN
F 1 "PT2" H 1557 5526 50  0000 C CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 1665 5760 50  0001 C CNN
F 3 "~" H 1665 5760 50  0001 C CNN
	1    1665 5760
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Female J4
U 1 1 5DA6174F
P 1430 5765
F 0 "J4" H 1322 5440 50  0000 C CNN
F 1 "PT1" H 1322 5531 50  0000 C CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 1430 5765 50  0001 C CNN
F 3 "~" H 1430 5765 50  0001 C CNN
	1    1430 5765
	1    0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Female J6
U 1 1 5DA617F3
P 1700 6380
F 0 "J6" H 1592 6055 50  0000 C CNN
F 1 "PT4" H 1592 6146 50  0000 C CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 1700 6380 50  0001 C CNN
F 3 "~" H 1700 6380 50  0001 C CNN
	1    1700 6380
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Female J5
U 1 1 5DA6183F
P 1435 6380
F 0 "J5" H 1327 6055 50  0000 C CNN
F 1 "PT3" H 1327 6146 50  0000 C CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 1435 6380 50  0001 C CNN
F 3 "~" H 1435 6380 50  0001 C CNN
	1    1435 6380
	1    0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR03
U 1 1 5DA63712
P 9670 1510
F 0 "#PWR03" H 9670 1260 50  0001 C CNN
F 1 "GNDREF" H 9675 1337 50  0001 C CNN
F 2 "" H 9670 1510 50  0001 C CNN
F 3 "" H 9670 1510 50  0001 C CNN
	1    9670 1510
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR015
U 1 1 5DA63C3F
P 1865 5860
F 0 "#PWR015" H 1865 5610 50  0001 C CNN
F 1 "GNDREF" H 1870 5687 50  0001 C CNN
F 2 "" H 1865 5860 50  0001 C CNN
F 3 "" H 1865 5860 50  0001 C CNN
	1    1865 5860
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR016
U 1 1 5DA63E38
P 1230 5865
F 0 "#PWR016" H 1230 5615 50  0001 C CNN
F 1 "GNDREF" H 1235 5692 50  0001 C CNN
F 2 "" H 1230 5865 50  0001 C CNN
F 3 "" H 1230 5865 50  0001 C CNN
	1    1230 5865
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR020
U 1 1 5DA63E9D
P 1900 6480
F 0 "#PWR020" H 1900 6230 50  0001 C CNN
F 1 "GNDREF" H 1905 6307 50  0001 C CNN
F 2 "" H 1900 6480 50  0001 C CNN
F 3 "" H 1900 6480 50  0001 C CNN
	1    1900 6480
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR019
U 1 1 5DA63EF6
P 1235 6480
F 0 "#PWR019" H 1235 6230 50  0001 C CNN
F 1 "GNDREF" H 1240 6307 50  0001 C CNN
F 2 "" H 1235 6480 50  0001 C CNN
F 3 "" H 1235 6480 50  0001 C CNN
	1    1235 6480
	1    0    0    -1  
$EndComp
Text Notes 1170 5340 0    50   ~ 0
Pressure Transducers
Connection ~ 8885 6140
Wire Wire Line
	8885 6140 8885 6235
Wire Wire Line
	8495 5640 8585 5640
Connection ~ 8495 5640
Wire Wire Line
	8495 6140 8495 5640
Wire Wire Line
	8520 6140 8495 6140
Wire Wire Line
	8885 6140 8820 6140
$Comp
L Device:R R?
U 1 1 5DAB751B
P 8670 6140
AR Path="/5D9BEB88/5DAB751B" Ref="R?"  Part="1" 
AR Path="/5DAB751B" Ref="R6"  Part="1" 
F 0 "R6" V 8463 6140 50  0001 C CNN
F 1 "10k" V 8555 6140 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric_Pad1.42x2.65mm_HandSolder" V 8600 6140 50  0001 C CNN
F 3 "~" H 8670 6140 50  0001 C CNN
	1    8670 6140
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DAB7521
P 8295 5640
AR Path="/5D9BEB88/5DAB7521" Ref="R?"  Part="1" 
AR Path="/5DAB7521" Ref="R5"  Part="1" 
F 0 "R5" V 8088 5640 50  0001 C CNN
F 1 "1k" V 8180 5640 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric_Pad1.42x2.65mm_HandSolder" V 8225 5640 50  0001 C CNN
F 3 "~" H 8295 5640 50  0001 C CNN
	1    8295 5640
	0    1    1    0   
$EndComp
Wire Wire Line
	8445 5640 8495 5640
Text Notes 4015 7870 0    50   ~ 0
actuate solenoids through code\n1 arm switch\n1 ignition switch to trigger code\nIdeal: actuate everything through interface\nIf time does not allow: use analog valve switching\n
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5DAB9C23
P 9870 1390
F 0 "J2" H 9897 1366 50  0000 L CNN
F 1 "Battery" H 9897 1275 50  0000 L CNN
F 2 "Igniter:BananaJack15.5mm" H 9870 1390 50  0001 C CNN
F 3 "~" H 9870 1390 50  0001 C CNN
	1    9870 1390
	1    0    0    -1  
$EndComp
Wire Notes Line
	8750 825  8750 1635
Wire Notes Line
	10205 1635 10205 825 
Wire Notes Line
	10205 825  8750 825 
Text Notes 9120 800  0    50   ~ 0
24V battery connection
Text GLabel 8080 5640 0    50   Input ~ 0
IGNITE
$Comp
L power:GNDREF #PWR024
U 1 1 5DABC8A2
P 8885 6235
F 0 "#PWR024" H 8885 5985 50  0001 C CNN
F 1 "GNDREF" H 8890 6062 50  0000 C CNN
F 2 "" H 8885 6235 50  0001 C CNN
F 3 "" H 8885 6235 50  0001 C CNN
	1    8885 6235
	1    0    0    -1  
$EndComp
Text GLabel 1230 5765 0    50   Input ~ 0
PT1
$Comp
L power:+5V #PWR013
U 1 1 5DAC0085
P 1940 5660
F 0 "#PWR013" H 1940 5510 50  0001 C CNN
F 1 "+5V" H 1955 5833 50  0000 C CNN
F 2 "" H 1940 5660 50  0001 C CNN
F 3 "" H 1940 5660 50  0001 C CNN
	1    1940 5660
	1    0    0    -1  
$EndComp
Wire Wire Line
	1865 5660 1940 5660
$Comp
L power:+5V #PWR018
U 1 1 5DAC069D
P 1965 6280
F 0 "#PWR018" H 1965 6130 50  0001 C CNN
F 1 "+5V" H 1980 6453 50  0000 C CNN
F 2 "" H 1965 6280 50  0001 C CNN
F 3 "" H 1965 6280 50  0001 C CNN
	1    1965 6280
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 6280 1965 6280
$Comp
L power:+5V #PWR017
U 1 1 5DAC0A32
P 1160 6280
F 0 "#PWR017" H 1160 6130 50  0001 C CNN
F 1 "+5V" H 1175 6453 50  0000 C CNN
F 2 "" H 1160 6280 50  0001 C CNN
F 3 "" H 1160 6280 50  0001 C CNN
	1    1160 6280
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 5DAC0A8E
P 1145 5665
F 0 "#PWR014" H 1145 5515 50  0001 C CNN
F 1 "+5V" H 1160 5838 50  0000 C CNN
F 2 "" H 1145 5665 50  0001 C CNN
F 3 "" H 1145 5665 50  0001 C CNN
	1    1145 5665
	1    0    0    -1  
$EndComp
Wire Wire Line
	1145 5665 1230 5665
Wire Wire Line
	1160 6280 1235 6280
Text GLabel 1235 6380 0    50   Input ~ 0
PT3
Text GLabel 1900 6380 2    50   Input ~ 0
PT4
Text GLabel 1865 5760 2    50   Input ~ 0
PT2
Wire Notes Line
	955  5365 955  6625
Wire Notes Line
	955  6625 2110 6625
Wire Notes Line
	2110 6625 2110 5365
Wire Notes Line
	2110 5365 955  5365
Text Notes 9135 2060 0    50   ~ 0
Status Indicators
$Comp
L power:+5V #PWR07
U 1 1 5DAC3967
P 9195 2355
F 0 "#PWR07" H 9195 2205 50  0001 C CNN
F 1 "+5V" H 9210 2528 50  0000 C CNN
F 2 "" H 9195 2355 50  0001 C CNN
F 3 "" H 9195 2355 50  0001 C CNN
	1    9195 2355
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DAC3984
P 9195 2565
AR Path="/5D9BEB88/5DAC3984" Ref="R?"  Part="1" 
AR Path="/5DAC3984" Ref="R3"  Part="1" 
F 0 "R3" V 8988 2565 50  0001 C CNN
F 1 "300" V 9080 2565 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric_Pad1.42x2.65mm_HandSolder" V 9125 2565 50  0001 C CNN
F 3 "~" H 9195 2565 50  0001 C CNN
	1    9195 2565
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5DAC39A1
P 9195 2930
AR Path="/5D9BEB88/5DAC39A1" Ref="D?"  Part="1" 
AR Path="/5DAC39A1" Ref="D3"  Part="1" 
F 0 "D3" V 9233 2813 50  0000 R CNN
F 1 "5V_GOOD" V 9142 2813 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 9195 2930 50  0001 C CNN
F 3 "~" H 9195 2930 50  0001 C CNN
	1    9195 2930
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DAC3A5E
P 9850 2570
AR Path="/5D9BEB88/5DAC3A5E" Ref="R?"  Part="1" 
AR Path="/5DAC3A5E" Ref="R4"  Part="1" 
F 0 "R4" V 9643 2570 50  0001 C CNN
F 1 "1200" V 9735 2570 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric_Pad1.42x2.65mm_HandSolder" V 9780 2570 50  0001 C CNN
F 3 "~" H 9850 2570 50  0001 C CNN
	1    9850 2570
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5DAC3A7D
P 9850 2920
AR Path="/5D9BEB88/5DAC3A7D" Ref="D?"  Part="1" 
AR Path="/5DAC3A7D" Ref="D2"  Part="1" 
F 0 "D2" V 9888 2803 50  0000 R CNN
F 1 "24V_ARMED" V 9797 2803 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 9850 2920 50  0001 C CNN
F 3 "~" H 9850 2920 50  0001 C CNN
	1    9850 2920
	0    1    -1   0   
$EndComp
Wire Wire Line
	9195 2415 9195 2355
Wire Wire Line
	9195 2715 9195 2780
Wire Wire Line
	9850 2360 9850 2420
Wire Wire Line
	9850 2720 9850 2770
$Comp
L power:GNDREF #PWR011
U 1 1 5DAC5505
P 9850 3070
F 0 "#PWR011" H 9850 2820 50  0001 C CNN
F 1 "GNDREF" H 9855 2897 50  0001 C CNN
F 2 "" H 9850 3070 50  0001 C CNN
F 3 "" H 9850 3070 50  0001 C CNN
	1    9850 3070
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR012
U 1 1 5DAC5589
P 9195 3080
F 0 "#PWR012" H 9195 2830 50  0001 C CNN
F 1 "GNDREF" H 9200 2907 50  0001 C CNN
F 2 "" H 9195 3080 50  0001 C CNN
F 3 "" H 9195 3080 50  0001 C CNN
	1    9195 3080
	1    0    0    -1  
$EndComp
Wire Notes Line
	10120 2085 8715 2085
Wire Notes Line
	8715 2085 8715 3295
Wire Notes Line
	8715 3295 10120 3295
Wire Notes Line
	10120 3295 10120 2085
Text Notes 8615 4330 0    50   ~ 0
Igniter Driver
Wire Notes Line
	7495 6550 10160 6550
Wire Notes Line
	10170 4365 7505 4365
$Comp
L Device:Q_NMOS_GDS Q?
U 1 1 5DAB7515
P 8785 5640
AR Path="/5D9BEB88/5DAB7515" Ref="Q?"  Part="1" 
AR Path="/5DAB7515" Ref="Q1"  Part="1" 
F 0 "Q1" H 8991 5686 50  0001 L CNN
F 1 "N MOSFET" H 8991 5640 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-3_TabPin2" H 8985 5740 50  0001 C CNN
F 3 "~" H 8785 5640 50  0001 C CNN
	1    8785 5640
	1    0    0    -1  
$EndComp
Wire Wire Line
	8885 5840 8885 6140
Wire Wire Line
	8080 5640 8145 5640
Wire Notes Line
	10160 6550 10160 4365
Wire Notes Line
	7505 4365 7505 6550
Text Notes 6690 7725 0    50   ~ 0
Igniter Arduino Shield
$Comp
L Igniter-rescue:Arduino_Mega2560_Shield-arduino XA1
U 1 1 5DB49E1D
P 5045 4260
F 0 "XA1" H 5045 1880 60  0000 C CNN
F 1 "Arduino_Mega2560_Shield" H 5045 1774 60  0000 C CNN
F 2 "Arduino:Arduino_Mega2560_Shield" H 5745 7010 60  0001 C CNN
F 3 "https://store.arduino.cc/arduino-mega-2560-rev3" H 5745 7010 60  0001 C CNN
	1    5045 4260
	1    0    0    -1  
$EndComp
$Sheet
S 6765 2015 505  710 
U 5DB4D508
F0 "solenoids" 50
F1 "solenoids.sch" 50
F2 "SOL1" I L 6765 2110 50 
F3 "SOL2" I L 6765 2210 50 
F4 "SOL3" I L 6765 2310 50 
F5 "SOL4" I L 6765 2410 50 
F6 "SOL5" I L 6765 2510 50 
$EndSheet
Wire Wire Line
	6345 2110 6765 2110
Wire Wire Line
	6345 2210 6765 2210
Wire Wire Line
	6345 2310 6765 2310
Wire Wire Line
	6765 2410 6345 2410
Wire Wire Line
	6765 2510 6345 2510
Text GLabel 3745 3410 0    50   Input ~ 0
PT1
Text GLabel 3745 3510 0    50   Input ~ 0
PT2
Text GLabel 3745 3610 0    50   Input ~ 0
PT3
Text GLabel 3745 3710 0    50   Input ~ 0
PT4
Text GLabel 6345 2610 2    50   Input ~ 0
IGNITE
$Comp
L power:GNDREF #PWR022
U 1 1 5DB58C89
P 3290 5510
F 0 "#PWR022" H 3290 5260 50  0001 C CNN
F 1 "GNDREF" H 3295 5337 50  0000 C CNN
F 2 "" H 3290 5510 50  0001 C CNN
F 3 "" H 3290 5510 50  0001 C CNN
	1    3290 5510
	1    0    0    -1  
$EndComp
Wire Wire Line
	3745 5910 3745 5810
Wire Wire Line
	3745 5810 3745 5710
Connection ~ 3745 5810
Wire Wire Line
	3745 5610 3745 5710
Connection ~ 3745 5710
Wire Wire Line
	3745 5510 3745 5610
Connection ~ 3745 5610
Wire Wire Line
	3290 5510 3745 5510
Connection ~ 3745 5510
$Comp
L power:+5V #PWR023
U 1 1 5DB5CBD4
P 3275 6110
F 0 "#PWR023" H 3275 5960 50  0001 C CNN
F 1 "+5V" H 3275 6255 50  0000 C CNN
F 2 "" H 3275 6110 50  0001 C CNN
F 3 "" H 3275 6110 50  0001 C CNN
	1    3275 6110
	1    0    0    -1  
$EndComp
Wire Wire Line
	3745 6110 3275 6110
NoConn ~ 3745 6410
Wire Wire Line
	8885 4945 8885 4995
Wire Wire Line
	9345 4900 9345 4995
Wire Wire Line
	9345 4995 8885 4995
Connection ~ 8885 4995
Wire Wire Line
	8885 4995 8885 5440
Text Notes 8920 4865 0    157  ~ 31
*
$Comp
L Connector:Conn_01x08_Male J1
U 1 1 5DB64D46
P -2020 2085
F 0 "J1" H -1914 2663 50  0000 C CNN
F 1 "SD Header" H -1914 2572 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H -2020 2085 50  0001 C CNN
F 3 "~" H -2020 2085 50  0001 C CNN
	1    -2020 2085
	1    0    0    -1  
$EndComp
Text Notes -2530 2400 0    49   ~ 0
1 - CD\n2 - CS\n3 - DI\n4 - DO\n5 - CLK\n6 - GND\n7 - 3V\n8 - 5V
$Comp
L Mechanical:MountingHole MH2
U 1 1 5DB4BD1A
P 1230 7650
F 0 "MH2" H 1330 7650 50  0000 L CNN
F 1 "MountingHole" H 1330 7605 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 1230 7650 50  0001 C CNN
F 3 "~" H 1230 7650 50  0001 C CNN
	1    1230 7650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH3
U 1 1 5DB4BE36
P 1225 7835
F 0 "MH3" H 1325 7835 50  0000 L CNN
F 1 "MountingHole" H 1325 7790 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 1225 7835 50  0001 C CNN
F 3 "~" H 1225 7835 50  0001 C CNN
	1    1225 7835
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH4
U 1 1 5DB4BEEA
P 1035 7835
F 0 "MH4" H 935 7835 50  0000 R CNN
F 1 "MountingHole" H 1135 7790 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 1035 7835 50  0001 C CNN
F 3 "~" H 1035 7835 50  0001 C CNN
	1    1035 7835
	1    0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole MH1
U 1 1 5DB4BFCA
P 1035 7655
F 0 "MH1" V 1035 7395 50  0000 L CNN
F 1 "MountingHole" H 1135 7610 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 1035 7655 50  0001 C CNN
F 3 "~" H 1035 7655 50  0001 C CNN
	1    1035 7655
	0    1    -1   0   
$EndComp
Text Notes -2235 1440 0    50   ~ 0
SD breakout board
Wire Notes Line
	-2675 1460 -1190 1460
Wire Notes Line
	-1190 1460 -1190 2595
Wire Notes Line
	-1190 2595 -2675 2595
Wire Notes Line
	-2675 2595 -2675 1460
$Comp
L Device:Fuse F1
U 1 1 5DB57AA9
P 9115 1205
F 0 "F1" H 9175 1251 50  0000 L CNN
F 1 "Fuse" H 9175 1160 50  0000 L CNN
F 2 "IgniterCustom:FuseHolder" V 9045 1205 50  0001 C CNN
F 3 "~" H 9115 1205 50  0001 C CNN
	1    9115 1205
	1    0    0    -1  
$EndComp
Wire Wire Line
	9670 1510 9670 1490
$Comp
L power:+5V #PWR05
U 1 1 5DB69B91
P -1520 2485
F 0 "#PWR05" H -1520 2335 50  0001 C CNN
F 1 "+5V" H -1505 2658 50  0000 C CNN
F 2 "" H -1520 2485 50  0001 C CNN
F 3 "" H -1520 2485 50  0001 C CNN
	1    -1520 2485
	1    0    0    -1  
$EndComp
NoConn ~ -1820 2385
$Comp
L power:GNDREF #PWR04
U 1 1 5DB6CE1B
P -1665 2285
F 0 "#PWR04" H -1665 2035 50  0001 C CNN
F 1 "GNDREF" H -1660 2112 50  0001 C CNN
F 2 "" H -1665 2285 50  0001 C CNN
F 3 "" H -1665 2285 50  0001 C CNN
	1    -1665 2285
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1665 2285 -1820 2285
Wire Wire Line
	-1820 2485 -1520 2485
NoConn ~ -1820 1785
Text GLabel 4995 1660 1    50   Input ~ 0
CLK
Text GLabel -1820 2185 2    50   Input ~ 0
CLK
Text GLabel -1820 2085 2    50   Input ~ 0
DO
Text GLabel -1820 1985 2    50   Input ~ 0
DI
Text GLabel -1820 1885 2    50   Input ~ 0
CS
Text GLabel 6345 6410 2    50   Input ~ 0
CS
Text GLabel 4895 1660 1    50   Input ~ 0
DI
Text GLabel 4795 1660 1    50   Input ~ 0
DO
$Comp
L power:GNDREF #PWR02
U 1 1 5DB796A8
P 5265 1485
F 0 "#PWR02" H 5265 1235 50  0001 C CNN
F 1 "GNDREF" H 5270 1312 50  0001 C CNN
F 2 "" H 5265 1485 50  0001 C CNN
F 3 "" H 5265 1485 50  0001 C CNN
	1    5265 1485
	1    0    0    -1  
$EndComp
Wire Wire Line
	5195 1660 5195 1485
Wire Wire Line
	5195 1485 5265 1485
NoConn ~ 3745 5010
Wire Wire Line
	3745 6310 3745 6210
Wire Wire Line
	3745 6110 3745 6210
Connection ~ 3745 6110
Connection ~ 3745 6210
NoConn ~ 6345 2710
NoConn ~ 3745 5310
NoConn ~ 3745 5210
Wire Wire Line
	9595 1390 9670 1390
Text Notes 8955 1240 0    50   ~ 0
5A
$Comp
L Device:D D4
U 1 1 5DB2A47F
P 8885 4795
F 0 "D4" V 8865 4875 50  0000 L CNN
F 1 "D" V 8930 4874 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" H 8885 4795 50  0001 C CNN
F 3 "~" H 8885 4795 50  0001 C CNN
	1    8885 4795
	0    -1   1    0   
$EndComp
$Comp
L Connector:Barrel_Jack J7
U 1 1 5DAB74DD
P 9645 4800
AR Path="/5DAB74DD" Ref="J7"  Part="1" 
AR Path="/5D9BEB88/5DAB74DD" Ref="J?"  Part="1" 
F 0 "J7" H 9415 4758 50  0000 R CNN
F 1 "IgnitionCoil" H 9860 5000 50  0000 R CNN
F 2 "Igniter:BananaJack15.5mm" H 9695 4760 50  0001 C CNN
F 3 "~" H 9695 4760 50  0001 C CNN
	1    9645 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	9345 4700 9345 4645
Wire Wire Line
	9345 4645 8885 4645
$Comp
L power:+24V #PWR01
U 1 1 5DBB64EE
P 9115 1055
F 0 "#PWR01" H 9115 905 50  0001 C CNN
F 1 "+24V" H 9130 1228 50  0000 C CNN
F 2 "" H 9115 1055 50  0001 C CNN
F 3 "" H 9115 1055 50  0001 C CNN
	1    9115 1055
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR08
U 1 1 5DBB6589
P 9850 2360
F 0 "#PWR08" H 9850 2210 50  0001 C CNN
F 1 "+24V" H 9865 2533 50  0000 C CNN
F 2 "" H 9850 2360 50  0001 C CNN
F 3 "" H 9850 2360 50  0001 C CNN
	1    9850 2360
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR021
U 1 1 5DBB7502
P 8885 4645
F 0 "#PWR021" H 8885 4495 50  0001 C CNN
F 1 "+24V" H 8900 4818 50  0000 C CNN
F 2 "" H 8885 4645 50  0001 C CNN
F 3 "" H 8885 4645 50  0001 C CNN
	1    8885 4645
	1    0    0    -1  
$EndComp
Connection ~ 8885 4645
Text Notes 1240 6745 0    50   ~ 0
Draw: 24mA
$Comp
L Switch:SW_SPST SW?
U 1 1 5DAB7506
P 9395 1390
AR Path="/5D9BEB88/5DAB7506" Ref="SW?"  Part="1" 
AR Path="/5DAB7506" Ref="SW1"  Part="1" 
F 0 "SW1" H 9395 1165 50  0001 C CNN
F 1 "ARM" H 9395 1515 50  0000 C CNN
F 2 "" H 9395 1390 50  0001 C CNN
F 3 "~" H 9395 1390 50  0001 C CNN
	1    9395 1390
	-1   0    0    1   
$EndComp
Wire Wire Line
	9115 1390 9195 1390
Wire Wire Line
	9115 1390 9115 1355
Wire Notes Line
	8750 1635 10205 1635
Text Notes 8235 5495 0    157  ~ 0
?
Text Notes 705  7525 0    50   ~ 0
Board Corner Standoffs
Text Notes 4035 1310 0    79   ~ 0
Make unused pins available from the top of shield
$Comp
L power:+3V3 #PWR?
U 1 1 5DC4F427
P 3550 6010
F 0 "#PWR?" H 3550 5860 50  0001 C CNN
F 1 "+3V3" H 3550 6150 50  0000 C CNN
F 2 "" H 3550 6010 50  0001 C CNN
F 3 "" H 3550 6010 50  0001 C CNN
	1    3550 6010
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 6010 3745 6010
$Comp
L power:+3V3 #PWR?
U 1 1 5DC533E7
P 1460 2785
F 0 "#PWR?" H 1460 2635 50  0001 C CNN
F 1 "+3V3" H 1460 2925 50  0000 C CNN
F 2 "" H 1460 2785 50  0001 C CNN
F 3 "" H 1460 2785 50  0001 C CNN
	1    1460 2785
	1    0    0    -1  
$EndComp
$Comp
L Connector:Micro_SD_Card_Det_Hirose_DM3AT J?
U 1 1 5DC549F3
P 1360 3910
F 0 "J?" V 1264 4590 50  0000 L CNN
F 1 "Micro_SD_Card_Det_Hirose_DM3AT" V 1355 4590 50  0000 L CNN
F 2 "" H 3410 4610 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/DM3/category/Catalog/doc_file_id/49662/?file_category_id=4&item_id=195&is_series=1" H 1360 4010 50  0001 C CNN
	1    1360 3910
	0    1    1    0   
$EndComp
NoConn ~ 860  3010
Text GLabel 960  3010 1    50   Input ~ 0
CD
Text GLabel 6345 3310 2    50   Input ~ 0
CD
$Comp
L 7400-ic:74HC4050 IC?
U 1 1 5DC596AC
P 1735 1875
F 0 "IC?" H 1735 2612 60  0000 C CNN
F 1 "74HC4050" H 1735 2506 60  0000 C CNN
F 2 "" H 1635 1875 60  0001 C CNN
F 3 "" H 1685 1875 60  0001 C CNN
	1    1735 1875
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5DC5993E
P 1335 1625
F 0 "#PWR?" H 1335 1375 50  0001 C CNN
F 1 "GNDREF" H 1340 1452 50  0001 C CNN
F 2 "" H 1335 1625 50  0001 C CNN
F 3 "" H 1335 1625 50  0001 C CNN
	1    1335 1625
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5DC59C87
P 1335 1425
F 0 "#PWR?" H 1335 1275 50  0001 C CNN
F 1 "+3V3" H 1335 1565 50  0000 C CNN
F 2 "" H 1335 1425 50  0001 C CNN
F 3 "" H 1335 1425 50  0001 C CNN
	1    1335 1425
	1    0    0    -1  
$EndComp
Text GLabel 1160 2890 1    50   Input ~ 0
DO
Text GLabel 1025 1995 0    50   Input ~ 0
DI
Text GLabel 1335 1825 0    50   Input ~ 0
CLK
Wire Wire Line
	1460 2785 1460 3010
$EndSCHEMATC
