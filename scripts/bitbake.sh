#!/bin/bash

cd src
DISTRO=openstlinux-weston MACHINE=stm32mp1 source layers/meta-st/scripts/envsetup.sh
bitbake aurora-image-core
cd tmp-glibc/deploy/images/stm32mp1/scripts
./create_sdcard_from_flashlayout.sh ../flashlayout_aurora-image-core/extensible/FlashLayout_sdcard_stm32mp157c-dk2-extensible.tsv
cp ../FlashLayout_sdcard_stm32mp157c-dk2-extensible.raw /output
