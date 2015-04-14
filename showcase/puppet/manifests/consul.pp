#
# Puppet Manifest for the Consul server
#

include consul
include update
include eop

Class[update]
  -> Class[consul] -> Class[eop]

