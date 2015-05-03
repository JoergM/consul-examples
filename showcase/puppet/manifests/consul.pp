#
# Puppet Manifest for the Consul server
#

class { 'consul':
  serverMode  => true,
  bindIp      => '192.168.60.80'
}

include consul
include update
include networking
include eop

Class[update] -> Class[networking]
              -> Class[consul]
              -> Class[eop]

