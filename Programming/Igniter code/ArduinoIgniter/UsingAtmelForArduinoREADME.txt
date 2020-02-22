From: https://medium.com/jungletronics/how-to-load-programs-to-an-arduino-uno-from-atmel-studio-7-83c8dd8d175d
This is a very small tutorial to get you started on Atmel Studio 7 as your IDE.
Let’s get started!
1) Download and install AtmelStudio 7 — link;
2) Download and install Arduino IDE version 1.8.2 or newer version, preferable on c:/ driver — link;
3) Open Arduino IDE and Example > Basic > Blink sketch;
4) Modify this sketch by add ‘const int led = 13;’ and change corresponding clause on loop();
5) Save as you wish in your project folder; I will go to named it as ‘_26_arduSerie_atmelStudio_00.ino’;
6) Now the real fun begins: Open your Atmel Studio 7 app — Connect your arduino on usb;
7) File > New > Project and hit ‘Create new project from Arduino sketch’;
8) Choose a ‘Name’ = studio_code, browse the file location of your project; this will create a folder ‘studio_code’ on your project;
9) Configure ‘Sketch File’= your file blink.ino location, Arduino IDE Path=your Arduino IDE, ‘Board’= Arduino/Genuino Uno, ‘Device’ = atmega328P and hit ‘Ok’;
10) This will install the necessary libraries of the arduino, mainly load the core.a, pins_arduino.h, all .h file, that is the base of the arduino configurations of the chosen platform, in this case Arduino Uno;
11) You will be presented with the code ready to hack as usual;
12) Build > Build solution and output will show:
    ‘Build succeeded.
    == Build: 2 succeeded or up-to-date, 0 failed, 0 skipped ===’ ;
13) Now lets get this code uploaded to your board: on Atmel Studio 7 hit ‘Tools’ > ‘External Tools’;
14) Configure it like this:
    Title: ’Send to Arduino UNO’
    Commands: click ‘…’ and navegate to your arduino installation: C:\arduino\hardware\tools\avr\bin\avrdude.exe and hit ‘open’;
    Arguments: For this you will need to load your sketch via Arduino IDE nomally using the ‘Preferences’ setting by choosing ‘Show verbose output during’: ‘upload’;
NOTE: Commands field needs avrdude.exe. See you can directly download avrdude program. Get the latest version here. This should work! I have not tested yet ;-)
15) Go to to Arduino IDE and in a normal compilation output you’ll see:
    Sketch uses 928 bytes (2%) of program storage space. Maximum is 32256 bytes.
    lobal variables use 9 bytes (0%) of dynamic memory, leaving 2039 bytes for local variables. Maximum is 2048 bytes.
    C:\arduino\hardware\tools\avr/bin/avrdude -CC:\arduino\hardware\tools\avr/etc/avrdude.conf -v -patmega328p -carduino -PCOM3 -b115200 -D -Uflash:w:C:\Users\giljr\AppData\Local\Temp\arduino_build_666279/_26_arduSerie_atmelStudio_00.ino.ino.hex:i 
    avrdude: Version 6.3, compiled on Jan 17 2017 at 12:00:53
     Copyright © 2000–2005 Brian Dean, http://www.bdmicro.com/
     Copyright © 2007–2014 Joerg Wunsch 
    System wide configuration file is C:\arduino\hardware\tools\avr/etc/avrdude.conf” Using Port : COM3
     Using Programmer : arduino
     Overriding Baud Rate : 115200
     AVR Part : ATmega328P(…)
Ovrdude is the program responsible for record your code on the chip. Is that program we need within atmel Studio 7;
16) Copy that piece of code to ‘Arguments’:
    -CC:\arduino\hardware\tools\avr/etc/avrdude.conf -v -patmega328p -carduino -PCOM3 -b115200 -D -Uflash:w:
17) Complete it with:
    "$(ProjectDir)Debug\$(TargetName).hex":i
so the result will be:
    -CC:\arduino\hardware\tools\avr/etc/avrdude.conf -v -patmega328p -carduino -PCOM3 -b115200 -D -Uflash:w:"$(ProjectDir)Debug\$(TargetName).hex":i
18) Select ‘Use Output window’ and hit ‘Ok’;
19) That´s all: now hit ‘Tools > Send to Arduino UNO’ and the code must be uploaded to your Arduino Uno and now onboard led must be blinking;
You’ll see on Output:
    avrdude.exe done. Thank you.
Thanks for the visit. check Jungletronics channel back often…
Note: (thanks Hayden NZ for his great esprit de corps for diy community):