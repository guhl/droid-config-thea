# These and other macros are documented in
# ../droid-configs-device/droid-configs.inc
%define device thea
%define vendor motorola
%define vendor_pretty Motorola
%define device_pretty Moto G (2nd Gen. LTE)
%define dcd_path ./
# Adjust this for your device
%define pixel_ratio 1.0
# We assume most devices will
%define have_modem 1
# Community HW adaptations need this
%define community_adaptation 1

Provides: sensord-configs

%include droid-configs-device/droid-configs.inc
