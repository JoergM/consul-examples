class consul-template::service {
  service { 'consul-template':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => 'upstart'
  }
}