
## Intro
This is a sample project to show how Spark cluster can be deployed in an automated way on an OpenStack based 
clouds such as the pouta.csc.fi.  


## Setup

Install [SBT](http://www.scala-sbt.org/release/tutorial/Setup.html) first if you are interested to compile and 
the the scala version of the sample code. There is a python version of the sample code otherwise. 

1. Use `sbt package` to compile and package the scala version of the code.
2. Fill in your credentials in `scripts/env.sh`. for pouta.csc.fi you can find at [CSC] (them in https://pouta.csc.fi/dashboard/project/access_and_security/) under the API access tab.
3. Source the credentials using `source scripts/env.sh`
4. Upload the this project folder to a cloud instance and install [docker](https://docs.docker.com/engine/install/) and [docker-machine](https://docs.docker.com/machine/install-machine/) on it. 
5. ssh to the cloud instance and run `sh scripts/create.sh`  to create the Spark cluster. 
6. run `sh scripts/run-scala.sh` or `sh scripts/run-python.sh` to run the sample code on the cluster.
7. run `sh scripts/destroy.sh` to destroy the Spark cluster. 


