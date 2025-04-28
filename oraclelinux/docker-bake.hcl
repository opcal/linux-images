group "default" {
    targets = ["oraclelinux8", "oraclelinux9"]
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

target "oraclelinux8" {
    context = "${PROJECT_DIR}/oraclelinux"
    dockerfile = "base/Dockerfile"
    args = {
        BASE_IMAGE = "oraclelinux:8-slim",
        GOSU_VERSION = "${GOSU_VERSION}"
    }
    platforms = ["linux/amd64","linux/arm64/v8"]
    tags = [
        "${CI_REGISTRY}/opcal/oraclelinux:8-slim",
        "${CI_REGISTRY}/opcal/oraclelinux:8-slim-${TIMESTAMP}"
    ]
}

target "oraclelinux9" {
    context = "${PROJECT_DIR}/oraclelinux"
    dockerfile = "base/Dockerfile"
    args = {
        BASE_IMAGE = "oraclelinux:9-slim",
        GOSU_VERSION = "${GOSU_VERSION}"
    }
    platforms = ["linux/amd64","linux/arm64/v8"]
    tags = [
        "${CI_REGISTRY}/opcal/oraclelinux:9-slim",
        "${CI_REGISTRY}/opcal/oraclelinux:9-slim-${TIMESTAMP}"
    ]
}