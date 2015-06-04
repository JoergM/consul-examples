class haproxy::install {
  package { 'HA Proxy':
    name      => 'haproxy',
    ensure    => latest
  } ->

  # Minimal default configuration for haproxy

  file { '/etc/haproxy':
    ensure    => 'directory',
    owner     => 'root',
    group     => 'consul',
    mode      => '775',
  } ->

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

  file { '/etc/consul-template.d/haproxy.cfg.ctmpl':
    ensure    => 'present',
    owner     => 'consul',
    group     => 'consul',
    source    => 'puppet:///modules/haproxy/etc/consul-template.d/haproxy.cfg.ctmpl',
  }

}