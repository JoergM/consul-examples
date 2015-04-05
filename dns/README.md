# Using Consul DNS in a simple setup

This setup will start consul as DNS server which will forward all DNS requests that can't be answered
to the Google DNS Server 8.8.8.8

## Starting Consul

There is a config file located in this Directory. So simply:

``` 
sudo consul agent -config-file consul.json
```

sudo is necessary to start DNS on port 53. 

## Query DNS

You can test this setup using dig:

```
dig @127.0.0.1 $(hostname).node.consul
```

Lookup of the consul service itself:

```
dig @127.0.0.1 consul.service.consul
```

Lookup including SRV Record (for Port information)

```
dig @127.0.0.1 consul.service.consul SRV
```

## Set as DNS Server

WARNING: Please change your DNS Server only if you know how to revert this :)

Simply set your DNS Server to **127.0.0.1** 

Know every program should be able to resolve addresses within the *consul* Top Level Domain. 