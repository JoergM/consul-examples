#
# Puppet Manifest for the Consul server
#

class { 'consul':
  serverMode  => 'true'
}

include consul
include update
include eop

Class[update]
  -> Class[consul] -> Class[eop]

