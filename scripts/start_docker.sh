sudo systemctl start docker
sudo docker rm yocto
sudo docker run -dit -P --name yocto -v ~/Projects/aurora-os/data/:/data ubuntu-yocto
sudo docker attach yocto
