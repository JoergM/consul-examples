# Consul examples

This repository contains example setups for certain functionality of [consul](http://consul.io).

## Simple examples

These examples focus on specific functionality. 

The examples are:

* [Simple DNS Setup](dns/README.md)
* [Using the http-api](http_api/README.md)
* [Service Checks](checks/REAMDME.md)

You will need a local installation of consul.

To use the examples you have to checkout this repository, change into the directory of the example and then follow the instructions the README file of the respective example.

## Complex showcase

There is also a [complex showcase](showcase/readme.md) which demonstrates the combined usage of Consul, [Consul-Template](https://github.com/hashicorp/consul-template) and [HAProxy](http://www.haproxy.org) to enable Service Discovery.