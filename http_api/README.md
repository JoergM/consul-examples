This example shows some usages of the HTTP API

## Starting Consul

The following script cleans potential left overs and starts consul with the configuration file.

```
./start_consul.sh
```

## Find Services and Service Nodes

There is one Service registered via configuration file. This can be retrieved by:

```
curl localhost:8500/v1/catalog/service/example
```

The result is json containing all relevant info for this service. 

All services can be retrieved by:

```
curl localhost:8500/v1/catalog/services
```

## Register a Service 

There are two APIs that can be used to register services. The catalog API we already used for retrieving service information. The alternative is to use the Agent API. This API is used for communication with your local agent. 

Registering a service using the Agent API:

```
curl -X PUT -d @service.json localhost:8500/v1/agent/service/register
```

The file service.json contains the service definition like this:
```
{
  "ID": "example2",
  "Name": "example2",
  "Tags": [
    "specific",
    "v1"
  ],
  "Address": "127.0.0.1",
  "Port": 8000,
}
```

You can check whether this was succesful by using the Agent API again:

```
curl localhost:8500/v1/agent/services
```

## Key-Value Store

Store a new Value:

```
curl -X PUT -d @- localhost:8500/v1/kv/example <<< FooValue
```

Reading Values is a bit more complicated because they are stored base64 encoded. A simple query looks like this

```
curl -s localhost:8500/v1/kv/example
```

The result looks like this:

```
[
  {
    "CreateIndex": 97,
    "ModifyIndex": 111,
    "LockIndex": 0,
    "Key": "example",
    "Flags": 0,
    "Value": "Rm9vVmFsdWU="
  }
]
```

The Value is base64 encoded which allows to store binary values. 

If you Simply want the raw value for a key use the _?raw_ parameter.

```
curl -s localhost:8500/v1/kv/example?raw
```

In this example you would get _FooValue_. 
