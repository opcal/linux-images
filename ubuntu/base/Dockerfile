ARG BASE_IMAGE

FROM ${BASE_IMAGE}

LABEL org.opencontainers.image.authors="opcal@outlook.com"

RUN set -eux; \
    DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gosu \
    && apt-get clean \
    && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*


CMD ["/bin/bash"]