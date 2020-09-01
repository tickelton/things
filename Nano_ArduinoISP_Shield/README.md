ArduinoISP shield for the Arduino Nano
======================================

![Nano_ArduinoISP_Shield_01_thumb.jpg](https://gitlab.com/tickelton/things/raw/master/Nano_ArduinoISP_Shield/Nano_ArduinoISP_Shield_01_thumb.jpg)
![Nano_ArduinoISP_Shield_02_thumb.jpg](https://gitlab.com/tickelton/things/raw/master/Nano_ArduinoISP_Shield/Nano_ArduinoISP_Shield_02_thumb.jpg)

This is an ArduinoISP shield for the Arduino Nano.

It provides a standard 6-pin AVR ISP header so the Arduino Nano, in combination
with the ArduinoISP sketch and avrdude, can be used as an In System Programmer
to program other AVR microcontrollers.

The steps necessary to use an Arudino Nano as an AVR ISP are well documented,
e.g. at [1], and the necessary circuit can easily be set up on a breadboard.
Accordingly the shield proposed here essentially consists of only 6 wires, one
capacitor and 3 optional LEDs.

The reason why I nonetheless decided to create a ready to use shield instead of
setting up the circuit ad-hoc on a breadboard for every use is that when doing
so I constantly forgot to add the capacitor that disables a reset of the Nano.
Without this capacitor the Arduino resets itself every time it starts
sending data to the target controller which leads to hard to diagnose errors in
the programming tool and has led to hours of unnecessary debugging for me on
several occasions.

This shield is designed to be as foolproof as possible.
The LEDs are optional but very useful to diagnose errors during programming.
The 6-pin header as seen on the above images is oriented the same as the one on
the Nano itself and designed to obstruct the Nano's USB port if is placed onto
the shield incorrectly.

Once the Nano is placed onto the shield and the ArduinoISP sketch is loaded
the heartbeat LED will start pulsating to indicate correct operation.

The target circuit can the be programmed with avrdude using a command similar
to the following:

$ avrdude -v -p attiny85 -b 19200 -c arduino -P /dev/ttyUSB0 -U flash:w:main.hex


As a side note:
The target board shown in the pictures is a clone of a Sparkfun AVR Stick[2]
used as a prototyping platform for V-USB[3] applications. A repository
with several demo applications for it can be found at [4].

------------------------------------------------------------------------------

[1] https://learn.adafruit.com/arduino-tips-tricks-and-techniques/arduinoisp
[2] https://www.sparkfun.com/products/retired/9147
[3] https://www.obdev.at/products/vusb/index.html
[4] https://gitlab.com/tickelton/avr_stick_apps
