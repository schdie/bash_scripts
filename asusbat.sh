#!/bin/bash
#limit asus battery charging threshold

# Set the default charge threshold to 60%
CHARGE_THRESHOLD=60

# Determine the battery name
BATTERY_NAME=$(ls /sys/class/power_supply | grep "BAT")
if [ -z "$BATTERY_NAME" ]; then
	echo "Error: Battery name not found. Exiting."
	exit 1
else
	CURRENT_THRESHOLD=$(cat /sys/class/power_supply/$BATTERY_NAME/charge_control_end_threshold)
fi

# if no threshold is found we set it, otherwise we remove it
if [ $CURRENT_THRESHOLD = 100 ]; then
	echo -e "\033[1mSetting threshold...\033[0m"
	echo "Battery name: $BATTERY_NAME"
	echo -n "Current threshold: " & cat /sys/class/power_supply/$BATTERY_NAME/charge_control_end_threshold
	echo "Setting threshold to $CHARGE_THRESHOLD%"
	echo $CHARGE_THRESHOLD | sudo tee /sys/class/power_supply/$BATTERY_NAME/charge_control_end_threshold > /dev/null

	sleep 1
	echo -ne "Battery status: \033[1m" & cat /sys/class/power_supply/$BATTERY_NAME/status
	echo -ne "\033[0mCurrent threshold: \033[1m" & cat /sys/class/power_supply/$BATTERY_NAME/charge_control_end_threshold
	echo -ne "\033[0m"
else
	echo -e "\033[1mRemoving threshold...\033[0m"
	echo "Battery name: $BATTERY_NAME"
	echo -n "Current threshold: " & cat /sys/class/power_supply/$BATTERY_NAME/charge_control_end_threshold
	echo "Setting threshold to 100%"
	echo 100 | sudo tee /sys/class/power_supply/$BATTERY_NAME/charge_control_end_threshold > /dev/null

	sleep 1
	echo -ne "Battery status: \033[1m" & cat /sys/class/power_supply/$BATTERY_NAME/status
	echo -ne "\033[0mCurrent threshold:\033[1m " & cat /sys/class/power_supply/$BATTERY_NAME/charge_control_end_threshold
	echo -ne "\033[0m"
fi

