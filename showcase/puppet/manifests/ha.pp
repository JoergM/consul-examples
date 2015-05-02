#
# Puppet Manifest for the HA proxy instance
#

class { 'consul':
  bindIp      => '192.168.60.50'
}


include consul
include consul-template
include eop
include haproxy
include networking
include update

Class[update] -> Class[networking]
              -> Class[haproxy]
              -> Class[consul]
              -> Class[consul-template]
              -> Class[eop]


