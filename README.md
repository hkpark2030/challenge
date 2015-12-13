This task is to facilitate deployment of the software into a cluster of Linux
servers. Each build consists of a set of tarballs named as `<artifact>-<Version#>.tar.gz`
accompanied by a `config.json` that describes which hosts each artifact should be 
deployed to. <br /><br />

###### 0.1. Added user account to visudo for no password input during run
$sudo visudo <br />
patrick ALL=(ALL:ALL) NOPASSWD: ALL

###### 0.2. Clone the bash scripts from the Git repository then run the script
$git clone https://github.com/hkpark2030/challenge.git <br />
$cd challenge <br />
$bash deploy-web-base-map.sh

###### 1. Install jq for JSON file parsing
install `jq` to parse `config.json` file

###### 2. Accept path to config file, build number, path to tar ball
read input from the console

###### 3. Parse config.json file Ato deploy each artifact to each server
