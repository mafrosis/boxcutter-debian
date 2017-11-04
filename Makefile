.PHONY: ebs vagrant version

PACKER?=packer
VERSION?=1
HEADLESS?=true

version:
	@printf "Packer %s\n" $$($(PACKER) --version)

ebs: version
	$(PACKER) build -force \
		-var-file=debian8.json \
		-var update=true \
		-var salt_version=v2016.3.5 \
		-var version=$(VERSION) \
		debian-ebs.json

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
