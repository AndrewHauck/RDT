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
$Descr A4 11693 8268
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
L OPA2376xxD U1
U 1 1 5C0776E8
P 5250 3825
F 0 "U1" H 5250 4025 50  0000 L CNN
F 1 "OPA2376xxD" H 5250 3625 50  0000 L CNN
F 2 "" H 5250 3825 50  0001 C CNN
F 3 "" H 5250 3825 50  0001 C CNN
	1    5250 3825
	1    0    0    -1  
$EndComp
$Comp
L OPA2376xxD U1
U 2 1 5C077740
P 6450 3825
F 0 "U1" H 6450 4025 50  0000 L CNN
F 1 "OPA2376xxD" H 6450 3625 50  0000 L CNN
F 2 "" H 6450 3825 50  0001 C CNN
F 3 "" H 6450 3825 50  0001 C CNN
	2    6450 3825
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5C077932
P 5150 4125
F 0 "#PWR01" H 5150 3875 50  0001 C CNN
F 1 "GND" H 5150 3975 50  0000 C CNN
F 2 "" H 5150 4125 50  0001 C CNN
F 3 "" H 5150 4125 50  0001 C CNN
	1    5150 4125
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5C07794A
P 6350 4125
F 0 "#PWR02" H 6350 3875 50  0001 C CNN
F 1 "GND" H 6350 3975 50  0000 C CNN
F 2 "" H 6350 4125 50  0001 C CNN
F 3 "" H 6350 4125 50  0001 C CNN
	1    6350 4125
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3925 6150 4350
Wire Wire Line
	6150 4350 6750 4350
Wire Wire Line
	6750 4350 6750 3825
Wire Wire Line
	5550 3825 5825 3825
Wire Wire Line
	5825 3825 5825 3725
Wire Wire Line
	5825 3725 6150 3725
$EndSCHEMATC
