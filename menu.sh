#!/bin/bash

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
	echo "Select Action"
	echo " "
	echo "1) Open"
	echo "2) Close"
	echo "3) Open, Light Off"
	echo "4) Close, Light On"
	echo "q) Exit"
	echo " "


}

while true; do
	printmenu
	read -p "Enter: " choice

	case $choice in
		1)
			echo "1001" > /dev/ttyUSB1
			;;
		2)

			echo "1000" > /dev/ttyUSB1
			;;
		3)
			echo "9999" > /dev/ttyUSB1 && echo "1001" > /dev/ttyUSB1 
			;;
		4)
			echo "1000" > /dev/ttyUSB1 && echo "255" > /dev/ttyUSB1
			;;
		q)
			exit
			;;
		*)
			echo "Invalid Option"
			;;
	esac

	echo " "
done
