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
1. Run `MACHINE=stm32mp1 bitbake core-image-base` to build the image
1. Exit the docker container
1. Insert the SD card and format it
1. From the `aurora-os` folder, run: `./scripts/write_to_sd.sh <sd_card_device_path>`

## Check if the image is running
1. Insert the SD-card with the new image into the STM32MP157c-DK2 device
1. Connect your workstation with the device over the microUSB connector
1. Use minicom or similar to start listening on `/dev/ttyACM0` with 115200 baud
1. Power on your device
1. You should see linux booting. At the end, you can login with the user root, no passwort required 
