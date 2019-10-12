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
$Sheet
S 4055 4430 1275 1455
U 5D9BEB88
F0 "Igniter" 50
F1 "IgniterDriver.sch" 50
F2 "Vin" I L 4055 4600 50 
$EndSheet
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 5D9DC3E6
P 5080 3275
F 0 "J1" H 4972 2950 50  0000 C CNN
F 1 "PT1" H 4972 3041 50  0000 C CNN
F 2 "" H 5080 3275 50  0001 C CNN
F 3 "~" H 5080 3275 50  0001 C CNN
	1    5080 3275
	-1   0    0    1   
$EndComp
Text Notes 4915 3205 0    50   ~ 0
Vin
Text Notes 4915 3305 0    50   ~ 0
Vo
Text Notes 4870 3410 0    50   ~ 0
GND
$Comp
L MCU_Module:Arduino_UNO_R2 A1
U 1 1 5DA12355
P 7280 4010
F 0 "A1" H 7280 5191 50  0000 C CNN
F 1 "Arduino_UNO_R2" H 7280 5100 50  0000 C CNN
F 2 "Module:Arduino_UNO_R2" H 7430 2960 50  0001 L CNN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 7080 5060 50  0001 C CNN
	1    7280 4010
	1    0    0    -1  
$EndComp
$EndSCHEMATC
