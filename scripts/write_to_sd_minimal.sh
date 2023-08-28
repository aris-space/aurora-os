# This script needs to be called from the aurora-os/ directory
sd_card_device=$1

echo "Create final image to be written on the SD card"
cd data/build/tmp/deploy/images/stm32mp1/scripts
./create_sdcard_from_flashlayout.sh ../flashlayout_core-image-base/extensible/FlashLayout_sdcard_stm32mp157c-dk2-extensible.tsv

echo "Write to the SD card"
sudo dd if=../flashlayout_core-image-base/extensible/../../FlashLayout_sdcard_stm32mp157c-dk2-extensible.raw of=$sd_card_device bs=8M conv=fdatasync status=progress oflag=direct

