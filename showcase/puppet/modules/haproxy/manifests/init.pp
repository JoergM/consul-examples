class haproxy {

  package { 'HA Proxy':
    name      => 'haproxy',
    ensure    => latest
  }
}