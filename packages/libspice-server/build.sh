TERMUX_PKG_HOMEPAGE=https://www.spice-space.org/
TERMUX_PKG_DESCRIPTION="Implements the server side of the SPICE protocol"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.999-debug"
TERMUX_PKG_SRCURL=https://github.com/zavocc/spice-v2/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=0e1b2a2605d3c190b15f5a1ded543ae9418ed8dddbbf2b7da129f8312cdb5717
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
