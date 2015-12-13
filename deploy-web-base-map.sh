#!/bin/bash

# 0.1. Added user account to visudo for no password input during run
#  $sudo visudo
#  patrick ALL=(ALL:ALL) NOPASSWD: ALL

# 0.2. Clone the bash scripts from the Git repository
# $git clone https://github.com/hkpark2030/challenge.git
# $cd challenge
# $bash start-deployment.sh


# 1. Install jq for JSON file parsing
bash install-jq.sh

# 2. Accept path to config file, build version, path to tar ball
read -p "Enter the path to the config file followed by [ENTER]: " configpath
read -p "Enter the build version followed by [ENTER]: " buildversion
read -p "Enter the path to the tarball followed by [ENTER]: " tarballpath

# 3. Parse config.json file to deploy each artifact to each server
webhosts=$(cat $configpath/config.json | jq '.web.hosts[]')
for host in $webhosts
do
        gnome-terminal -x sh -c "echo $host \
        scp $tarballpath/web-$buildversion.tar.gz patrick@host:/mnt/company/ \
        ssh patrick@$host \
        cd /mnt/company/ \
        tar -xzf web-$buildversion.tar.gz \
        cd web-$buildversion \
        ./configure \
        make \
        sudo make install"
done

basehosts=$(cat $configpath/config.json | jq '.base.hosts[]')
for host in $basehosts
do
        gnome-terminal -x sh -c "echo $host \
        scp $tarballpath/base-$buildversion.tar.gz patrick@host:/mnt/company/ \
        ssh patrick@$host \
        cd /mnt/company/ \
        tar -xzf base-$buildversion.tar.gz \
        cd base-$buildversion \
        ./configure \
        make \
        sudo make install"
done

maphosts=$(cat $configpath/config.json | jq '.map.hosts[]')
for host in $maphosts
do
        gnome-terminal -x sh -c "echo $host \
        scp $tarballpath/map-$buildversion.tar.gz patrick@host:/mnt/company/ \
        ssh patrick@$host \
        cd /mnt/company/ \
        tar -xzf map-$buildversion.tar.gz \
        cd map-$buildversion \
        ./configure \
        make \
        sudo make install"
done
