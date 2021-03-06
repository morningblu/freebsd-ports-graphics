# Created by: Wen Heping <wenheping@gmail.com>
# $FreeBSD$

PORTNAME=	mwlib
PORTVERSION=	0.15.14
PORTREVISION=	3
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Python's MediaWiki Parser and Utility Library

LICENSE=	BSD3CLAUSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}apipkg>=1.2:${PORTSDIR}/devel/py-apipkg \
		${PYTHON_PKGNAMEPREFIX}bottle>=0.10:${PORTSDIR}/www/py-bottle \
		${PYTHON_PKGNAMEPREFIX}flup>=1.0:${PORTSDIR}/www/py-flup \
		${PYTHON_PKGNAMEPREFIX}gevent>=0:${PORTSDIR}/devel/py-gevent \
		${PYTHON_PKGNAMEPREFIX}lockfile>=0.8:${PORTSDIR}/devel/py-lockfile \
		${PYTHON_PKGNAMEPREFIX}lxml>=0:${PORTSDIR}/devel/py-lxml \
		${PYTHON_PKGNAMEPREFIX}odfpy>=0.9:${PORTSDIR}/devel/py-odfpy \
		${PYTHON_PKGNAMEPREFIX}webob>=0.9.6.1:${PORTSDIR}/www/py-webob \
		${PYTHON_PKGNAMEPREFIX}lockfile>=0.8:${PORTSDIR}/devel/py-lockfile \
		${PYTHON_PKGNAMEPREFIX}timelib>=0.2:${PORTSDIR}/devel/py-timelib \
		${PYTHON_PKGNAMEPREFIX}pdf>=1.12:${PORTSDIR}/print/py-pdf \
		${PYTHON_PKGNAMEPREFIX}pillow>0:${PORTSDIR}/graphics/py-pillow \
		${PYTHON_PKGNAMEPREFIX}pylib>=1.4.0:${PORTSDIR}/devel/py-pylib \
		${PYTHON_PKGNAMEPREFIX}qserve>=0:${PORTSDIR}/devel/py-qserve \
		${PYTHON_PKGNAMEPREFIX}roman>=0:${PORTSDIR}/math/py-roman \
		${PYTHON_PKGNAMEPREFIX}simplejson>2.0.8:${PORTSDIR}/devel/py-simplejson \
		${PYTHON_PKGNAMEPREFIX}sqlite3dbm>=0:${PORTSDIR}/databases/py-sqlite3dbm \
		${PYTHON_PKGNAMEPREFIX}timelib>=0.2:${PORTSDIR}/devel/py-timelib \
		${PYTHON_PKGNAMEPREFIX}webob>=0.9.6.1:${PORTSDIR}/www/py-webob

USES=		python:2 zip
USE_PYTHON=	autoplist distutils
USE_RC_SUBR=	mwqserve nserve nslave postman
SUB_LIST=	PYTHON_CMD=${PYTHON_CMD}

post-patch:
	${REINPLACE_CMD} \
		-e 's|lockfile==|lockfile>=|' \
		${WRKSRC}/setup.py

.include <bsd.port.mk>
