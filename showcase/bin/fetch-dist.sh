#!/bin/sh

if [ ! -d exchange ]; then
    echo "Must be called from the showcase directory!";
    exit 1;
fi

if [ -e exchange/consul.zip ]; then
    echo "There is an existing Consul distribution below exchange";
    echo "Will not fetch it again"
else
    wget https://dl.bintray.com/mitchellh/consul/0.5.0_linux_386.zip -O exchange/consul.zip
fi

( cd exchange ; unzip -u consul.zip )