group "default" {
    targets = ["alpine3_18", "alpine3_19", "alpine3_20", "alpine3_21"]
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

target "alpine3_18" {
    context = "${PROJECT_DIR}/alpine"
    dockerfile = "base/Dockerfile"
    args = {
        BASE_IMAGE = "alpine:3.18",
        GOSU_VERSION = "${GOSU_VERSION}"
    }
    platforms = ["linux/386","linux/amd64","linux/arm64/v8","linux/ppc64le","linux/s390x"]
    tags = [
        "${CI_REGISTRY}/opcal/opcal/alpine:3.18"
    ]
}

target "alpine3_19" {
    context = "${PROJECT_DIR}/alpine"
    dockerfile = "base/Dockerfile"
    args = {
        BASE_IMAGE = "alpine:3.19",
        GOSU_VERSION = "${GOSU_VERSION}"
    }
    platforms = ["linux/386","linux/amd64","linux/arm64/v8","linux/ppc64le","linux/s390x"]
    tags = [
        "${CI_REGISTRY}/opcal/opcal/alpine:3.19"
    ]
}

target "alpine3_20" {
    context = "${PROJECT_DIR}/alpine"
    dockerfile = "base/Dockerfile"
    args = {
        BASE_IMAGE = "alpine:3.20",
        GOSU_VERSION = "${GOSU_VERSION}"
    }
    platforms = ["linux/386","linux/amd64","linux/arm64/v8","linux/ppc64le","linux/s390x"]
    tags = [
        "${CI_REGISTRY}/opcal/opcal/alpine:3.20"
    ]
}

target "alpine3_21" {
    context = "${PROJECT_DIR}/alpine"
    dockerfile = "base/Dockerfile"
    args = {
        BASE_IMAGE = "alpine:3.21",
        GOSU_VERSION = "${GOSU_VERSION}"
    }
    platforms = ["linux/386","linux/amd64","linux/arm64/v8","linux/ppc64le","linux/s390x"]
    tags = [
        "${CI_REGISTRY}/opcal/opcal/alpine:3.21",
        "${CI_REGISTRY}/opcal/opcal/alpine:latest"
    ]
}