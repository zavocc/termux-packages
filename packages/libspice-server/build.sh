TERMUX_PKG_HOMEPAGE=https://www.spice-space.org/
TERMUX_PKG_DESCRIPTION="Implements the server side of the SPICE protocol"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.999"
TERMUX_PKG_SRCURL=https://github.com/zavocc/spice-v3/archive/refs/tags/${TERMUX_PKG_VERSION}-fixes.tar.gz
TERMUX_PKG_SHA256=d2f3647241a0f02b66819bacfc61cb94b5933acd022438e1c83e7ba996c065e7
TERMUX_PKG_DEPENDS="glib, gst-plugins-base, gstreamer, libc++, libiconv, libjpeg-turbo, liblz4, libopus, liborc, libpixman, libsasl, libspice-protocol, openssl, zlib"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--enable-manual=no
--disable-tests
"

termux_step_pre_configure() {
	LDFLAGS+=" $($CC -print-libgcc-file-name)"
}

termux_step_post_make_install() {
	ln -sf libspice-server.so "${TERMUX_PREFIX}"/lib/libspice-server.so.1
}
