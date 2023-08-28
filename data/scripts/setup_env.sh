# Setup the build environment from the stm32 distribution package
cd openstlinux-5.10-dunfell-mp1-21-03-31/
DISTRO=openstlinux-weston MACHINE=stm32mp1 source layers/meta-st/scripts/envsetup.sh

# Add the meta-aurora layer
bitbake-layers add-layer ../../meta-aurora
