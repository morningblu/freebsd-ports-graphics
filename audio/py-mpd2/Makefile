# Created by: rene@FreeBSD.org (repocopied from audio/py-mpd)
# $FreeBSD$

PORTNAME=	mpd2
PORTVERSION=	0.5.3
CATEGORIES=	audio python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	python-${PORTNAME}-${PORTVERSION}

MAINTAINER=	rene@FreeBSD.org
COMMENT=	Fork of the Python MPD client library

LICENSE=	LGPL3

USE_GITHUB=	yes
GH_ACCOUNT=	Mic92
GH_PROJECT=	python-${PORTNAME}
GH_TAGNAME=	v${PORTVERSION}
GH_COMMIT=	cfeb3b5

USES=		shebangfix python
SHEBANG_FILES=	examples/helloworld.py
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

OPTIONSFILE=	${PORT_DBDIR}/py-${PORTNAME}/options
OPTIONS_DEFINE=	DOCS EXAMPLES

DOCSDIR=	${PREFIX}/share/doc/py-${PORTNAME}
PORTDOCS_1=	generate_command_reference.py index.rst changes.rst
PORTDOCS_2=	topics/advanced.rst topics/commands.rst \
		topics/getting-started.rst topics/logging.rst
PORTDOCS=	${PORTDOCS_1} ${PORTDOCS_2}
EXAMPLESDIR=	${PREFIX}/share/examples/py-${PORTNAME}
PORTEXAMPLES=	helloworld.py locking.py logger.py
PLIST_DIRSTRY=	${DOCSDIR}/topics

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}/topics
.for f in ${PORTDOCS_1}
	${INSTALL_DATA} ${WRKSRC}/doc/${f} ${STAGEDIR}${DOCSDIR}
.endfor
.for f in ${PORTDOCS_2}
	${INSTALL_DATA} ${WRKSRC}/doc/${f} ${STAGEDIR}${DOCSDIR}/topics
.endfor
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
.for f in ${PORTEXAMPLES}
	${INSTALL_SCRIPT} ${WRKSRC}/examples/${f} ${STAGEDIR}${EXAMPLESDIR}
.endfor

.include <bsd.port.mk>
