# Created by: J.R. Oldroyd <fbsd@opal.com>
# $FreeBSD$

PORTNAME=	xorriso
PORTVERSION=	1.3.4
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://files.libburnia-project.org/releases/
DISTNAME=	libisoburn-${PORTVERSION}

MAINTAINER=	delphij@FreeBSD.org
COMMENT=	ISO image manipulation tool based on Libburnia

LICENSE=	GPLv2

BUILD_DEPENDS=	libburn>=1.1.0:${PORTSDIR}/devel/libburn \
		libisofs>=1.1.2:${PORTSDIR}/devel/libisofs
RUN_DEPENDS=	libburn>=1.1.0:${PORTSDIR}/devel/libburn \
		libisofs>=1.1.2:${PORTSDIR}/devel/libisofs

GNU_CONFIGURE=	yes
USES=		gmake iconv libtool pathfix pkgconfig shebangfix
SHEBANG_FILES=	${WRKSRC}/frontend/xorriso-tcltk
USE_LDCONFIG=	yes

INFO=		xorrecord xorriso xorrisofs

.include <bsd.port.mk>
