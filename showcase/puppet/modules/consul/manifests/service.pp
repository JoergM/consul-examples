class consul::service {
  service { 'consul':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => 'upstart'

  }
}