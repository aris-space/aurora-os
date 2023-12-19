docker rm yocto
docker run -it -P --name yocto -v ./output:/output ubuntu-yocto 
