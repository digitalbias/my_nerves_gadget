include .env
export $(shell sed 's/=.*//' .env)

default: build

build:
	cd firmware; mix deps.get; mix firmware

burn: build
	cd firmware; mix firmware.burn

push:
	cd firmware; mix firmware.push ${NETWORK_IP}

clean:
	cd firmware; rm -Rf _build	

rebuild: clean build

screen:
	screen /dev/tty.SLAB_USBtoUART 115200