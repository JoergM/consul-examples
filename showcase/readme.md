# Showcase to demonstrate various features of Consul

In this directory we provide a running setup for 
various features of Consul in a small network.

Please keep in mind: This is only a showcase to help us to 
demonstrate various features of Consul and shoudn't be 
used as template for you production environment.

## Requirements

To run this network you need a working 
[Vagrant](https://www.vagrantup.com/) installation.

## Starting the cluster

You can start the Consul cluster by the following command

    vagrant up con ts1 ts2 ui ha
    
## Access the Consul and the provided services

After starting the Vagrant cluster you can access the 
provided services via the following addresses on
the host machine of the cluster:

Service          | URL
-----------------| ----------------------
Consul Web UI    | http://localhost:8500/
Timeservice REST API | http://localhost:10080/now/

