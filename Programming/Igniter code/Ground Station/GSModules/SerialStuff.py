import serial
import serial.tools.list_ports
class SerialBuffer:
    def __init__(self):
        self.ser = serial.Serial(None)  # Create serial port object
        self.buffer = ""
        self.dataString = ""
    def getData(self):
        return self.dataString
    def is_open(self):
        return self.ser.is_open
    def updateBuffer(self):
        while ser.in_waiting:
            inChar = ser.read().decode('ASCII')
            self.buffer = self.buffer + inChar
            if (inChar == chr(6)):
                self.buffer = ""
                window.FindElement('COM_Enquire').update(button_color=('White', 'Green'))
            if (inChar == chr(4)):
                if (buffer.find(chr(1)) >= 0):
                    buffer = buffer[buffer.find(chr(1)):(
                                buffer.find(chr(4)) + 1)]  # Trim off excess characters before and after packet
                    packet_type = buffer[1]

                    upperNibble: int = ord(buffer[2])
                    lowerNibble: int = ord(buffer[3])
                    # UPPER NIBBLE
                    if (upperNibble > 0x40):  # if a letter
                        upperNibble = upperNibble & 0b00001111  # strip off upper nibble(only indicates that value is a letter)
                        upperNibble = upperNibble + 0b00001001  # upperNibble now equals 0x0A - 0x0F
                    else:
                        upperNibble = upperNibble & 0b00001111  # upperNibble now equals 0x00 - 0x09
                    upperNibble = upperNibble << 4  # upperNibble now represents upper byte of dataBytes
                    # LOWER NIBBLE
                    if (lowerNibble > 0x40):  # if letter
                        lowerNibble = lowerNibble & 0b00001111  # strip off upper nibble
                        lowerNibble = lowerNibble + 0b00001001  # lowerNibble now equals 0x0A - 0x0F
                    lowerNibble = lowerNibble & 0b00001111  # lowerNibble now equals 0x00 - 0x09 if it was a number

                    packet_dataSize = upperNibble | lowerNibble  # combining upper and lower bytes to make final char(UUUU LLLL)
                    dataString = buffer[5:-1]  # sets data string of packet to data pulled from _inputString
                    buffer = ""  # Clear buffer

                    # ***  UPDATE PRESSURE READINGS ***
                    # ***  CAN WE CHECK THESE CALCULATIONS???
                    # ***  5V ON PIN = 28 PSI???
                    if (packet_type == 'D'):
                        pdata1 = dataString[dataString.find('A') + 1:dataString.find('B')]
                        pdata1 = int(pdata1) * (5.0 / 1023.0) * (14000.0 / 2500.0)
                        window.Element('P1').Update(round(pdata1, 2))

                        pdata2 = dataString[dataString.find('B') + 1:dataString.find('C')]
                        pdata2 = int(pdata2) * (5.0 / 1023.0) * (14000.0 / 2500.0)
                        window.Element('P2').Update(round(pdata2, 2))

                        pdata3 = dataString[dataString.find('C') + 1:dataString.find('D')]
                        pdata3 = int(pdata3) * (5.0 / 1023.0) * (14000.0 / 2500.0)
                        window.Element('P3').Update(round(pdata3, 2))

                        pdata4 = dataString[dataString.find('D') + 1:]
                        pdata4 = int(pdata4) * (5.0 / 1023.0) * (14000.0 / 2500.0)
                        window.Element('P4').Update(round(pdata4, 2))
                    if (packet_type == 'M'):
                        if (dataString == "IGNITER ARMED"):
                            window.Element('ARM').Update(button_color=('White', 'Green'))
                            window.Element('FIRE').Update(button_color=('White', 'Red'))
                            window.Element('PURGE').Update(button_color=('White', 'Red'))
                            window.Element('CLOSE ALL').Update(button_color=('White', 'Red'))
                        if (dataString == "IGNITER FIRING"):
                            window.Element('ARM').Update(button_color=('White', 'Red'))
                            window.Element('FIRE').Update(button_color=('White', 'Green'))
                            window.Element('PURGE').Update(button_color=('White', 'Red'))
                            window.Element('CLOSE ALL').Update(button_color=('White', 'Red'))
                        if (dataString == "IGNITER PURGING"):
                            window.Element('ARM').Update(button_color=('White', 'Red'))
                            window.Element('FIRE').Update(button_color=('White', 'Red'))
                            window.Element('PURGE').Update(button_color=('White', 'Green'))
                            window.Element('CLOSE ALL').Update(button_color=('White', 'Red'))
                        if (dataString == "IGNITER CLOSING"):
                            window.Element('ARM').Update(button_color=('White', 'Red'))
                            window.Element('FIRE').Update(button_color=('White', 'Red'))
                            window.Element('PURGE').Update(button_color=('White', 'Red'))
                            window.Element('CLOSE ALL').Update(button_color=('White', 'Green'))
                        print(dataString)
                        # window.FindElement('COM_Display').Update(dataString)
                else:
                    buffer = ""  # If only 1 end of packet is found, data somehow corrupted, clear buffer