group "default" {
    targets = ["oraclelinux"]
}

variable "PROJECT_DIR" {
    type = string
}

variable "CI_REGISTRY" {
    type = string
}

variable "TIMESTAMP" {
    type = string
}

variable "GOSU_VERSION" {
    type = string
}

target "oraclelinux" {
    name = "oraclelinux-${item.version}"
    matrix = {
      item = [
        {
            base = "oraclelinux:8-slim"
            version = "8-slim"
        },
        {
            base = "oraclelinux:9-slim"
            version = "9-slim"
        },
        {
            base = "oraclelinux:10-slim"
            version = "10-slim"
        }
      ]
    }
    context = "${PROJECT_DIR}/oraclelinux"
    dockerfile = "base/Dockerfile"
    args = {
        BASE_IMAGE = item.base
        GOSU_VERSION = "${GOSU_VERSION}"
    }
    platforms = ["linux/amd64","linux/arm64"]
    tags = [
        "${CI_REGISTRY}/opcal/oraclelinux:${item.version}"
    ]
}
