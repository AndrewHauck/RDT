#include "Arduino.h"
#include "valves.h"


#define OPEN HIGH
#define CLOSE LOW

valves::valves()
{
	for(unsigned char i=0; i<6; i++){	//initialize all arrays to NULL
		states[i] = CLOSE;
		pins[i] = -1;
	}
}
valves::valves(int _pins[])
{
	for(unsigned char i=0; i<6; i++){	//initialize pin array and set states array to closed
		pins[i] = _pins[i];
		states[i] = CLOSE;
		// **DO THIS BEFORE SETTING OUTPUT MODE**
		digitalWrite(pins[i], CLOSE);	//set pin state
		pinMode(pins[i], OUTPUT);	//set pins as outputs
	}
}
void valves::setStates(bool _states[])
{
	for(unsigned char i=0; i<6; i++){
		states[i] = _states[i];
		digitalWrite(pins[i], states[i]);
	}
	return;
}
void valves::setSingle(bool _state, int _pin)
{
	states[_pin] = _state;
	digitalWrite(pins[_pin], states[_pin]);
	return;
}
void valves::toggleSingle(int _pin)
{
	states[_pin] = !states[_pin];
	digitalWrite(pins[_pin], states[_pin]);
	return;
}
void valves::setPins(int _pins[])
{
	for(unsigned char i=0; i<6; i++){
		digitalWrite(pins[i], CLOSE);	//Close the valve on the old pin
		//pinMode(pins[i], INPUT);
		pins[i] = _pins[i];	//Update pin
		// **DO THIS BEFORE SETTING OUTPUT MODE**
		digitalWrite(pins[i], CLOSE);	//Close the valve on the new pin
		pinMode(pins[i], OUTPUT);	//Set pin as output
		states[i] = CLOSE;	//Update valve state (closed by default)
	}
	return;
}
bool valves::getPinState(int _pin)
{
	return states[_pin];
}
void valves::transmit()
{
    packet.configure("", 'V');
	for(unsigned char i=0; i<6; i++)
		packet.append(states[i]+0x30);
	packet.transmit();
	return;
}