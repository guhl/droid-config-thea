#!/bin/bash

display_on=1

function enable_sensors() {
        echo 1 > /sys/devices/virtual/input/input0/enable
        echo 1 > /sys/devices/virtual/input/input3/enable
}

function disable_sensors() {
        echo 0 > /sys/devices/virtual/input/input0/enable
        echo 0 > /sys/devices/virtual/input/input3/enable
}

dbus-monitor --system "type='signal',interface='com.nokia.mce.signal',member='display_status_ind'" |
while read -r line; do
        echo $line | grep "on" && display_on=1
        echo $line | grep "off" && display_on=0
        if [ $display_on == 1 ]; then
                echo "display is on"
                enable_sensors
        fi
        if [ $display_on == 0 ]; then
                echo "display is off"
                disable_sensors
        fi
done
