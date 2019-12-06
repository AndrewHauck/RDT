import serial
from threading import Timer
class Packet:
    def __init__(self, type, data):
        self.type = type
        self.seperator = ', '
        if data is None:
            self.data = []
        else:
            self.data = data
        self.dataSize = len(self.data)
    def __str__(self):  #print packet to console
        self.temp = "Packet Type: " + str(self.type) + '\n' + "Data Size: " + str(self.dataSize) + '\n' + "Data: " + self.seperator.join(self.data)
        return(self.temp)
    def setType(self, type):
        self.type = type
    def setData(self, data):
        self.data = data
        self.dataSize = len(self.data)
    def transmit(self, com, baudrate):
        try:
            ser = serial.Serial(com, baudrate, timeout=1)
            print("Port " + str(com) + " is open!" + '\n')
            print("Establishing Handshake")
            out_of_time = False
            contactMade = False
            def time_ran_out():
                out_of_time = True
            t=Timer(2,time_ran_out)
            t.start()
            while not out_of_time:
                ser.write(bytearray('\5', 'utf-8')) #send out enquiry
                buffer = ser.read().decode('utf-8')
                if '\6' in buffer:  #if acknowledge is returned
                    contactMade = True
                    break
            if(contactMade):
                print("Handshake Successful!")
                print("Transferring Data")
                ser.write(bytearray('\1', 'utf-8')) #Notify start of packet
                ser.write(bytearray(self.type, 'utf-8')) #Send type of packet
                ser.write(bytearray(self.dataSize, 'utf-8')) #Send size of data to follow
                ser.write(bytearray('\2', 'utf-8')) #Notify start of data
                for x in range(0, self.dataSize):   #Send data bytes
                    ser.write(bytearray(self.data[x], 'utf-8'))

                #ser.write(bytearray('Test', 'utf-8'))
                ser.write(bytearray('\n', 'utf-8'))
            else:
                print("Contact not made!")
        except serial.serialutil.SerialException:
            print("The port is in use")

#ser = serial.Serial('COM3',9600,timeout=1)
fruits = ['orange', 'apple', 'pear', 'banana', 'kiwi', 'apple', 'banana']
a = Packet(3, fruits)
print(a)
dogs = ['big', 'small']
a.setType(2)
a.setData(dogs)
print(a)
a.transmit('COM3', 9600)
buffer = ""
#print(ser.name)
#buffer = ""