# $FreeBSD$

PORTNAME=	jimtcl
PORTVERSION=	0.75
CATEGORIES=	lang tcl

MAINTAINER=	bapt@FreeBSD.org
COMMENT=	Small footprint implementation of the Tcl programming language

LICENSE=	BSD2CLAUSE

USE_GITHUB=	yes
GH_ACCOUNT=	msteveb
GH_COMMIT=	cffd1a5

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--full \
		--enable-utf8 \
		--enable-shared \
		--disable-docs

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/jimsh \
		${STAGEDIR}${PREFIX}/lib/libjim.so.0.75

.include <bsd.port.mk>
