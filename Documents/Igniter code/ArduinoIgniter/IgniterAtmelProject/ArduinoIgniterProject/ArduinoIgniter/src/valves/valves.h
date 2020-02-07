#ifndef valves_h
#define valves_h

#include "Arduino.h"
#include "../serialPacket/serialPacket.h"

class valves
{
	public:
		valves(int _pins[]);	//Constructor, sets pins, defaults all valves closed
		
		
		void setStates(bool _states[]);
		void setSingle(bool _state, int _pin);
		void toggleSingle(int _pin);
		void setPins(int _pins[]);
		
		bool getPinState(int _pin);
		void transmit();
		
		// **PLEASE DON'T DECIDE TO USE THESE UNLESS YOU KNOW WHAT YOU'RE DOING**
		//valves(bool _states[], int _pins[]);	//Constructor, sets pins and valve states
		//void updatePins(bool _states[], int _pins[]);
		valves();	//Default Constructor 		
	private:
		int pins[6];
		bool states[6];
		serialPacket packet;
};


#endif