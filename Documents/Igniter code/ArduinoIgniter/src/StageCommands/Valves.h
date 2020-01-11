#ifndef Valves_h
#define Valves_h

#include "Arduino.h"

class Valves
{
	public:
		Valves();
		updateStates(bool pin[]);
	private:
		const int pins[6];
		bool states[6];
		
}


#endif