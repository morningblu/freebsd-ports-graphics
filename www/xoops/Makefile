# Created by: Wen heping <wenheping@gmail.com>
# $FreeBSD$

PORTNAME=	xoops
PORTVERSION=	2.5.7
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	SF/${PORTNAME}/XOOPS%20Core%20%28stable%20releases%29/XOOPS_${PORTVERSION}

MAINTAINER=	wen@FreeBSD.org
COMMENT=	Dynamic Web CMS

USE_PHP=	mysql

NO_BUILD=	yes
PLIST_SUB=	WWWOWN="${WWWOWN}" WWWGRP="${WWWGRP}"
SUB_FILES=	pkg-message

do-install:
	${MKDIR} ${STAGEDIR}${WWWDIR}
.for i in checksum.md5 checksum.php
	@cd ${WRKSRC} && ${CP} ${i} ${STAGEDIR}${WWWDIR}/
.endfor
.for d in docs extras htdocs
	@cd ${WRKSRC} && ${COPYTREE_SHARE} ${d} ${STAGEDIR}${WWWDIR}
.endfor
	@${CHMOD} -R 755 ${STAGEDIR}${WWWDIR}

.include <bsd.port.mk>
