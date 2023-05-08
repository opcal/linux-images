ARG BASE_IMAGE

FROM --platform=${TARGETPLATFORM} ${BASE_IMAGE} AS builder 

RUN microdnf update -y \
    && microdnf install -y --setopt=install_weak_deps=0 \
        ca-certificates \
        curl \
     && microdnf clean all

ARG GOSU_VERSION

RUN set -eux; \
    gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 ; \
    ARCH="$(uname -m)"; \
    case "${ARCH}" in \
        aarch64) \
            BIN_ARCH=arm64 ;
            ;; \
        x86_64) \
            BIN_ARCH=amd64 ;
            ;; \
        *) \
            echo "Unsupported arch: ${ARCH}"; \
            exit 1; \
            ;; \
    curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-${BIN_ARCH}"; \
    curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-${BIN_ARCH}.asc"; \
    gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu ; \
    chmod +x /usr/local/bin/gosu

FROM --platform=${TARGETPLATFORM} ${BASE_IMAGE}

LABEL org.opencontainers.image.authors="opcal@outlook.com"

RUN microdnf update -y ; \
    microdnf install -y --setopt=install_weak_deps=0 \
        ca-certificates \
        curl \
    ; \
    microdnf clean all

COPY --from=builder /usr/local/bin/gosu /usr/local/bin/gosu


CMD ["/bin/bash"]