#
# Puppet Manifest for the HA proxy instance
#

include consul
include eop
include haproxy
include update

Class[update] -> Class[haproxy]
  -> Class[consul] -> Class[eop]

