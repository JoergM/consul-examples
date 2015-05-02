class haproxy::install {
  package { 'HA Proxy':
    name      => 'haproxy',
    ensure    => latest
  } ->

  # Minimal default configuration for haproxy

  file { '/etc/haproxy/haproxy.cfg':
    ensure    => 'present',
    owner     => 'consul',
    group     => 'consul',
    source    => 'puppet:///modules/haproxy/etc/haproxy/haproxy.cfg',
  } ->

  file { '/etc/default/haproxy':
    ensure    => 'present',
    owner     => 'consul',
    group     => 'consul',
    source    => 'puppet:///modules/haproxy/etc/default/haproxy',
    notify    => Service["haproxy"],
  }

}