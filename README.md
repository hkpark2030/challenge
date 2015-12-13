This task is to facilitate deployment of the software into a cluster of Linux
servers. Each build consists of a set of tarballs named as `<artifact>-<Version#>.tar.gz`
accompanied by a `config.json` that describes which hosts each artifact should be 
deployed to: <br />

###### 0.1. Added user account to visudo for no password input during run
$sudo visudo
patrick ALL=(ALL:ALL) NOPASSWD: ALL

###### 0.2. Clone the bash scripts from the Git repository then run the script
$git clone https://github.com/hkpark2030/challenge.git
$cd challenge
$bash deploy-web-base-map.sh
