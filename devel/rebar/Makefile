# Created by: Kubilay Kocak <koobs@FreeBSD.org>
# $FreeBSD$

PORTNAME=	rebar
PORTVERSION=	2.4.0
CATEGORIES=	devel

MAINTAINER=	koobs@FreeBSD.org
COMMENT=	Build-tool for Erlang that follows OTP principles

LICENSE=	APACHE20

BUILD_DEPENDS=	${LOCALBASE}/bin/escript:${PORTSDIR}/lang/erlang
RUN_DEPENDS:=	${BUILD_DEPENDS}

USE_GITHUB=	yes
GH_ACCOUNT=	rebar
GH_PROJECT=	${PORTNAME}
GH_COMMIT=	24ce11c

PLIST_FILES=	bin/${PORTNAME}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin/

.include <bsd.port.mk>
