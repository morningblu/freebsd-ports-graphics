# Created by: Jui-Nan Lin <jnlin@csie.nctu.edu.tw>
# $FreeBSD$

PORTNAME=	trafficserver
PORTVERSION=	5.0.1
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	APACHE/${PORTNAME}

MAINTAINER=	gaod@hychen.org
COMMENT=	Fast, scalable and extensible HTTP proxy server

LICENSE=	APACHE20

LIB_DEPENDS=	libboost_system.so:${PORTSDIR}/devel/boost-libs \
		libcurl.so:${PORTSDIR}/ftp/curl \
		libexecinfo.so:${PORTSDIR}/devel/libexecinfo \
		libhwloc.so:${PORTSDIR}/devel/hwloc \
		libpcre.so:${PORTSDIR}/devel/pcre \
		libxml2.so:${PORTSDIR}/textproc/libxml2

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		cpe gmake libtool perl5 pkgconfig tar:bzip2 tcl
CPE_VENDOR=	apache
CPE_PRODUCT=	traffic_server
USE_PERL5=	build run fixpacklist
USE_LDCONFIG=	yes
USE_OPENSSL=	yes
USE_RC_SUBR=	${PORTNAME}
USE_SQLITE=	yes

ONLY_FOR_ARCHS=	i386 amd64

USERS=		www
GROUPS=		www

LIBS+=		-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--with-libxml2=${LOCALBASE} \
		--with-pcre=${LOCALBASE} \
		--with-openssl=${OPENSSLBASE} \
		--with-xml=libxml2 \
		--with-tcl=${TCL_LIBDIR} \
		--disable-silent-rules \
		--enable-cppapi \
		--enable-luajit \
		--localstatedir=/var \
		--with-user=${USERS} \
		--with-group=${GROUPS}

OPTIONS_DEFINE=	DOCS INTERIM WCCP
OPTIONS_RADIO=	MEMMAN
OPTIONS_RADIO_MEMMAN=	ALLOCATORS FREELISTS RECLAIM
OPTIONS_DEFAULT=	FREELISTS

WCCP_DESC=	Enable WCCPv2 protocol
INTERIM_DESC=	Enable interim cache (SSD)
ALLOCATORS_DESC=	Manage memory with allocators
FREELISTS_DESC=	Manage memory with freelists
RECLAIM_DESC=	Reclaim unused memory in freelists

WCCP_CONFIGURE_ENABLE=	wccp
INTERIM_CONFIGURE_ENABLE=	interim-cache

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MRECLAIM}
CONFIGURE_ARGS+=	--enable-reclaimable-freelist --enable-freelist
.elif ${PORT_OPTIONS:MFREELISTS}
CONFIGURE_ARGS+=	--enable-freelist
.elif ${PORT_OPTIONS:MALLOCATORS}
CONFIGURE_ARGS+=	--disable-freelist
.else
IGNORE=	no allocation strategy selected
.endif

.if ${OSVERSION} >= 900033 && exists(/usr/bin/clang)
CC=		clang
CXX=		clang++
.endif

.if ! exists(/var/cache)
# FreeBSD 8.x
PLIST_DIRSTRY+=	/var/cache
.endif

post-patch:
	@${REINPLACE_CMD} \
		-e '/cachedir:/s,$${localstatedir}+,$${localstatedir}/cache+,' \
		-e '/runtimedir:/s,$${localstatedir}+,$${localstatedir}/run+,' \
		${WRKSRC}/config.layout
	@${REINPLACE_CMD} '/^LUA_LDFLAGS =/s/$$/ @LDFLAGS@/' \
		${WRKSRC}/lib/Makefile.in

post-install:
	@${RM} ${STAGEDIR}${PREFIX}/lib/perl5/${PERL_VER}/${PERL_ARCH}/perllocal.pod
	@${RMDIR} ${STAGEDIR}${DATADIR}
	@${MKDIR} ${STAGEDIR}${ETCDIR}/snapshots
	(cd ${STAGEDIR}${ETCDIR} && for f in *.config *.config.xml; do ${MV} $$f $$f.sample; done)

.include <bsd.port.mk>
