DOCKER_REPO := ghcr.io/na4ma4/yark
DOCKER_PLATFORMS += linux/amd64 linux/arm64

-include .makefiles/Makefile
-include .makefiles/ext/na4ma4/lib/docker/v1/Makefile

.makefiles/ext/na4ma4/%: .makefiles/Makefile
	@curl -sfL https://raw.githubusercontent.com/na4ma4/makefiles-ext/main/v1/install | bash /dev/stdin "$@"

.makefiles/%:
	@curl -sfL https://makefiles.dev/v1 | bash /dev/stdin "$@"
