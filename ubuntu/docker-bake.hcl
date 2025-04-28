group "default" {
    targets = ["jammy", "noble"]
}

variable "PROJECT_DIR" {
    type = string
}

variable "CI_REGISTRY" {
    type = string
}

target "jammy" {
    context = "${PROJECT_DIR}/ubuntu"
    dockerfile = "base/Dockerfile"
    args = {
        BASE_IMAGE = "ubuntu:jammy"
    }
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["${CI_REGISTRY}/opcal/ubuntu:jammy"]
}

target "noble" {
    context = "${PROJECT_DIR}/ubuntu"
    dockerfile = "base/Dockerfile"
    args = {
        BASE_IMAGE = "ubuntu:noble"
    }
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["${CI_REGISTRY}/opcal/ubuntu:noble"]
}