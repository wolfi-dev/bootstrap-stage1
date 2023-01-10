ARCH ?= $(shell uname -m)
MELANGE_DIR ?= ../melange
MELANGE ?= ${MELANGE_DIR}/melange
KEY ?= local-melange.rsa
REPO ?= $(shell pwd)/packages

BINUTILS_VERSION ?= 2.39-r0
GCC_VERSION ?= 12.2.0-r2
LINUX_HEADERS_VERSION ?= 5.16.9-r0
GLIBC_VERSION ?= 2.36-r0
LIBSTDCXX_VERSION ?= 12.2.0-r1

MELANGE_OPTS ?= \
	--repository-append ${REPO} \
	--keyring-append ${KEY}.pub \
	--signing-key ${KEY} \
	--pipeline-dir ${MELANGE_DIR}/pipelines \
	--arch ${ARCH} \
	--empty-workspace

PACKAGES = \
	packages/${ARCH}/cross-binutils-stage1-${BINUTILS_VERSION}.apk \
	packages/${ARCH}/cross-gcc-stage1-${GCC_VERSION}.apk \
	packages/${ARCH}/cross-linux-headers-${LINUX_HEADERS_VERSION}.apk \
	packages/${ARCH}/cross-glibc-stage1-${GLIBC_VERSION}.apk \
	packages/${ARCH}/cross-libstdc++-stage1-${LIBSTDCXX_VERSION}.apk

all: ${KEY} ${PACKAGES}

packages/${ARCH}/cross-binutils-stage1-${BINUTILS_VERSION}.apk:
	${MELANGE} build cross-binutils.yaml ${MELANGE_OPTS}

packages/${ARCH}/cross-gcc-stage1-${GCC_VERSION}.apk:
	${MELANGE} build cross-gcc.yaml ${MELANGE_OPTS}

packages/${ARCH}/cross-linux-headers-${LINUX_HEADERS_VERSION}.apk:
	${MELANGE} build cross-linux-headers.yaml ${MELANGE_OPTS}

packages/${ARCH}/cross-glibc-stage1-${GLIBC_VERSION}.apk:
	${MELANGE} build cross-glibc.yaml ${MELANGE_OPTS}

packages/${ARCH}/cross-libstdc++-stage1-${LIBSTDCXX_VERSION}.apk:
	${MELANGE} build cross-libstdc++.yaml ${MELANGE_OPTS}

${KEY}:
	${MELANGE} keygen ${KEY}
