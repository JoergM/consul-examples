#
# Puppet Manifest for the HA proxy instance
#

class { 'consul':
  bindIp      => '192.168.60.50'
}

class { 'consul-template':
  templates   => {
    template1 => {
      source      => '/etc/consul-template.d/haproxy.cfg.ctmpl',
      destination => '/etc/haproxy/haproxy.cfg',
      command     => 'sudo service haproxy restart'
    }
  },
}

include consul
include consul-template
include eop
include haproxy
include networking
include update

Class[update] -> Class[networking]
              -> Class[consul]
              -> Class[consul-template]
              -> Class[haproxy]
              -> Class[eop]


