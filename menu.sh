#!/bin/bash

TTYUSB=$(dmesg | grep ch341 | grep now | awk '{print $NF}')
if [[ -n "$TTYUSB" ]]; then 
	TTYUSB="/dev/${TTYUSB}"
	echo "TTYUSB: ${TTYUSB}"
else
	echo "Something is wrong..."
	exit 1
fi

printmenu() {
	echo "__        __              _                     _        _             "
	echo "\ \      / /_ _ _ __   __| | ___ _ __ ___ _ __ / \   ___| |_ _ __ ___  "
	echo " \ \ /\ / / _  |  _ \ / _  |/ _ \  __/ _ \  __/ _ \ / __| __|  __/ _ \ "
	echo "  \ V  V / (_| | | | | (_| |  __/ | |  __/ | / ___ \\__ \ |_| | | (_) |"
	echo "  _\_/\_/ \__,_|_| |_|\__,_|\___|_|  \___|_|/_/   \_\___/\__|_|  \___/ "
	echo " / ___|_____   _____ _ __   / _ \ _ __   ___ _ __ __ _| |_ ___  _ __   "
	echo "| |   / _ \ \ / / _ \  __| | | | |  _ \ / _ \  __/ _  | __/ _ \|  __|  "
	echo "| |__| (_) \ V /  __/ |    | |_| | |_) |  __/ | | (_| | || (_) | |     "
	echo " \____\___/ \_/ \___|_|     \___/| .__/ \___|_|  \__,_|\__\___/|_|     "
	echo "                                 |_|                                   "
	echo " "
	echo "WandererAstro Cover Operator"
	echo " "
	echo "Looks like Wanderer is on ${TTYUSB}"
	echo " "
	echo "Select Action"
	echo " "
	echo "1) Open"
	echo "2) Close"
	echo "3) Open, Light Off"
	echo "4) Close, Light On"
	echo "5) Light Off"
	echo "6) Light On - 255"
	echo "7) Light On - 128"
	echo "8) Light On - 96"
	echo "9) Light On - 64"
	echo "q) Exit"
	echo " "


}
#configure serial port, assuming /dev/ttyUSB1
stty -F ${TTYUSB} 19200 cs8 -cstopb -parenb crtscts
#stty -F /dev/ttyUSB1 19200 cs8 -cstopb -parenb
#stty -F /dev/ttyUSB1 crtscts

#screen /dev/ttyUSB1 19200
#socat -d -d /dev/ttyUSB1,raw,echo=0,b19200,cs8,crtscts -
#minicom -D ${TTYUSB} -b 19200 -C /dev/null -o <<EOF
#!exit
#EOF

#run menu loop until exit
while true; do
	printmenu
	read -p "Enter: " choice

	case $choice in
		1)
			echo "1001" > ${TTYUSB}
			;;
		2)
			echo "1000" > ${TTYUSB}
			;;
		3)
			echo "9999" > ${TTYUSB} && echo "1001" > ${TTYUSB} 
			;;
		4)
			echo "1000" > ${TTYUSB} && echo "255" > ${TTYUSB}
			;;
		5)
			echo "9999" > ${TTYUSB}
			;;
		6)
			echo "255" > ${TTYUSB}
			;;
		7)
			echo "128" > ${TTYUSB}
			;;
		8)
			echo "96" > ${TTYUSB}
			;;
		9)
			echo "64" > ${TTYUSB}
			;;
		q)
			pkill minicom
			exit
			;;
		*)
			echo "Invalid Option"
			;;
	esac

	echo " "
done
