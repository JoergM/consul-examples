#
# Puppet Manifest for the Consul Web UI
#

class { 'consul':
  serverMode  => false,
  servUI      => true,
  bindIp      => '192.168.60.90'
}

include consul
include update
include networking
include eop

Class[update] -> Class[networking]
              -> Class[consul]
              -> Class[eop]

