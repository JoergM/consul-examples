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

TODO



