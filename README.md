# Logitech-wheel-ebuilds
new-lg4ff kernel module, oversteer and pyLinuxWheel Gentoo ebuilds.

## new-lg4ff
Experimental Logitech Force Feedback module for driving wheels.
https://github.com/berarma/new-lg4ff

Your kernel must be configured with 

CONFIG_HID_LOGITECH  set to 'm' and 

CONFIG_LOGIWHEELS_FF set to 'y'.

(Device Drivers -> HID support -> Special HID drivers -> Logitech devices)

The module is installed as hid-logitech-new.ko.

The original hid-logitech.ko is blacklisted in /etc/modprobe.d/new-lg4ff.conf but it should still be possible to switch between the two with rmmod and modprobe.

Only tested on the gentoo sources 5.6.* kernels. I don't know if it will work on the stable gentoo sources kernel or other kernels.

## oversteer
An application to configure Logitech Wheels.
https://github.com/berarma/oversteer


## pyLinuxWheel
A simple utility to configure logitech steering wheels for Linux.
https://gitlab.com/OdinTdh/pyLinuxWheel

If you are running stable then you will need to to unmask dev-python/python-evdev as there is no stable ebuild. This is required for both GUI's

```echo  dev-python/python-evdev ~amd64 ~x86 >> /etc/portage/package.accept_keywords ```


## Supported wheels
* Driving Force / Formula EX
* Driving Force Pro
* Driving Force GT
* Momo Force
* Momo Racing Force
* Speed Force Wireless
* G25 Racing Wheel
* G27 Racing Wheel
* G29 Driving Force Racing Wheel
* G920 Driving Force Racing Wheel


All were built on my system in clean stage 3 chroot's so dependacies should be covered.

I might make an overlay in future but an easy way to emerge these ebuilds is to create a local repo as detailed here
https://wiki.gentoo.org/wiki/Handbook:AMD64/Portage/CustomTree#Defining_a_custom_repository

Just the "Defining a custom repository" bit.
After that just copy games-util to /var/db/repos/localrepo

(Many ways to do it, just for those that don't know)

Credit to berarma for the driver and oversteer.

Credit to Alberto Vicente for pyLinuxWheel.

