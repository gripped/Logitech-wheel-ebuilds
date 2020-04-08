EAPI=7
inherit linux-mod linux-info
DESCRIPTION="Experimental Logitech force feedback module"
HOMEPAGE="https://github.com/berarma/new-lg4ff"
SRC_URI="https://github.com/berarma/new-lg4ff/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

pkg_pretend() {
	if linux_config_exists; then
		if linux_chkconfig_module HID_LOGITECH ; then
			:
		else
			eerror "Kernel config CONFIG_HID_LOGITECH must be set to 'm'"
			eerror "Device Drivers -> HID support -> Special HID drivers -> Logitech devices"
			die
		fi
		if linux_chkconfig_present LOGIWHEELS_FF ; then
			:
		else
			eerror "Kernel config CONFIG_LOGIWHEELS_FF must be set to 'y'"
			eerror "Device Drivers -> HID support -> Special HID drivers -> Logitech devices"
			die
		fi
	else
		eerror "No .config !"
		die
	fi
}


pkg_setup() {
	MODULE_NAMES="hid-logitech-new(kernel/drivers/hid:${S})"
	linux-mod_pkg_setup
}

src_compile() {
	ARCH=$(uname -m | sed -e 's/i.86/i386/')
	make 
}

src_install() {
	linux-mod_src_install
	insinto /etc/modprobe.d
	doins "${FILESDIR}"/new-lg4ff.conf
}
