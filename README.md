# My Nerves Gadget

This is based on the Hello Phoenix project from the [nerves_examples](https://github.com/nerves-project/nerves_examples). My goal is to have a web interface that I can use to configure some strip LED lights. There is a Makefile in the project to make things easier to build (so I don't have to remember all the commands and their syntax).

## Getting Started

1. Rename and then edit the ```.env```. Put your network configuration information in there as well as what target you intend to deploy to.
2. ```make; make burn``` will build and then burn the image to an SD card. After that, and changes you want to make can be pushed to the device with ```make push```
3. I have a strip of 20 NeoPixels (WS2812). You will want to connect them similarly to [this post](https://tutorials-raspberrypi.com/connect-control-raspberry-pi-ws2812-rgb-led-strips/).
4. Start up the Pi and watch the LEDs change.


## How To

### Circuit setup



### Debugging

I've found the best way to debug is via a USB to UART connection. I purchased two connectors off of Amazon. The connected the TXD and RXD pins to the PI. I connected TXD from the USB connector to pin 10 (GPIO 15) and the RXD from the USB to pin 8 (GPIO 14). 

The to see what is going on I ran `screen /dev/tty.SLAB_USBtoUART 24000` on my mac and it connected. It feels a bit 1980ish, but `screen /dev/tty.SLAB_USBtoUART 115200` caused problems.

From there I could see when there were issues. Some useful commands to run on the commandline were:

`Application.started_applications` 

and

`RingLogger.tail`

Both of those commands from IEx helped narrow down what was causing problems and let me know what possible solutions were.