# Created by: Stefan Bethke <stb@lassitu.de>
# $FreeBSD$

PORTNAME=	sauserprefs
PORTVERSION=	1.10 # PLEASE MIRROR DISTFILE WITH VERSIONED DIR
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	http://www.tehinterweb.co.uk/roundcube/plugins/ \
  		LOCAL/bdrewery/${PORTNAME}/${PORTVERSION}/
PKGNAMEPREFIX=	roundcube-
DISTNAME=	${PORTNAME}

MAINTAINER=	stb@lassitu.de
COMMENT=	Roundcube plugin to manage SpamAssassin prefs

LICENSE=	GPLv3

RUN_DEPENDS=	roundcube>=0.8:${PORTSDIR}/mail/roundcube

NO_BUILD=	yes

WWWDIR=		${PREFIX}/www/roundcube/plugins/sauserprefs

# This target is only meant to be used by the port maintainer.
x-generate-plist: build
	cd ${WRKSRC}; \
	${FIND} . ! -type d ! -name '*.orig' | ${SORT} | \
		${SED} -e "s,^\.,%%WWWDIR%%," >${.CURDIR}/pkg-plist.tmp ; \
	${FIND} . -type d | ${SORT} -r | ${SED} \
		-e "s,^\.$$,@dirrmtry %%WWWDIR%%," \
		-e "s,^\.,@dirrm %%WWWDIR%%," >>${.CURDIR}/pkg-plist.tmp

do-install:
	${MKDIR} ${STAGEDIR}/${WWWDIR}
	cd ${WRKSRC} && ${PAX} -r -w . ${STAGEDIR}/${WWWDIR}

.include <bsd.port.mk>
