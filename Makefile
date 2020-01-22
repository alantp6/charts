IMAGE ?= quay.io/ligenvidia/charts-build:latest
REPO_URL ?= "https://alantp6.github.io/charts"

.PHONY: update-repo build-env package-all update-index build-shell publish

default: update-repo

update-repo:
	make package-all
	make update-index

build-env:
	docker build -t $(IMAGE) ./docker

package-all:
	docker run -it \
		-v `pwd`:/build \
		-w /build \
		$(IMAGE) \
		./package_all

update-index:
	docker run -it --privileged \
		-v `pwd`:/build \
		-w /build \
		-e "repo_url=$(REPO_URL)" \
		$(IMAGE) \
		./update_index

build-shell:
	docker run -it --privileged \
		-v `pwd`:/build \
		-w /build \
		$(IMAGE) \
		bash

publish:
	git add -A || true
	git commit -a -m "Update charts repo at $$(date)" || true
	git push origin HEAD
