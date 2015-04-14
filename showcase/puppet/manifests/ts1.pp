#
# Puppet Manifest for the timestamp service I
#

include consul
include eop
include java7
include update


Class[update] -> Class[java7]
  -> Class[consul] -> Class[eop]
