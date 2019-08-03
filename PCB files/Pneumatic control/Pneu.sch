EESchema Schematic File Version 4
LIBS:PneuRev1-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L Device:R R?
U 1 1 5D4740F6
P 3125 2965
AR Path="/5D4740F6" Ref="R?"  Part="1" 
AR Path="/5D4633D3/5D4740F6" Ref="R?"  Part="1" 
F 0 "R?" V 3205 2965 50  0000 C CNN
F 1 "1k" V 3125 2965 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3055 2965 50  0001 C CNN
F 3 "" H 3125 2965 50  0001 C CNN
	1    3125 2965
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4740FC
P 3125 3115
AR Path="/5D4740FC" Ref="#PWR?"  Part="1" 
AR Path="/5D4633D3/5D4740FC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3125 2865 50  0001 C CNN
F 1 "GND" H 3125 2965 50  0000 C CNN
F 2 "" H 3125 3115 50  0001 C CNN
F 3 "" H 3125 3115 50  0001 C CNN
	1    3125 3115
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5D474102
P 3375 3715
AR Path="/5D474102" Ref="R?"  Part="1" 
AR Path="/5D4633D3/5D474102" Ref="R?"  Part="1" 
F 0 "R?" V 3455 3715 50  0000 C CNN
F 1 "1k" V 3375 3715 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3305 3715 50  0001 C CNN
F 3 "" H 3375 3715 50  0001 C CNN
	1    3375 3715
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5D474108
P 3775 3490
AR Path="/5D474108" Ref="R?"  Part="1" 
AR Path="/5D4633D3/5D474108" Ref="R?"  Part="1" 
F 0 "R?" V 3855 3490 50  0000 C CNN
F 1 "4k" V 3775 3490 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 3705 3490 50  0001 C CNN
F 3 "" H 3775 3490 50  0001 C CNN
	1    3775 3490
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D47410E
P 3725 3240
AR Path="/5D47410E" Ref="#PWR?"  Part="1" 
AR Path="/5D4633D3/5D47410E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3725 2990 50  0001 C CNN
F 1 "GND" H 3725 3090 50  0000 C CNN
F 2 "" H 3725 3240 50  0001 C CNN
F 3 "" H 3725 3240 50  0001 C CNN
	1    3725 3240
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D474114
P 3375 3940
AR Path="/5D474114" Ref="#PWR?"  Part="1" 
AR Path="/5D4633D3/5D474114" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3375 3690 50  0001 C CNN
F 1 "GND" H 3375 3790 50  0000 C CNN
F 2 "" H 3375 3940 50  0001 C CNN
F 3 "" H 3375 3940 50  0001 C CNN
	1    3375 3940
	1    0    0    -1  
$EndComp
Text Label 4500 2915 2    60   ~ 0
PNU3
Text Label 2725 2815 0    60   ~ 0
IN3
Wire Wire Line
	3375 3015 3375 3490
Wire Wire Line
	3375 3015 3525 3015
Wire Wire Line
	3375 3490 3625 3490
Connection ~ 3375 3490
Wire Wire Line
	4275 3490 3925 3490
Wire Wire Line
	4275 2915 4275 3490
Wire Wire Line
	3725 3215 3725 3240
Wire Wire Line
	4125 2915 4275 2915
Wire Wire Line
	2725 2815 3125 2815
Wire Wire Line
	3375 3940 3375 3865
Connection ~ 4275 2915
Connection ~ 3125 2815
Wire Wire Line
	4075 2065 4075 2490
Wire Wire Line
	4075 2490 3725 2490
Wire Wire Line
	3725 2490 3725 2615
NoConn ~ 3825 2615
NoConn ~ 3825 3215
NoConn ~ 3925 3215
$Comp
L power:GND #PWR?
U 1 1 5D47413B
P 4325 2415
AR Path="/5D47413B" Ref="#PWR?"  Part="1" 
AR Path="/5D4633D3/5D47413B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4325 2165 50  0001 C CNN
F 1 "GND" H 4325 2265 50  0000 C CNN
F 2 "" H 4325 2415 50  0001 C CNN
F 3 "" H 4325 2415 50  0001 C CNN
	1    4325 2415
	1    0    0    -1  
$EndComp
Wire Wire Line
	4325 2415 4325 2365
Wire Wire Line
	4325 2065 4075 2065
$Comp
L Device:C C?
U 1 1 5D474144
P 4325 2215
AR Path="/5D474144" Ref="C?"  Part="1" 
AR Path="/5D4633D3/5D474144" Ref="C?"  Part="1" 
F 0 "C?" H 4350 2315 50  0000 L CNN
F 1 "1uF" H 4350 2115 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 4363 2065 50  0001 C CNN
F 3 "" H 4325 2215 50  0001 C CNN
	1    4325 2215
	-1   0    0    1   
$EndComp
Wire Wire Line
	3375 3490 3375 3565
Wire Wire Line
	4275 2915 4500 2915
Wire Wire Line
	3125 2815 3525 2815
$Comp
L PneuRev1-rescue:OPA551 U?
U 1 1 5D47412E
P 3825 2915
AR Path="/5D47412E" Ref="U?"  Part="1" 
AR Path="/5D4633D3/5D47412E" Ref="U?"  Part="1" 
F 0 "U?" H 3975 3065 50  0000 L CNN
F 1 "OPA551" H 3975 2765 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 3825 2915 50  0001 C CNN
F 3 "" H 3825 2915 50  0001 C CNN
	1    3825 2915
	1    0    0    -1  
$EndComp
Text HLabel 2725 2815 0    50   Input ~ 0
IN3
Text HLabel 4500 2915 2    50   Input ~ 0
PNU3
$EndSCHEMATC
