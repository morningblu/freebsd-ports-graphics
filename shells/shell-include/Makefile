# Created by: Zane C. Bowers
# $FreeBSD$

PORTNAME=	shell-include
PORTVERSION=	0.1.2
CATEGORIES=	shells devel
MASTER_SITES=	http://vvelox.net/src/shell-include/

MAINTAINER=	vvelox@vvelox.net
COMMENT=	Include system for shell scripts

USES=		perl5

WRKSRC=		${WRKDIR}/${DISTNAME}

USES=		tar:tgz
NO_BUILD=	yes

do-install:
	cd ${WRKSRC}/ ; ${SH} ${WRKSRC}/install ${STAGEDIR}${PREFIX}

.include <bsd.port.mk>
