# check=skip=InvalidDefaultArgInFrom

ARG BASE_IMAGE

FROM ${BASE_IMAGE} AS builder 

RUN microdnf update -y \
    && microdnf install -y --setopt=install_weak_deps=0 \
        ca-certificates \
        curl \
		gnupg2 \
        wget \
     && microdnf clean all

ARG GOSU_VERSION

RUN set -eux; \
	\
	rpmArch="$(rpm --query --queryformat='%{ARCH}' rpm)"; \
	case "$rpmArch" in \
		aarch64) dpkgArch='arm64' ;; \
		armv[67]*) dpkgArch='armhf' ;; \
		i[3456]86) dpkgArch='i386' ;; \
		ppc64le) dpkgArch='ppc64el' ;; \
		riscv64 | s390x) dpkgArch="$rpmArch" ;; \
		x86_64) dpkgArch='amd64' ;; \
		*) echo >&2 "error: unknown/unsupported architecture '$rpmArch'"; exit 1 ;; \
	esac; \
	wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
	\
# verify the signature
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
	gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
	gpgconf --kill all; \
	rm -rf "$GNUPGHOME" /usr/local/bin/gosu.asc; \
	\
	chmod +x /usr/local/bin/gosu; \
# verify that the binary works
	gosu --version; \
	gosu nobody true


FROM ${BASE_IMAGE}

LABEL org.opencontainers.image.authors="opcal@outlook.com"

RUN microdnf update -y ; \
    microdnf install -y --setopt=install_weak_deps=0 \
        ca-certificates \
        curl \
    ; \
    microdnf clean all

COPY --from=builder /usr/local/bin/gosu /usr/local/bin/gosu


CMD ["/bin/bash"]