echo "Checking out submodules"
git submodule update --init
cd data/poky
git checkout -b kirkstone-4.0.10 kirkstone-4.0.10
cd ../..
