#!/bin/bash

sudo rm -rf /tmp/consul
sudo consul agent -config-file consul.json
