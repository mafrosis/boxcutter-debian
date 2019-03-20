.PHONY: ebs vagrant version

PACKER?=packer
VERSION?=1
HEADLESS?=true

vagrant: version
	$(PACKER) build -force -only=vmware-iso \
		-var-file=debian8.json \
		-var debian=stretch \
		-var iso_path=../iso \
		-var iso_name=debian-9.8.0-amd64-netinst.iso \
		-var iso_checksum=6e6f27a4c187dcc0a73aee4dd8d780575defd293 \
		-var update=true \
		-var headless=$(HEADLESS) \
		-var salt_version=v2019.2.0 \
		-var version=$(VERSION) \
		debian.json

version:
	@printf "Packer %s\n" $$($(PACKER) --version)
