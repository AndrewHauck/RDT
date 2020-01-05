import serial
from threading import Timer
import time
class Packet:
    def __init__(self, type, data):
        self.type = bytes(1)
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
            ser = serial.Serial(com, baudrate, timeout=2)
            print("Port " + str(com) + " is open!" + '\n')
            print("Sending")
            tmp = bytearray(str(self.type), 'ASCII')
            tmp = tmp + bytearray(str(self.dataSize), 'ASCII')
            tmp = tmp + bytearray(str('\n'), 'ASCII')
            while True:
                ser.write(tmp)
                inbuffer = ser.read()
                print(inbuffer)

            ser.write(tmp)
            while True:
                inbuffer = ser.read()
                print(inbuffer)









#            print("Port " + str(com) + " is open!" + '\n')
#            print("Establishing Handshake")
#            #out_of_time = False
#            #contactMade = False
#            #def time_ran_out():
#                #return False
#           #t=Timer(2,time_ran_out)
#           #t.start()
#           contactMade = False
#            while not contactMade:
#                ser.write(b'\x05') #send out enquiry
#               print("Enquiry Sent")
#               inbuffer = ser.read()
#               if inbuffer == b'\x05':  #if acknowledge is returned
#                   print("Handshake Successful! " + str(inbuffer))
#                    print("Transferring Data")
#                    #outbuffer = bytearray([0x01, 0x02, 0x03, 0x04, 0x05])
#                    #ser.write(b'\x01' + bytes(self.type) + bytes(self.dataSize) + b'\x00')
#                    ser.write(b'\x01')
#                    ser.write(bytearray(str(self.type), 'ASCII'))
#                    print("DATA SENT")
#
#                    while True:
#                        inbuffer = ser.read()
#                        print(inbuffer)
#


#
#                ser.write(bytearray(hex(self.type), 'utf-8')) #Send type of packet
#                print(bytearray(hex(self.type), 'utf-8'))
#                buffer = buffer + ser.read().decode('utf-8')
#                print(buffer)
#
#                ser.write(bytearray(hex(self.dataSize), 'utf-8')) #Send size of data to follow
#                print(bytearray(hex(self.dataSize), 'utf-8'))
#                buffer = buffer + ser.read().decode('utf-8')
#                print(buffer)
#
#                ser.write(bytearray('\2', 'utf-8')) #Notify start of data
#                print(bytearray('\2', 'utf-8'))
#                buffer = buffer + ser.read().decode('utf-8')
#                print(buffer)
#
#                for x in range(0, self.dataSize):   #Send data bytes
#                    ser.write(bytearray(self.data[x], 'utf-8'))
#
#                #ser.write(bytearray('Test', 'utf-8'))
#                ser.write(bytearray('\n', 'utf-8'))
#            else:
#                print("Contact not made!")
        except serial.serialutil.SerialException:
            print("The port is in use")

#ser = serial.Serial('COM3',9600,timeout=1)
fruits = ['orange', 'apple', 'pear', 'banana', 'kiwi', 'apple', 'banana']
a = Packet(3, fruits)
print(a)
a.transmit('COM3', 9600)
buffer = ""
#print(ser.name)
#buffer = ""