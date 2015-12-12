This task is to facilitate deployment of the software into a cluster of Linux
servers. Each build consists of a set of tarballs named as ‘<artifact>-<Version#>.tar.gz’
accompanied by a JSON configuration that describes which hosts each artifact should be 
deployed to: <br />

###### Build	artifacts
web-3678.tar.gz <br />
base-3678.tar.gz <br />
map-3678.tar.gz <br />

###### Configuration	file
`
{

"web":{
"hosts":[
"devops-test-web1.company.com",
"devops-test-web2.company.com",
"devops-test-web3.company.com"
]
},

"base":{
"hosts":[
"devops-test-base1.company.com",
"devops-test-base2.company.com"
]
},

"map":{
"hosts":[
"devops-test-map1.company.com",
"devops-test-map2.company.com"
]
}

}
`
 <br /> <br />
Deployment script must accept path to the configuration file, build version and path to 
the folder containing tarballs as command line arguments.  <br />
All target servers are accessible by SSH.  <br />
The deployment script will be launched by a user with privileges sufficient to connect and make changes on target servers.  <br />
Content of the tarballs should be deployed to folders named as follows: ‘/mnt/company/<artifact>/’.  <br />
If possible, make it easier to rollback to the previous version of software. <br />
