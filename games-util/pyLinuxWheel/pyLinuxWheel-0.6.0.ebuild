EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )
DESCRIPTION="A simple utility to configure logitech steering wheels for Linux. Models supported: Driving Force (EX, RX, Pro, GT), G25, G27, G29, G920, Logitech Racing Wheel USB, WingMan Formula (Yellow, GP,Force GP) and MOMO (Force, Racing)."
HOMEPAGE="https://gitlab.com/OdinTdh/pyLinuxWheel"
SRC_URI="https://gitlab.com/OdinTdh/pyLinuxWheel/-/archive/0.6.0/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"


RDEPEND="dev-python/pygobject
		 dev-python/pyudev
		 dev-python/python-evdev
		 x11-libs/gtk+"

# src_compile() {
# 	meson build --prefix="/usr"
# 	ninja -C build
# }

src_install() {
    mv pyLinuxWheel.py pyLinuxWheel
    dobin pyLinuxWheel
    mv data/desktop/io.itch.pyLinuxWheel.desktop data/desktop/pyLinuxWheel.desktop
    insinto usr/share/applications
    doins data/desktop/pyLinuxWheel.desktop
    insinto usr/share/pyLinuxWheel/data
    doins -r data/*
#    insinto usr/share/pixmaps
#    doins
    insinto usr/share/locale
    doins -r locale/*
}
