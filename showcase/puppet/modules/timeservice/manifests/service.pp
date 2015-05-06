class timeservice::service {
  service { 'timeservice':
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => 'upstart'
  }
}