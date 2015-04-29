## Purpose

Locks, Events and Watches are mechanisims provided by consul to simplify orchestration of services.

The following examples show their usage with a focus on command line. This is especially useful when creating shell-scripts for deployments and other regular tasks. 

## Starting Consul

The following script cleans potential left overs and starts consul with the configuration file.

```
./start_consul.sh
```

## Locks

Consul provides this mechanism to allow simple distributed locks across all connected servers.

For the following example you need 2 shell windows.

In the first session enter:

```
consul lock LockA sleep 15
```

This simulates a long running command. 

Now in the second shell enter

```
consul lock LockA echo released
```

You will see that the second command blocks until the first command is finished. Then it will run and print "released". This would also work across multiple machines which makes it powerful.

Using the option -n you can allow more than one lock holder. The example shows a maximum number of 5 holders

```
consul lock -n 5 <lockprefix> <command>
```

## Watches 

[Watches](https://consul.io/docs/agent/watches.html) allow to react to different types of changes in the consul data. The following example shows watching a key-value entry.

First the entry has to be created:

```
curl -X PUT -d @- localhost:8500/v1/kv/application/online <<< true
```

Alternatively you can use the UI at [http://localhost:8500/ui](http://localhost:8500/ui) to create a key named "application/online" and give it a value "true"

Now you need to open a second shell window again to see the effect of the watch. In the first window enter:

```
consul watch -type keyprefix application/online cat 
```

Each time the value of the key changes Consul will call the command (cat in this case) and provides all information about the event as JSON. 

Change the value via UI or in another shell window via: 

```
curl -X PUT -d @- localhost:8500/v1/kv/application/online <<< false
```

You will see a line with JSON like this:

```
[{"Key":"application/online","CreateIndex":5,"ModifyIndex":9,"LockIndex":0,"Flags":0,"Value":"ZmFsc2U=","Session":""}]
```

Values are always base64 encoded. 

The consul watch command will keep watching until you interrupt it with a Ctrl-C.

## Events

Watches can also be used to listen for custom events. To create such a custom event You can use the ["event" command](https://consul.io/docs/commands/event.html). 

Use the following to listen for a custom event:

```
consul watch -type event -name exampleEvent cat
```

Now in another shell window enter:

```
consul event -name exampleEvent "Event Payload"
```

The watch will now output something like: 

```
[{
	"ID":"0c0fddad-bfe7-2c4d-2ba8-f95aa4e72137",
	"Name":"exampleEvent",
	"Payload":"RXZlbnQgUGF5bG9hZA==",
	"NodeFilter":"",
	"ServiceFilter":"",
	"TagFilter":"",
	"Version":1,
	"LTime":2
}]
```

The Payload is Base64 encoded. Your program would have to decode it (which cat does not :) ) The Base64 encoding allows to send binary payload as well.
