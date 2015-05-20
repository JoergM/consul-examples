#
# Puppet Manifest for the timestamp service II
#

class { 'consul':
  bindIp      => '192.168.60.100',
  nodeID      => 'ts3'
}

include consul
include eop
include java7
include networking
include update
include timeservice


Class[update] -> Class[java7]
              -> Class[networking]
              -> Class[timeservice]
              -> Class[consul]
              -> Class[eop]

