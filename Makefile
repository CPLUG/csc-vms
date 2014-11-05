103-jdalbey.ova: lubuntu.ova

%.ova: %/packer.json %/*.sh
	cd $* && packer build packer.json
	mv $*/output-*/$*.ova $@
	rmdir $*/output-*
