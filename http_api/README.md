This example shows some usages of the HTTP API

## Starting Consul

The following script cleans potential left overs and starts consul with the configuration file.

```
./start_consul.sh
```

## Services API

There is one Service registered via configuration file. This can be retrieved:

```
curl localhost:8500/v1/catalog/service/example
```

The result is json containing all relevant info for this service. 

All services can be retrieved by:

```
curl localhost:8500/v1/catalog/services
```


## Register a Service 

Creating a new Service works by:

```

```

## Key-Value Store

