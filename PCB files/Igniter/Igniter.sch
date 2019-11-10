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
Sheet 1 3
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
P 2235 5070
F 0 "J3" H 2127 4745 50  0000 C CNN
F 1 "PT2" H 2127 4836 50  0000 C CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 2235 5070 50  0001 C CNN
F 3 "~" H 2235 5070 50  0001 C CNN
	1    2235 5070
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Female J4
U 1 1 5DA6174F
P 2000 5075
F 0 "J4" H 1892 4750 50  0000 C CNN
F 1 "PT1" H 1892 4841 50  0000 C CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 2000 5075 50  0001 C CNN
F 3 "~" H 2000 5075 50  0001 C CNN
	1    2000 5075
	1    0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Female J6
U 1 1 5DA617F3
P 2270 5690
F 0 "J6" H 2162 5365 50  0000 C CNN
F 1 "PT4" H 2162 5456 50  0000 C CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 2270 5690 50  0001 C CNN
F 3 "~" H 2270 5690 50  0001 C CNN
	1    2270 5690
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Female J5
U 1 1 5DA6183F
P 2005 5690
F 0 "J5" H 1897 5365 50  0000 C CNN
F 1 "PT3" H 1897 5456 50  0000 C CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 2005 5690 50  0001 C CNN
F 3 "~" H 2005 5690 50  0001 C CNN
	1    2005 5690
	1    0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR03
U 1 1 5DA63712
P 9825 1325
F 0 "#PWR03" H 9825 1075 50  0001 C CNN
F 1 "GNDREF" H 9830 1152 50  0001 C CNN
F 2 "" H 9825 1325 50  0001 C CNN
F 3 "" H 9825 1325 50  0001 C CNN
	1    9825 1325
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR015
U 1 1 5DA63C3F
P 2435 5170
F 0 "#PWR015" H 2435 4920 50  0001 C CNN
F 1 "GNDREF" H 2440 4997 50  0001 C CNN
F 2 "" H 2435 5170 50  0001 C CNN
F 3 "" H 2435 5170 50  0001 C CNN
	1    2435 5170
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR016
U 1 1 5DA63E38
P 1800 5175
F 0 "#PWR016" H 1800 4925 50  0001 C CNN
F 1 "GNDREF" H 1805 5002 50  0001 C CNN
F 2 "" H 1800 5175 50  0001 C CNN
F 3 "" H 1800 5175 50  0001 C CNN
	1    1800 5175
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR020
U 1 1 5DA63E9D
P 2470 5790
F 0 "#PWR020" H 2470 5540 50  0001 C CNN
F 1 "GNDREF" H 2475 5617 50  0001 C CNN
F 2 "" H 2470 5790 50  0001 C CNN
F 3 "" H 2470 5790 50  0001 C CNN
	1    2470 5790
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR019
U 1 1 5DA63EF6
P 1805 5790
F 0 "#PWR019" H 1805 5540 50  0001 C CNN
F 1 "GNDREF" H 1810 5617 50  0001 C CNN
F 2 "" H 1805 5790 50  0001 C CNN
F 3 "" H 1805 5790 50  0001 C CNN
	1    1805 5790
	1    0    0    -1  
$EndComp
Text Notes 1740 4650 0    50   ~ 0
Pressure Transducers
Connection ~ 8735 5940
Wire Wire Line
	8735 5940 8735 6035
Wire Wire Line
	8345 5440 8435 5440
Connection ~ 8345 5440
Wire Wire Line
	8345 5940 8345 5440
Wire Wire Line
	8370 5940 8345 5940
Wire Wire Line
	8735 5940 8670 5940
$Comp
L Device:R R?
U 1 1 5DAB751B
P 8520 5940
AR Path="/5D9BEB88/5DAB751B" Ref="R?"  Part="1" 
AR Path="/5DAB751B" Ref="R6"  Part="1" 
F 0 "R6" V 8313 5940 50  0001 C CNN
F 1 "10k" V 8405 5940 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 8450 5940 50  0001 C CNN
F 3 "~" H 8520 5940 50  0001 C CNN
	1    8520 5940
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5DAB9C23
P 10025 1205
F 0 "J2" H 10052 1181 50  0000 L CNN
F 1 "Battery" H 10052 1090 50  0000 L CNN
F 2 "Igniter:BananaJack15.5mm" H 10025 1205 50  0001 C CNN
F 3 "~" H 10025 1205 50  0001 C CNN
	1    10025 1205
	1    0    0    -1  
$EndComp
Wire Notes Line
	8905 640  8905 1450
Wire Notes Line
	10360 1450 10360 640 
Wire Notes Line
	10360 640  8905 640 
Text Notes 9275 615  0    50   ~ 0
24V battery connection
Text GLabel 8230 5440 0    50   Input ~ 0
IGNITE
$Comp
L power:GNDREF #PWR024
U 1 1 5DABC8A2
P 8735 6035
F 0 "#PWR024" H 8735 5785 50  0001 C CNN
F 1 "GNDREF" H 8740 5862 50  0000 C CNN
F 2 "" H 8735 6035 50  0001 C CNN
F 3 "" H 8735 6035 50  0001 C CNN
	1    8735 6035
	1    0    0    -1  
$EndComp
Text GLabel 1800 5075 0    50   Input ~ 0
PT1
Wire Wire Line
	2435 4970 2510 4970
Wire Wire Line
	2470 5590 2535 5590
Wire Wire Line
	1715 4975 1800 4975
Wire Wire Line
	1730 5590 1805 5590
Text GLabel 1805 5690 0    50   Input ~ 0
PT3
Text GLabel 2470 5690 2    50   Input ~ 0
PT4
Text GLabel 2435 5070 2    50   Input ~ 0
PT2
Wire Notes Line
	1525 4675 1525 5935
Wire Notes Line
	1525 5935 2680 5935
Wire Notes Line
	2680 5935 2680 4675
Wire Notes Line
	2680 4675 1525 4675
Text Notes 1590 695  0    50   ~ 0
Status Indicators
$Comp
L Device:R R?
U 1 1 5DAC3984
P 1965 1205
AR Path="/5D9BEB88/5DAC3984" Ref="R?"  Part="1" 
AR Path="/5DAC3984" Ref="R3"  Part="1" 
F 0 "R3" V 1758 1205 50  0001 C CNN
F 1 "300" V 1960 1205 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 1895 1205 50  0001 C CNN
F 3 "~" H 1965 1205 50  0001 C CNN
	1    1965 1205
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5DAC39A1
P 1965 1570
AR Path="/5D9BEB88/5DAC39A1" Ref="D?"  Part="1" 
AR Path="/5DAC39A1" Ref="D3"  Part="1" 
F 0 "D3" V 2003 1453 50  0000 R CNN
F 1 "5V_GOOD" V 1912 1453 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 1965 1570 50  0001 C CNN
F 3 "~" H 1965 1570 50  0001 C CNN
	1    1965 1570
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DAC3A5E
P 2620 1210
AR Path="/5D9BEB88/5DAC3A5E" Ref="R?"  Part="1" 
AR Path="/5DAC3A5E" Ref="R4"  Part="1" 
F 0 "R4" V 2413 1210 50  0001 C CNN
F 1 "1k2" V 2615 1210 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 2550 1210 50  0001 C CNN
F 3 "~" H 2620 1210 50  0001 C CNN
	1    2620 1210
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5DAC3A7D
P 2620 1560
AR Path="/5D9BEB88/5DAC3A7D" Ref="D?"  Part="1" 
AR Path="/5DAC3A7D" Ref="D2"  Part="1" 
F 0 "D2" V 2658 1443 50  0000 R CNN
F 1 "24V_ARMED" V 2567 1443 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 2620 1560 50  0001 C CNN
F 3 "~" H 2620 1560 50  0001 C CNN
	1    2620 1560
	0    1    -1   0   
$EndComp
Wire Wire Line
	1965 1055 1965 995 
Wire Wire Line
	1965 1355 1965 1420
Wire Wire Line
	2620 1000 2620 1060
Wire Wire Line
	2620 1360 2620 1410
$Comp
L power:GNDREF #PWR011
U 1 1 5DAC5505
P 2620 1710
F 0 "#PWR011" H 2620 1460 50  0001 C CNN
F 1 "GNDREF" H 2625 1537 50  0001 C CNN
F 2 "" H 2620 1710 50  0001 C CNN
F 3 "" H 2620 1710 50  0001 C CNN
	1    2620 1710
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR012
U 1 1 5DAC5589
P 1965 1720
F 0 "#PWR012" H 1965 1470 50  0001 C CNN
F 1 "GNDREF" H 1970 1547 50  0001 C CNN
F 2 "" H 1965 1720 50  0001 C CNN
F 3 "" H 1965 1720 50  0001 C CNN
	1    1965 1720
	1    0    0    -1  
$EndComp
Wire Notes Line
	2890 1935 2890 725 
Text Notes 8465 4130 0    50   ~ 0
Igniter Driver
$Comp
L Device:Q_NMOS_GDS Q?
U 1 1 5DAB7515
P 8635 5440
AR Path="/5D9BEB88/5DAB7515" Ref="Q?"  Part="1" 
AR Path="/5DAB7515" Ref="Q1"  Part="1" 
F 0 "Q1" H 8841 5486 50  0001 L CNN
F 1 "N MOSFET" H 8841 5440 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-3_TabPin2" H 8835 5540 50  0001 C CNN
F 3 "~" H 8635 5440 50  0001 C CNN
	1    8635 5440
	1    0    0    -1  
$EndComp
Wire Wire Line
	8735 5640 8735 5940
Wire Notes Line
	9520 6350 9520 4165
Wire Notes Line
	7795 4175 7795 6360
Text Notes 6690 7725 0    50   ~ 0
Igniter Arduino Shield
$Comp
L Igniter-rescue:Arduino_Mega2560_Shield-arduino XA1
U 1 1 5DB49E1D
P 5265 4140
F 0 "XA1" H 5265 1760 60  0000 C CNN
F 1 "Arduino_Mega2560_Shield" H 5265 1654 60  0000 C CNN
F 2 "Arduino:Arduino_Mega2560_Shield" H 5965 6890 60  0001 C CNN
F 3 "https://store.arduino.cc/arduino-mega-2560-rev3" H 5965 6890 60  0001 C CNN
	1    5265 4140
	1    0    0    -1  
$EndComp
$Sheet
S 2570 2230 505  585 
U 5DB4D508
F0 "solenoids" 50
F1 "solenoids.sch" 50
F2 "SOL1" I L 2570 2325 50 
F3 "SOL2" I L 2570 2425 50 
F4 "SOL3" I L 2570 2525 50 
F5 "SOL4" I L 2570 2625 50 
F6 "SOL5" I L 2570 2725 50 
$EndSheet
Text GLabel 3965 3290 0    50   Input ~ 0
PT1
Text GLabel 3965 3390 0    50   Input ~ 0
PT2
Text GLabel 3965 3490 0    50   Input ~ 0
PT3
Text GLabel 3965 3590 0    50   Input ~ 0
PT4
Text GLabel 6565 2490 2    50   Input ~ 0
IGNITE
$Comp
L power:GNDREF #PWR022
U 1 1 5DB58C89
P 3770 5390
F 0 "#PWR022" H 3770 5140 50  0001 C CNN
F 1 "GNDREF" H 3775 5217 50  0000 C CNN
F 2 "" H 3770 5390 50  0001 C CNN
F 3 "" H 3770 5390 50  0001 C CNN
	1    3770 5390
	1    0    0    -1  
$EndComp
Wire Wire Line
	3965 5790 3965 5690
Wire Wire Line
	3965 5690 3965 5590
Connection ~ 3965 5690
Wire Wire Line
	3965 5490 3965 5590
Connection ~ 3965 5590
Wire Wire Line
	3965 5390 3965 5490
Connection ~ 3965 5490
Wire Wire Line
	3770 5390 3965 5390
Connection ~ 3965 5390
NoConn ~ 3965 6290
$Comp
L Mechanical:MountingHole MH2
U 1 1 5DB4BD1A
P 1120 7650
F 0 "MH2" H 1220 7650 50  0000 L CNN
F 1 "MountingHole" H 1220 7605 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 1120 7650 50  0001 C CNN
F 3 "~" H 1120 7650 50  0001 C CNN
	1    1120 7650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH3
U 1 1 5DB4BE36
P 1115 7835
F 0 "MH3" H 1215 7835 50  0000 L CNN
F 1 "MountingHole" H 1215 7790 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 1115 7835 50  0001 C CNN
F 3 "~" H 1115 7835 50  0001 C CNN
	1    1115 7835
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH4
U 1 1 5DB4BEEA
P 925 7835
F 0 "MH4" H 825 7835 50  0000 R CNN
F 1 "MountingHole" H 1025 7790 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 925 7835 50  0001 C CNN
F 3 "~" H 925 7835 50  0001 C CNN
	1    925  7835
	1    0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole MH1
U 1 1 5DB4BFCA
P 925 7655
F 0 "MH1" V 925 7395 50  0000 L CNN
F 1 "MountingHole" H 1025 7610 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 925 7655 50  0001 C CNN
F 3 "~" H 925 7655 50  0001 C CNN
	1    925  7655
	0    1    -1   0   
$EndComp
$Comp
L Device:Fuse F1
U 1 1 5DB57AA9
P 9270 1020
F 0 "F1" H 9330 1066 50  0000 L CNN
F 1 "Fuse" H 9330 975 50  0000 L CNN
F 2 "IgniterCustom:FuseHolder" V 9200 1020 50  0001 C CNN
F 3 "~" H 9270 1020 50  0001 C CNN
	1    9270 1020
	1    0    0    -1  
$EndComp
Wire Wire Line
	9825 1325 9825 1305
Text GLabel 5215 1540 1    50   Input ~ 0
CLK
Text GLabel 6565 6290 2    50   Input ~ 0
CS
Text GLabel 5115 1540 1    50   Input ~ 0
DI
Text GLabel 5015 1540 1    50   Input ~ 0
DO
$Comp
L power:GNDREF #PWR02
U 1 1 5DB796A8
P 5485 1365
F 0 "#PWR02" H 5485 1115 50  0001 C CNN
F 1 "GNDREF" H 5490 1192 50  0001 C CNN
F 2 "" H 5485 1365 50  0001 C CNN
F 3 "" H 5485 1365 50  0001 C CNN
	1    5485 1365
	1    0    0    -1  
$EndComp
Wire Wire Line
	5415 1540 5415 1365
Wire Wire Line
	5415 1365 5485 1365
NoConn ~ 3965 4890
NoConn ~ 3965 5190
NoConn ~ 3965 5090
Wire Wire Line
	9750 1205 9825 1205
Text Notes 9110 1055 0    50   ~ 0
5A
$Comp
L Connector:Barrel_Jack J7
U 1 1 5DAB74DD
P 9035 4605
AR Path="/5DAB74DD" Ref="J7"  Part="1" 
AR Path="/5D9BEB88/5DAB74DD" Ref="J?"  Part="1" 
F 0 "J7" H 8805 4563 50  0000 R CNN
F 1 "IgnitionCoil" H 9250 4805 50  0000 R CNN
F 2 "Igniter:BananaJack15.5mm" H 9085 4565 50  0001 C CNN
F 3 "~" H 9085 4565 50  0001 C CNN
	1    9035 4605
	-1   0    0    1   
$EndComp
$Comp
L power:+24V #PWR01
U 1 1 5DBB64EE
P 9270 870
F 0 "#PWR01" H 9270 720 50  0001 C CNN
F 1 "+24V" H 9285 1043 50  0000 C CNN
F 2 "" H 9270 870 50  0001 C CNN
F 3 "" H 9270 870 50  0001 C CNN
	1    9270 870 
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR08
U 1 1 5DBB6589
P 2620 1000
F 0 "#PWR08" H 2620 850 50  0001 C CNN
F 1 "+24V" H 2635 1173 50  0000 C CNN
F 2 "" H 2620 1000 50  0001 C CNN
F 3 "" H 2620 1000 50  0001 C CNN
	1    2620 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR021
U 1 1 5DBB7502
P 8735 4445
F 0 "#PWR021" H 8735 4295 50  0001 C CNN
F 1 "+24V" H 8750 4618 50  0000 C CNN
F 2 "" H 8735 4445 50  0001 C CNN
F 3 "" H 8735 4445 50  0001 C CNN
	1    8735 4445
	1    0    0    -1  
$EndComp
Text Notes 1810 6055 0    50   ~ 0
Draw: 24mA
$Comp
L Switch:SW_SPST SW?
U 1 1 5DAB7506
P 9550 1205
AR Path="/5D9BEB88/5DAB7506" Ref="SW?"  Part="1" 
AR Path="/5DAB7506" Ref="SW1"  Part="1" 
F 0 "SW1" H 9550 980 50  0001 C CNN
F 1 "ARM" H 9550 1330 50  0000 C CNN
F 2 "" H 9550 1205 50  0001 C CNN
F 3 "~" H 9550 1205 50  0001 C CNN
	1    9550 1205
	-1   0    0    1   
$EndComp
Wire Wire Line
	9270 1205 9350 1205
Wire Wire Line
	9270 1205 9270 1170
Wire Notes Line
	8905 1450 10360 1450
Text Notes 595  7525 0    50   ~ 0
Board Corner Standoffs
Text Notes 11090 2090 0    118  ~ 0
-Make unused pins available from the top of shield
$Comp
L power:+3V3 #PWR04
U 1 1 5DC4F427
P 3770 5890
F 0 "#PWR04" H 3770 5740 50  0001 C CNN
F 1 "+3V3" H 3770 6030 50  0000 C CNN
F 2 "" H 3770 5890 50  0001 C CNN
F 3 "" H 3770 5890 50  0001 C CNN
	1    3770 5890
	1    0    0    -1  
$EndComp
Wire Wire Line
	3770 5890 3965 5890
$Sheet
S 1270 2295 505  480 
U 5DC64D13
F0 "SD" 50
F1 "SD.sch" 50
F2 "CLK" I L 1270 2390 50 
F3 "DI" I L 1270 2495 50 
F4 "CS" I L 1270 2600 50 
F5 "DO" I L 1270 2705 50 
$EndSheet
Text GLabel 1270 2705 0    50   Input ~ 0
DO
Text GLabel 1270 2495 0    50   Input ~ 0
DI
Text GLabel 1270 2390 0    50   Input ~ 0
CLK
Text GLabel 1270 2600 0    50   Input ~ 0
CS
Text Notes 11115 2840 0    118  ~ 0
Vcc 200mA max current draw for ATmega2560\n-Keep total current draw below this value\n-SD card powered by atmega 3V3 pin\n-Everything else powered by 5V regulator
Wire Wire Line
	8735 4705 8735 5240
Wire Wire Line
	8735 4505 8735 4445
Wire Wire Line
	8230 5440 8345 5440
Wire Notes Line
	7795 4175 9520 4175
Wire Notes Line
	7795 6350 9520 6350
Text Notes 1885 3390 0    50   ~ 0
5V regulator
$Comp
L power:GNDREF #PWR039
U 1 1 5DC68A67
P 2000 4185
F 0 "#PWR039" H 2000 3935 50  0001 C CNN
F 1 "GNDREF" H 2005 4012 50  0001 C CNN
F 2 "" H 2000 4185 50  0001 C CNN
F 3 "" H 2000 4185 50  0001 C CNN
	1    2000 4185
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR037
U 1 1 5DC68F41
P 2485 3785
F 0 "#PWR037" H 2485 3635 50  0001 C CNN
F 1 "+24V" H 2485 3930 50  0000 C CNN
F 2 "" H 2485 3785 50  0001 C CNN
F 3 "" H 2485 3785 50  0001 C CNN
	1    2485 3785
	1    0    0    -1  
$EndComp
NoConn ~ 1600 3785
$Comp
L power:+3V3 #PWR038
U 1 1 5DC6CB70
P 1460 3985
F 0 "#PWR038" H 1460 3835 50  0001 C CNN
F 1 "+3V3" H 1460 4125 50  0000 C CNN
F 2 "" H 1460 3985 50  0001 C CNN
F 3 "" H 1460 3985 50  0001 C CNN
	1    1460 3985
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5DC740D9
P 2695 3785
F 0 "C2" V 2466 3785 50  0000 C CNN
F 1 "2.2u" V 2557 3785 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2695 3785 50  0001 C CNN
F 3 "~" H 2695 3785 50  0001 C CNN
	1    2695 3785
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5DC7411D
P 2695 3985
F 0 "C1" V 2466 3985 50  0000 C CNN
F 1 "1u" V 2557 3985 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2695 3985 50  0001 C CNN
F 3 "~" H 2695 3985 50  0001 C CNN
	1    2695 3985
	0    1    -1   0   
$EndComp
$Comp
L power:GNDREF #PWR023
U 1 1 5DC76C01
P 2795 3985
F 0 "#PWR023" H 2795 3735 50  0001 C CNN
F 1 "GNDREF" H 2800 3812 50  0001 C CNN
F 2 "" H 2795 3985 50  0001 C CNN
F 3 "" H 2795 3985 50  0001 C CNN
	1    2795 3985
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5DAC3967
P 1965 995
F 0 "#PWR07" H 1965 845 50  0001 C CNN
F 1 "+5V" H 1980 1168 50  0000 C CNN
F 2 "" H 1965 995 50  0001 C CNN
F 3 "" H 1965 995 50  0001 C CNN
	1    1965 995 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR018
U 1 1 5DAC069D
P 2535 5590
F 0 "#PWR018" H 2535 5440 50  0001 C CNN
F 1 "+5V" H 2550 5763 50  0000 C CNN
F 2 "" H 2535 5590 50  0001 C CNN
F 3 "" H 2535 5590 50  0001 C CNN
	1    2535 5590
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 5DAC0A32
P 1730 5590
F 0 "#PWR017" H 1730 5440 50  0001 C CNN
F 1 "+5V" H 1745 5763 50  0000 C CNN
F 2 "" H 1730 5590 50  0001 C CNN
F 3 "" H 1730 5590 50  0001 C CNN
	1    1730 5590
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 5DAC0A8E
P 1715 4975
F 0 "#PWR014" H 1715 4825 50  0001 C CNN
F 1 "+5V" H 1730 5148 50  0000 C CNN
F 2 "" H 1715 4975 50  0001 C CNN
F 3 "" H 1715 4975 50  0001 C CNN
	1    1715 4975
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 5DAC0085
P 2510 4970
F 0 "#PWR013" H 2510 4820 50  0001 C CNN
F 1 "+5V" H 2525 5143 50  0000 C CNN
F 2 "" H 2510 4970 50  0001 C CNN
F 3 "" H 2510 4970 50  0001 C CNN
	1    2510 4970
	1    0    0    -1  
$EndComp
NoConn ~ 3965 5990
NoConn ~ 3965 6090
NoConn ~ 3965 6190
$Comp
L Device:R R?
U 1 1 5DC8131D
P 1405 1195
AR Path="/5D9BEB88/5DC8131D" Ref="R?"  Part="1" 
AR Path="/5DC8131D" Ref="R1"  Part="1" 
F 0 "R1" V 1198 1195 50  0001 C CNN
F 1 "200" V 1400 1195 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 1335 1195 50  0001 C CNN
F 3 "~" H 1405 1195 50  0001 C CNN
	1    1405 1195
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5DC81323
P 1405 1560
AR Path="/5D9BEB88/5DC81323" Ref="D?"  Part="1" 
AR Path="/5DC81323" Ref="D1"  Part="1" 
F 0 "D1" V 1443 1443 50  0000 R CNN
F 1 "3V3_GOOD" V 1352 1443 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 1405 1560 50  0001 C CNN
F 3 "~" H 1405 1560 50  0001 C CNN
	1    1405 1560
	0    1    -1   0   
$EndComp
Wire Wire Line
	1405 1045 1405 985 
Wire Wire Line
	1405 1345 1405 1410
$Comp
L power:GNDREF #PWR042
U 1 1 5DC8132B
P 1405 1710
F 0 "#PWR042" H 1405 1460 50  0001 C CNN
F 1 "GNDREF" H 1410 1537 50  0001 C CNN
F 2 "" H 1405 1710 50  0001 C CNN
F 3 "" H 1405 1710 50  0001 C CNN
	1    1405 1710
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR041
U 1 1 5DC81F51
P 1405 985
F 0 "#PWR041" H 1405 835 50  0001 C CNN
F 1 "+3V3" H 1405 1125 50  0000 C CNN
F 2 "" H 1405 985 50  0001 C CNN
F 3 "" H 1405 985 50  0001 C CNN
	1    1405 985 
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:MIC3490 U1
U 1 1 5DC7966B
P 2000 3885
F 0 "U1" H 2000 4252 50  0000 C CNN
F 1 "MIC3490" H 2000 4161 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 2050 4185 50  0001 C CNN
F 3 "" H 2050 4185 50  0001 C CNN
	1    2000 3885
	1    0    0    -1  
$EndComp
Wire Wire Line
	1460 3985 1600 3985
$Comp
L power:+5V #PWR036
U 1 1 5DC7A519
P 2485 3985
F 0 "#PWR036" H 2485 3835 50  0001 C CNN
F 1 "+5V" H 2485 4130 50  0000 C CNN
F 2 "" H 2485 3985 50  0001 C CNN
F 3 "" H 2485 3985 50  0001 C CNN
	1    2485 3985
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2400 3785 2485 3785
Wire Wire Line
	2485 3785 2595 3785
Connection ~ 2485 3785
Wire Wire Line
	2795 3785 2795 3985
Connection ~ 2795 3985
Wire Wire Line
	2400 3985 2485 3985
Wire Wire Line
	2485 3985 2595 3985
Connection ~ 2485 3985
Text Notes 11105 1860 0    118  ~ 0
-Board sits at test operator area
Text Notes 11110 1585 0    118  ~ 24
NOTES
$Comp
L Device:LED D?
U 1 1 5DC9159E
P 7450 2500
AR Path="/5DB4D508/5DC9159E" Ref="D?"  Part="1" 
AR Path="/5DC9159E" Ref="D4"  Part="1" 
F 0 "D4" H 7450 2415 50  0000 C CNN
F 1 "LED" H 7450 2600 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 7450 2500 50  0001 C CNN
F 3 "~" H 7450 2500 50  0001 C CNN
	1    7450 2500
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DC915A5
P 7640 2125
AR Path="/5DB4D508/5DC915A5" Ref="R?"  Part="1" 
AR Path="/5DC915A5" Ref="R2"  Part="1" 
F 0 "R2" V 7560 2125 50  0000 C CNN
F 1 "1k2" V 7640 2125 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 7570 2125 50  0001 C CNN
F 3 "~" H 7640 2125 50  0001 C CNN
	1    7640 2125
	0    -1   1    0   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5DC915AD
P 7450 2650
AR Path="/5DB4D508/5DC915AD" Ref="#PWR?"  Part="1" 
AR Path="/5DC915AD" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 7450 2400 50  0001 C CNN
F 1 "GNDREF" H 7455 2477 50  0001 C CNN
F 2 "" H 7450 2650 50  0001 C CNN
F 3 "" H 7450 2650 50  0001 C CNN
	1    7450 2650
	-1   0    0    -1  
$EndComp
Text Notes 8620 1675 0    39   ~ 0
Solenoid indicators
Wire Notes Line
	865  1935 865  725 
Wire Notes Line
	865  725  2890 725 
Wire Notes Line
	865  1935 2890 1935
Wire Notes Line
	1315 3415 1315 4320
Wire Notes Line
	1315 4320 2880 4320
Wire Notes Line
	2880 4320 2880 3415
Wire Notes Line
	2880 3415 1315 3415
Text GLabel 6565 1990 2    50   Input ~ 0
SOL1
Text GLabel 6565 2090 2    50   Input ~ 0
SOL2
Text GLabel 6565 2190 2    50   Input ~ 0
SOL3
Text GLabel 6565 2290 2    50   Input ~ 0
SOL4
Text GLabel 6565 2390 2    50   Input ~ 0
SOL5
Text GLabel 2570 2325 0    50   Input ~ 0
SOL1
Text GLabel 2570 2425 0    50   Input ~ 0
SOL2
Text GLabel 2570 2525 0    50   Input ~ 0
SOL3
Text GLabel 2570 2625 0    50   Input ~ 0
SOL4
Text GLabel 2570 2725 0    50   Input ~ 0
SOL5
Text GLabel 8030 2225 0    50   Input ~ 0
SOL1
Text GLabel 8030 2025 0    50   Input ~ 0
SOL2
$Comp
L Device:LED D?
U 1 1 5DCA1B5F
P 7725 2500
AR Path="/5DB4D508/5DCA1B5F" Ref="D?"  Part="1" 
AR Path="/5DCA1B5F" Ref="D11"  Part="1" 
F 0 "D11" H 7725 2415 50  0000 C CNN
F 1 "LED" H 7725 2600 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 7725 2500 50  0001 C CNN
F 3 "~" H 7725 2500 50  0001 C CNN
	1    7725 2500
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DCA1B65
P 7880 2325
AR Path="/5DB4D508/5DCA1B65" Ref="R?"  Part="1" 
AR Path="/5DCA1B65" Ref="R7"  Part="1" 
F 0 "R7" V 7800 2325 50  0000 C CNN
F 1 "1k2" V 7880 2325 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 7810 2325 50  0001 C CNN
F 3 "~" H 7880 2325 50  0001 C CNN
	1    7880 2325
	0    1    -1   0   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5DCA2C34
P 7725 2650
AR Path="/5DB4D508/5DCA2C34" Ref="#PWR?"  Part="1" 
AR Path="/5DCA2C34" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 7725 2400 50  0001 C CNN
F 1 "GNDREF" H 7730 2477 50  0001 C CNN
F 2 "" H 7725 2650 50  0001 C CNN
F 3 "" H 7725 2650 50  0001 C CNN
	1    7725 2650
	-1   0    0    -1  
$EndComp
$Comp
L power:+24V #PWR0103
U 1 1 5DCA7DD3
P 8720 2025
F 0 "#PWR0103" H 8720 1875 50  0001 C CNN
F 1 "+24V" H 8735 2198 50  0000 C CNN
F 2 "" H 8720 2025 50  0001 C CNN
F 3 "" H 8720 2025 50  0001 C CNN
	1    8720 2025
	1    0    0    -1  
$EndComp
Wire Wire Line
	8630 2025 8720 2025
$Comp
L Igniter-rescue:FDS8984 U2
U 1 1 5DC92E24
P 8330 2175
F 0 "U2" H 8330 2550 50  0000 C CNN
F 1 "FDS8984" H 8330 2459 50  0000 C CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 8330 2275 50  0001 C CNN
F 3 "" H 8330 2275 50  0001 C CNN
	1    8330 2175
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8630 2325 8630 2225
Wire Wire Line
	8630 2225 8630 2125
Connection ~ 8630 2225
Wire Wire Line
	8630 2125 8630 2025
Connection ~ 8630 2125
Connection ~ 8630 2025
$Comp
L Device:LED D?
U 1 1 5DC9967D
P 9220 2530
AR Path="/5DB4D508/5DC9967D" Ref="D?"  Part="1" 
AR Path="/5DC9967D" Ref="D13"  Part="1" 
F 0 "D13" H 9220 2445 50  0000 C CNN
F 1 "LED" H 9220 2630 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 9220 2530 50  0001 C CNN
F 3 "~" H 9220 2530 50  0001 C CNN
	1    9220 2530
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DC99683
P 9370 2345
AR Path="/5DB4D508/5DC99683" Ref="R?"  Part="1" 
AR Path="/5DC99683" Ref="R9"  Part="1" 
F 0 "R9" V 9290 2345 50  0000 C CNN
F 1 "1k2" V 9370 2345 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 9300 2345 50  0001 C CNN
F 3 "~" H 9370 2345 50  0001 C CNN
	1    9370 2345
	0    1    -1   0   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5DC9968A
P 9220 2680
AR Path="/5DB4D508/5DC9968A" Ref="#PWR?"  Part="1" 
AR Path="/5DC9968A" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 9220 2430 50  0001 C CNN
F 1 "GNDREF" H 9225 2507 50  0001 C CNN
F 2 "" H 9220 2680 50  0001 C CNN
F 3 "" H 9220 2680 50  0001 C CNN
	1    9220 2680
	-1   0    0    -1  
$EndComp
$Comp
L power:+24V #PWR0105
U 1 1 5DC996A8
P 10245 2245
F 0 "#PWR0105" H 10245 2095 50  0001 C CNN
F 1 "+24V" H 10260 2418 50  0000 C CNN
F 2 "" H 10245 2245 50  0001 C CNN
F 3 "" H 10245 2245 50  0001 C CNN
	1    10245 2245
	1    0    0    -1  
$EndComp
Wire Wire Line
	10120 2245 10245 2245
$Comp
L Igniter-rescue:FDS8984 U4
U 1 1 5DC996AF
P 9820 2195
F 0 "U4" H 9820 2570 50  0000 C CNN
F 1 "FDS8984" H 9820 2479 50  0000 C CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 9820 2295 50  0001 C CNN
F 3 "" H 9820 2295 50  0001 C CNN
	1    9820 2195
	-1   0    0    -1  
$EndComp
Text GLabel 9520 2245 0    50   Input ~ 0
SOL5
NoConn ~ 9520 2045
NoConn ~ 9520 2145
NoConn ~ 10120 2145
Wire Wire Line
	10120 2345 10120 2245
Connection ~ 10120 2245
NoConn ~ 10120 2045
Wire Wire Line
	9220 2380 9220 2345
Wire Wire Line
	7725 2350 7725 2325
Wire Wire Line
	7725 2325 7730 2325
Wire Wire Line
	7790 2125 8030 2125
Wire Wire Line
	7450 2350 7450 2125
Wire Wire Line
	7450 2125 7490 2125
$Comp
L Device:LED D?
U 1 1 5DCB8E69
P 7450 3370
AR Path="/5DB4D508/5DCB8E69" Ref="D?"  Part="1" 
AR Path="/5DCB8E69" Ref="D10"  Part="1" 
F 0 "D10" H 7450 3285 50  0000 C CNN
F 1 "LED" H 7450 3470 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 7450 3370 50  0001 C CNN
F 3 "~" H 7450 3370 50  0001 C CNN
	1    7450 3370
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DCB8E6F
P 7640 2995
AR Path="/5DB4D508/5DCB8E6F" Ref="R?"  Part="1" 
AR Path="/5DCB8E6F" Ref="R5"  Part="1" 
F 0 "R5" V 7560 2995 50  0000 C CNN
F 1 "1k2" V 7640 2995 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 7570 2995 50  0001 C CNN
F 3 "~" H 7640 2995 50  0001 C CNN
	1    7640 2995
	0    -1   1    0   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5DCB8E75
P 7450 3520
AR Path="/5DB4D508/5DCB8E75" Ref="#PWR?"  Part="1" 
AR Path="/5DCB8E75" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 7450 3270 50  0001 C CNN
F 1 "GNDREF" H 7455 3347 50  0001 C CNN
F 2 "" H 7450 3520 50  0001 C CNN
F 3 "" H 7450 3520 50  0001 C CNN
	1    7450 3520
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5DCB8E7D
P 7725 3370
AR Path="/5DB4D508/5DCB8E7D" Ref="D?"  Part="1" 
AR Path="/5DCB8E7D" Ref="D12"  Part="1" 
F 0 "D12" H 7725 3285 50  0000 C CNN
F 1 "LED" H 7725 3470 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 7725 3370 50  0001 C CNN
F 3 "~" H 7725 3370 50  0001 C CNN
	1    7725 3370
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DCB8E83
P 7880 3195
AR Path="/5DB4D508/5DCB8E83" Ref="R?"  Part="1" 
AR Path="/5DCB8E83" Ref="R8"  Part="1" 
F 0 "R8" V 7800 3195 50  0000 C CNN
F 1 "1k2" V 7880 3195 50  0000 C CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 7810 3195 50  0001 C CNN
F 3 "~" H 7880 3195 50  0001 C CNN
	1    7880 3195
	0    1    -1   0   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5DCB8E89
P 7725 3520
AR Path="/5DB4D508/5DCB8E89" Ref="#PWR?"  Part="1" 
AR Path="/5DCB8E89" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 7725 3270 50  0001 C CNN
F 1 "GNDREF" H 7730 3347 50  0001 C CNN
F 2 "" H 7725 3520 50  0001 C CNN
F 3 "" H 7725 3520 50  0001 C CNN
	1    7725 3520
	-1   0    0    -1  
$EndComp
$Comp
L power:+24V #PWR0108
U 1 1 5DCB8E8F
P 8720 2895
F 0 "#PWR0108" H 8720 2745 50  0001 C CNN
F 1 "+24V" H 8735 3068 50  0000 C CNN
F 2 "" H 8720 2895 50  0001 C CNN
F 3 "" H 8720 2895 50  0001 C CNN
	1    8720 2895
	1    0    0    -1  
$EndComp
Wire Wire Line
	8630 2895 8720 2895
$Comp
L Igniter-rescue:FDS8984 U3
U 1 1 5DCB8E96
P 8330 3045
F 0 "U3" H 8330 3420 50  0000 C CNN
F 1 "FDS8984" H 8330 3329 50  0000 C CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 8330 3145 50  0001 C CNN
F 3 "" H 8330 3145 50  0001 C CNN
	1    8330 3045
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7725 3220 7725 3195
Wire Wire Line
	7725 3195 7730 3195
Wire Wire Line
	7790 2995 8030 2995
Wire Wire Line
	7450 3220 7450 2995
Wire Wire Line
	7450 2995 7490 2995
Text GLabel 8030 3095 0    50   Input ~ 0
SOL3
Text GLabel 8030 2895 0    50   Input ~ 0
SOL4
Wire Notes Line
	7280 1730 7280 3665
Wire Notes Line
	7280 3665 10420 3665
Wire Notes Line
	10420 3665 10420 1730
Wire Notes Line
	10420 1730 7280 1730
$EndSCHEMATC
