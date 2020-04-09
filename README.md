# Logitech-wheel-ebuilds
new-lg4ff kernel module and oversteer 

## new-lg4ff
https://github.com/berarma/new-lg4ff

Notes:
Your kernel must be configured with 

CONFIG_HID_LOGITECH  set to 'm' and 

CONFIG_LOGIWHEELS_FF set to 'y' 

(Device Drivers -> HID support -> Special HID drivers -> Logitech devices)

The module is installed as hid-logitech-new.ko.

The original hid-logitech.ko is blacklisted in /etc/modprobe.d/new-lg4ff.conf but it should still be possible to switch between the two with rmmod and modprobe.

Only tested on the gentoo sources 5.6.* kernels. I don't know if it work on the stable gentoo sources kernel or other kernels

## oversteer
https://github.com/berarma/oversteer

If you are running stable then you will need to to unmask dev-python/python-evdev as there is no stable ebuild

```echo  dev-python/python-evdev ~amd64 ~x86 >> /etc/portage/package.accept_keywords ```

Both build on my system in a clean stage 3 chroot on my system so fingers crossed.

I might make an overlay in future but an easy way to emerge these ebuilds is to create a local repo as detailed here
https://wiki.gentoo.org/wiki/Handbook:AMD64/Portage/CustomTree#Defining_a_custom_repository

Just the "Defining a custom repository" bit.
After that just copy games-util to /var/db/repos/localrepo
(Many ways to to it, just for those that don't know)

Credit to berarma for the driver and program.

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

