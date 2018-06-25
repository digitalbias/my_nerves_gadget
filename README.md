# My Nerves Gadget

This is based on the Hello Phoenix project from the [nerves_examples](https://github.com/nerves-project/nerves_examples). My goal is to have a web interface that I can use to configure some strip LED lights. There is a Makefile in the project to make things easier to build (so I don't have to remember all the commands and their syntax).

## Getting Started

1. Rename and then edit the ```.env```. Put your network configuration information in there as well as what target you intend to deploy to.
2. ```make; make burn``` will build and then burn the image to an SD card. After that, and changes you want to make can be pushed to the device with ```make push```
3. I have a strip of 20 NeoPixels (WS2812). You will want to connect them similarly to [this post](https://tutorials-raspberrypi.com/connect-control-raspberry-pi-ws2812-rgb-led-strips/).
4. Start up the Pi and watch the LEDs change.

## Problems

LEDS: They don't light up right now...which is the part I'm working on. That's first. Then I'll figure out the next problem, which is...

Phoenix: For some reason there is a conflict when phoenix and the led project are both included in the firmware project. Phoenix has a problem booting up and I need to debug that.
