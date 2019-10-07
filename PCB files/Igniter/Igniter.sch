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
L Connector_Generic:Conn_02x10_Counter_Clockwise J?
U 1 1 5D9ADB7C
P 3195 2185
F 0 "J?" H 3245 2802 50  0000 C CNN
F 1 "Conn_02x10_Counter_Clockwise" H 3245 2711 50  0000 C CNN
F 2 "" H 3195 2185 50  0001 C CNN
F 3 "~" H 3195 2185 50  0001 C CNN
	1    3195 2185
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J?
U 1 1 5D9AE2A8
P 3235 5600
F 0 "J?" H 3285 6217 50  0000 C CNN
F 1 "Conn_02x10_Counter_Clockwise" H 3285 6126 50  0000 C CNN
F 2 "" H 3235 5600 50  0001 C CNN
F 3 "~" H 3235 5600 50  0001 C CNN
	1    3235 5600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J?
U 1 1 5D9AFF6C
P 6870 5545
F 0 "J?" H 6920 6162 50  0000 C CNN
F 1 "Conn_02x10_Counter_Clockwise" H 6920 6071 50  0000 C CNN
F 2 "" H 6870 5545 50  0001 C CNN
F 3 "~" H 6870 5545 50  0001 C CNN
	1    6870 5545
	1    0    0    -1  
$EndComp
$Sheet
S 4505 3105 1275 1455
U 5D9BEB88
F0 "Sheet5D9BEB87" 50
F1 "IgniterDriver.sch" 50
F2 "Vin" I L 4505 3275 50 
$EndSheet
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J?
U 1 1 5D9AF146
P 6970 2185
F 0 "J?" H 7020 2802 50  0000 C CNN
F 1 "Conn_02x10_Counter_Clockwise" H 7020 2711 50  0000 C CNN
F 2 "" H 6970 2185 50  0001 C CNN
F 3 "~" H 6970 2185 50  0001 C CNN
	1    6970 2185
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 5D9DC3E6
P 1695 2065
F 0 "J?" H 1587 1740 50  0000 C CNN
F 1 "PT1" H 1587 1831 50  0000 C CNN
F 2 "" H 1695 2065 50  0001 C CNN
F 3 "~" H 1695 2065 50  0001 C CNN
	1    1695 2065
	-1   0    0    1   
$EndComp
Text Notes 1530 1995 0    50   ~ 0
Vin
Text Notes 1530 2095 0    50   ~ 0
Vo
Text Notes 1485 2200 0    50   ~ 0
GND
$EndSCHEMATC
