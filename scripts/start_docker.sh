docker rm yocto
docker run -dit -P --name yocto -v ~/Projects/aurora-os/data/:/data ubuntu-yocto
docker attach yocto
