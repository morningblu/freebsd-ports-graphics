# Created by: Uffe Jakobsen <uffe@uffe.org>
# $FreeBSD$

PORTNAME=	libsigrokdecode
PORTVERSION=	0.3.0
CATEGORIES=	devel
MASTER_SITES=	http://sigrok.org/download/source/libsigrokdecode/

MAINTAINER=	uffe@uffe.org
COMMENT=	Framework for hardware logic analyzers, protocol decoders library

LICENSE=	GPLv3

GNU_CONFIGURE=	yes
USE_GNOME=	glib20
USES=		gmake libtool pathfix pkgconfig python:3
MAKE_JOBS_UNSAFE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.pre.mk>

# Workaround for libusb not knowing LIBUSB_CLASS_APPLICATION
.if (${OSVERSION} >= 1100000 && ${OSVERSION} < 1100029) || (${OSVERSION} < 1000715)
CFLAGS+=	-DLIBUSB_CLASS_APPLICATION=0xfe
.endif

.include <bsd.port.post.mk>
