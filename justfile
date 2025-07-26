disable-gpu:
	echo 1 | sudo tee /sys/bus/pci/devices/0000\:03\:00.0/remove

enable-gpu:
	echo 1 | sudo tee /sys/bus/pci/rescan

import-gpg-key:
	curl https://github.com/CaderIdris.gpg | gpg --import
