103-jdalbey.ova: lubuntu.ova

%.ova: %/packer.json
	cd $* && packer build packer.json
	mv $*/output-*/*.ova $@
	rmdir $*/output-*
