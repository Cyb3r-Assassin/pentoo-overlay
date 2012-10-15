# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit mozextension multilib

MY_P="${P}-fx"
DESCRIPTION="Lets you switch local proxies in firefox. A fork of multiproxy switch."
HOMEPAGE="http://addons.mozilla.org/en-US/firefox/addon/proxy-selector"
SRC_URI="http://releases.mozilla.org/pub/mozilla.org/addons/215989/${MY_P}.xpi"
LICENSE="MPL-1.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="|| (
	www-client/firefox-bin
	www-client/firefox
)"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_unpack() {
	xpi_unpack ${A}
}

src_install () {
	declare MOZILLA_FIVE_HOME
	if has_version 'www-client/firefox'; then
		MOZILLA_FIVE_HOME="/usr/$(get_libdir)/firefox"
		xpi_install "${S}/${MY_P}"
	fi
	if has_version 'www-client/firefox-bin'; then
		MOZILLA_FIVE_HOME="/opt/firefox"
		xpi_install "${S}/${MY_P}"
	fi
}