#
# Puppet Manifest for the timestamp service I
#

class { 'consul':
  bindIp      => '192.168.60.60'
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
