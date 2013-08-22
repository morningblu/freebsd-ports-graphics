# bsd.mesalib.mk - shared code between MesaLib ports.
#
# !!! Here be dragons !!! (they seem to be everywhere these days)
#
# Remember to upgrade the following ports everytime you bump MESAVERSION:
#
#    - graphics/libEGL
#    - OpenCL
#    - graphics/libglesv2
#    - graphics/libGL
#    - graphics/dri
#
# $FreeBSD$

.MAKE.FreeBSD_UL=	yes

MESAVERSION=	${MESABASEVERSION}${MESASUBVERSION:C/^(.)/.\1/}
MESADISTVERSION=${MESABASEVERSION}${MESASUBVERSION:C/^(.)/-\1/}

.if defined(WITH_NEW_XORG)
MESABASEVERSION=	9.1.6
# if there is a subversion, include the '-' between 7.11-rc2 for example.
MESASUBVERSION=		
PLIST_SUB+=	OLD="@comment " NEW=""
.else
MESABASEVERSION=	7.6.1
MESASUBVERSION=		
PLIST_SUB+=	OLD="" NEW="@comment "
.endif

MASTER_SITES=	ftp://ftp.freedesktop.org/pub/mesa/${MESABASEVERSION}/
DISTFILES=	MesaLib-${MESADISTVERSION}${EXTRACT_SUFX}
MAINTAINER?=	x11@FreeBSD.org

BUILD_DEPENDS+=	makedepend:${PORTSDIR}/devel/makedepend \
		${PYTHON_SITELIBDIR}/libxml2.py:${PORTSDIR}/textproc/py-libxml2

USES=		bison gmake pathfix pkgconfig
USE_PYTHON_BUILD=-2.7
USE_BZIP2=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

CONFIGURE_ENV+=ac_cv_prog_LEX=${LOCALBASE}/bin/flex

.if defined(WITH_NEW_XORG)
# probably be shared lib, and in it own port.
CONFIGURE_ARGS+=        --enable-shared-glapi=no
# we need to reapply these patches because we doing wierd stuff with autogen
REAPPLY_PATCHES= \
		${PATCHDIR}/patch-configure \
		${PATCHDIR}/patch-src_egl_main_Makefile.in \
		${PATCHDIR}/patch-src_glx_Makefile.in \
		${PATCHDIR}/patch-src_mapi_es2api_Makefile.in \
		${PATCHDIR}/patch-src_mapi_shared-glapi_Makefile.in \
		${PATCHDIR}/patch-src_mesa_drivers_dri_common_Makefile.in \
		${PATCHDIR}/patch-src_mesa_drivers_dri_common_xmlpool_Makefile.in \
		${PATCHDIR}/patch-src_mesa_libdricore_Makefile.in
.else # ! WITH_NEW_XORG
MAKE_JOBS_UNSAFE=	yes
CONFIGURE_ARGS+=--disable-glut --disable-glw --disable-glu

ALL_TARGET=		default
.endif

MASTERDIR=		${.CURDIR}/../../graphics/libGL
.if defined(WITH_NEW_XORG)
PATCHDIR=		${MASTERDIR}/files
.else
PATCHDIR=		${MASTERDIR}/files-old
.endif
DESCR=			${.CURDIR}/pkg-descr
PLIST=			${.CURDIR}/pkg-plist
WRKSRC=			${WRKDIR}/Mesa-${MESADISTVERSION}

COMPONENT=		${PORTNAME:L:C/^lib//:C/mesa-//}

.if ${COMPONENT:Mglesv2} == ""
CONFIGURE_ARGS+=	--disable-gles2
.else
CONFIGURE_ARGS+=	--enable-gles2
.endif

.if ${COMPONENT:Megl} == ""
CONFIGURE_ARGS+=	--disable-egl
.else
CONFIGURE_ARGS+=	--enable-egl
.endif

.if ${COMPONENT:Mdri} == ""
CONFIGURE_ARGS+=--with-dri-drivers=no
CONFIGURE_ARGS+=--enable-gallium-llvm=no --without-gallium-drivers
.else
# done in the dri port
.endif

.if !defined(WITH_NEW_XORG)
.if defined(WITHOUT_XCB)
CONFIGURE_ARGS+=	--disable-xcb
.else
CONFIGURE_ARGS+=	--enable-xcb
.endif
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-ffast-math|${FAST_MATH}|' -e 's|x86_64|amd64|' \
		${WRKSRC}/configure
# workaround for stupid rerunning configure in do-build step
# xxx
.if defined(WITH_NEW_XORG)
	cd ${WRKSRC} && env NOCONFIGURE=1 sh autogen.sh
. for file in ${REAPPLY_PATCHES}
	@cd ${WRKSRC} && ${PATCH} --quiet  < ${file}
. endfor
# make sure the pkg-config files are installed in the correct place.
# this was reverted by running autogen.sh
	@${FIND} ${WRKSRC} -name Makefile.in -type f | ${XARGS} ${REINPLACE_CMD} -e \
		's|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g' ;
.else
	@${REINPLACE_CMD} -e 's|[$$](INSTALL_LIB_DIR)/pkgconfig|${PREFIX}/libdata/pkgconfig|' \
		${WRKSRC}/src/glu/Makefile \
		${WRKSRC}/src/mesa/Makefile \
		${WRKSRC}/src/mesa/drivers/dri/Makefile
.endif

