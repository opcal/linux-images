group "default" {
    targets = ["alpine"]
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

variable "LATEST_VERSION" {
    default = "3.23"
}

target "alpine" {
    name = "alpine-${replace(item.version, ".", "_")}"
    matrix = {
      item = [
        {
            base = "alpine:3.20"
            version = "3.20"
        },
        {
            base = "alpine:3.21"
            version = "3.21"
        },
        {
            base = "alpine:3.22"
            version = "3.22"
        },
        {
            base = "alpine:3.23"
            version = "3.23"
        }
      ]
    }
    context = "${PROJECT_DIR}/alpine"
    dockerfile = "base/Dockerfile"
    args = {
        BASE_IMAGE = item.base
        GOSU_VERSION = "${GOSU_VERSION}"
    }
    platforms = ["linux/386","linux/amd64","linux/arm64/v8","linux/ppc64le","linux/s390x"]
    tags = [
        "${CI_REGISTRY}/opcal/alpine:${item.version}",
        equal(item.version, LATEST_VERSION) ? "${CI_REGISTRY}/opcal/alpine:latest" : ""
    ]
}