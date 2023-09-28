# This script needs to be called from the aurora-os/ directory
sd_card_device=$1

echo "Create final image to be written on the SD card"
cd data/openstlinux-kirkstone/build-openstlinuxweston-stm32mp1/tmp-glibc/deploy/images/stm32mp1/scripts
./create_sdcard_from_flashlayout.sh ../flashlayout_aurora-image-core/extensible/FlashLayout_sdcard_stm32mp157c-dk2-extensible.tsv

echo "Write to the SD card"
sudo dd if=../flashlayout_aurora-image-core/extensible/../../FlashLayout_sdcard_stm32mp157c-dk2-extensible.raw of=$1 bs=8M conv=fdatasync status=progress oflag=direct
