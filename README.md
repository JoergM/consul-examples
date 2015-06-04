# Consul examples

This repository contains example setups for certain functionality of [consul](http://consul.io).

## Simple examples

These examples focus on specific functionality. 

The examples are:

* [Simple DNS Setup](dns/)
* [Using the http-api](http_api/)
* [Service Checks](checks/)
* [Locks, Watches and Events](events_watches_locks/)

### General usage 

You will need a local installation of consul.

To use the examples you have to checkout this repository, change into the directory of the example and then follow the instructions the README file of the respective example.

### Consul UI

All examples are setup in a way, that consul UI is started too. Therefore the folder [ui](ui/) contains the official consul ui files. It is configured in all simple examples.

Point your browser to [http://localhost:8500/ui](http://localhost:8500/ui)

## Complex showcase

There is also a [complex showcase](showcase/) which demonstrates the combined usage of Consul, [Consul-Template](https://github.com/hashicorp/consul-template) and [HAProxy](http://www.haproxy.org) to enable Service Discovery.

## Presentation slides

The slides of the presentation in german can also be found in this repository:

* [German slides](Slides_german.pdf)