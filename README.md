# aurora-os

## Setup

1. First run the setup script: `./scripts/init.sh`
1. Install Docker

## Build the minimal image for the STM32MP157c-DK2

1. Build the docker container: `./scripts/build_docker.sh`
1. Start the docker container: `./scripts/start_docker.sh`
1. You should now be in the docker container. (The terminal should be showing something like this: `dev@cedcfed28edf:/#`
1. Move to /data/yocto-labs
1. `source poky/oe-init-build-env
1. You should now be in the `/data/yocto-labs/build` directory
1. In build/conf add the following lines to the end of bblayers.conf: 
```
/data/yocto-labs/meta-openembedded/meta-oe \
/data/yocto-labs/meta-openembedded/meta-python \
/data/yocto-labs/meta-st-stm32mp \
```
1. Run `MACHINE=stm32mp1 bitbake core-image-minimal` to build the minimal image
1. To build the actual image to be written to the SD-card, move to the following directory: `/data/yocto-labs/build/tmp/deploy/images/stm32mp1/scripts`
1. Then execute `./create_sdcard_from_flashlayout.sh ../flashlayout_core-image-minimal/extensible/FlashLayout_sdcard_stm32mp157c-dk2-extensible.tsv`
1. The final image is found in `/data/yocto-labs/build/tmp/deploy/images/stm32mp1`, it is called `FlashLayout_sdcard_stm32mp157c-dk2-extensible.raw`
1. Exit the docker container
1. Insert your SD-card and format it.
1. Write the image to the SD-card with the following command: `sudo dd if=../flashlayout_core-image-minimal/extensible/../../FlashLayout_sdcard_stm32mp157f-dk2-extensible.raw of=<your SD-card device> bs=8M conv=fdatasync status=progress oflag=direct`

## Check if the image is running
1. Insert the SD-card with the new image into the STM32MP157c-DK2 device
1. Connect your workstation with the device over the microUSB connector
1. Use minicom or similar to start listening on `/dev/ttyACM0` with 115200 baud
1. Power on your device
1. You should see linux booting. At the end, you can login with the user root, no passwort required 
