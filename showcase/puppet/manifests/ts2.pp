#
# Puppet Manifest for the timestamp service II
#

class { 'consul':
  bindIp      => '192.168.60.70'
}

include consul
include eop
include java7
include networking
include update


Class[update] -> Class[java7]
              -> Class[networking]
              -> Class[consul]
              -> Class[eop]

