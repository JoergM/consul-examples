#!/bin/bash

rm -rf /tmp/consul
consul agent -config-file consul.json
