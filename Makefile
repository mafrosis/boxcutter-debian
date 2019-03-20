.PHONY: ebs vagrant version

PACKER?=packer
VERSION?=1
HEADLESS?=true

vagrant: version
	$(PACKER) build -force -only=vmware-iso \
		-var-file=debian8.json \
		-var iso_path=../iso \
		-var iso_name=debian-9.2.1-amd64-netinst.iso \
		-var iso_checksum=fb1b2d273e62dc0669229af37c19a8b9f8d60ce7 \
		-var update=true \
		-var headless=$(HEADLESS) \
		-var salt_version=v2016.3.8 \
		-var version=$(VERSION) \
		debian.json

version:
	@printf "Packer %s\n" $$($(PACKER) --version)
