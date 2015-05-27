#!/bin/sh

if [ ! -d exchange ]; then
    echo "Must be called from the showcase directory!";
    exit 1;
fi

if [ -e exchange/consul.zip ]; then
    echo "There is an existing Consul distribution below exchange";
    echo "Will not fetch it again"
else
    wget https://dl.bintray.com/mitchellh/consul/0.5.2_linux_386.zip -O exchange/consul.zip
fi


if [ -e exchange/consul-template.zip ]; then
    echo "There is an existing Consul Template distribution below exchange";
    echo "Will not fetch it again";
else 
    wget https://github.com/hashicorp/consul-template/releases/download/v0.9.0/consul-template_0.9.0_linux_386.tar.gz -O exchange/consul-template.tar.gz
fi

( cd exchange ; unzip -u consul.zip )
( cd exchange ; tar -zxvf consul-template.tar.gz )