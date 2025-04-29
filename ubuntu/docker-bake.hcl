group "default" {
    targets = ["ubuntu"]
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

target "ubuntu" {
    name = "ubuntu-${item.version}"
    matrix = {
      item = [
        {
            base = "ubuntu:jammy"
            version = "jammy"
        },
        {
            base = "ubuntu:noble"
            version = "noble"
        }
      ]
    }
    context = "${PROJECT_DIR}/ubuntu"
    dockerfile = "base/Dockerfile"
    args = {
        BASE_IMAGE = item.base
    }
    platforms = ["linux/amd64","linux/arm64/v8","linux/arm/v7","linux/ppc64le","linux/s390x"]
    tags = [
        "${CI_REGISTRY}/opcal/ubuntu:${item.version}"
    ]
}