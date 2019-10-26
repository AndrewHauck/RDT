import serial
from tkinter import *
from tkinter import ttk

ser = serial.Serial('/dev/ttyACM0')
print(ser.name)

for y in range(20):
	byte = ser.read()
	print(byte)

#function that runs when you click a button
def calculate(*args):
    try:
        value = float(feet.get())
        meters.set((0.3048 * value * 10000.0 + 0.5)/10000.0)
    except ValueError:
        pass

#Code below creates window/buttons/text/etc
root = Tk()
root.title("LRDT Igniter Control")

mainframe = ttk.Frame(root, padding="3 3 12 12")
mainframe.grid(column=0, row=0, sticky=(N, W, E, S))
root.columnconfigure(0, weight=1)
root.rowconfigure(0, weight=1)

feet = StringVar()
meters = StringVar()

#feet_entry = ttk.Entry(mainframe, width=7, textvariable=feet)
#feet_entry.grid(column=2, row=1, sticky=(W, E))

ttk.Label(mainframe, text=byte).grid(column=2, row=2, sticky=(W, E))
ttk.Button(mainframe, text="Open Valve 1", command=calculate).grid(column=1, row=4, sticky=W)
ttk.Button(mainframe, text="Close Valve 1", command=calculate).grid(column=2, row=4, sticky=W)

ttk.Label(mainframe, text="Pressure 1:").grid(column=1, row=1, sticky=W)
ttk.Label(mainframe, text="Pressure 2:").grid(column=1, row=2, sticky=E)
ttk.Label(mainframe, text="Pressure 3:").grid(column=1, row=3, sticky=W)

for child in mainframe.winfo_children(): child.grid_configure(padx=5, pady=5)

#feet_entry.focus()
root.bind('<Return>', calculate)
root.mainloop()

ser.close()