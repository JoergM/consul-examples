# Service Checks

This example shows service checks based on scripts. Please take a look at consul.json to see how the services and checks are configured.

## Starting Consul

There is a script that starts consul with the configuration in consul.json:

```
./start_consul.sh
```

If you started the DNS example before, the script can not delete the content in /tmp/consul because it was run as root Please delete it manually using: 

```
sudo rm -rf /tmp/consul
``` 

## The Check-Scripts

There are two services defined and each has one check-script associated. One script always returns good and one always failes. The failing script is shown below.

```
#!/bin/sh

echo "This failed badly"
exit 2
```

The conventions in consul are simple. a return value of 0 means no problems, 1 means warning and everything else is critical.

## Show checks in Consul-UI

When you open [http://localhost:8500/ui](http://localhost:8500/ui) you will see both services. One of them will be failed, the other will be ok.

If example_green is not ok, wait a few seconds and reload. The checks are configured to run every 15 seconds.

## Validating Checks via http-api

Using the Http-API to find the status of checks for a service:

```
curl localhost:8500/v1/health/service/example_green
```

The same for the failing service: 
```
curl localhost:8500/v1/health/service/example_failed
```

The results look like this:

```
[
  {
    "Node": {
      "Node": "tatooine",
      "Address": "192.168.178.42"
    },
    "Service": {
      "ID": "example_failed",
      "Service": "example_failed",
      "Tags": null,
      "Address": "127.0.0.1",
      "Port": 4567
    },
    "Checks": [
      {
        "Node": "tatooine",
        "CheckID": "service:example_failed",
        "Name": "Service 'example_failed' check",
        "Status": "critical",
        "Notes": "",
        "Output": "",
        "ServiceID": "example_failed",
        "ServiceName": "example_failed"
      },
      {
        "Node": "tatooine",
        "CheckID": "serfHealth",
        "Name": "Serf Health Status",
        "Status": "passing",
        "Notes": "",
        "Output": "Agent alive and reachable",
        "ServiceID": "",
        "ServiceName": ""
      }
    ]
  }
]
```

Even if there is only one check defined there is a second check. This is based on the health of the node itself. It failes when the node is not reachable.

## Overview of multiple checks

The Http-API also allows to list all service-checks in a certain state. To see all services in critical state use:

```
curl localhost:8500/v1/health/state/critical
```

In our example the result is:

```
[
  {
    "Node": "tatooine",
    "CheckID": "service:example_failed",
    "Name": "Service 'example_failed' check",
    "Status": "critical",
    "Notes": "",
    "Output": "",
    "ServiceID": "example_failed",
    "ServiceName": "example_failed"
  }
]
```

This is pretty useful for monitoring the consul network without knowledge of a specific service-name.  