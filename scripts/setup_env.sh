#!/bin/bash
# Setup the build environment from the stm32 distribution package
cd src
DISTRO=openstlinux-weston MACHINE=stm32mp1 source layers/meta-st/scripts/envsetup.sh
sed -i '$ d' conf/local.conf
echo ACCEPT_EULA_stm32mp1 = \"1\" >> ./conf/local.conf
cd ..
DISTRO=openstlinux-weston MACHINE=stm32mp1 source layers/meta-st/scripts/envsetup.sh

# Add the meta-aurora layer
bitbake-layers add-layer ../layers/meta-aurora
