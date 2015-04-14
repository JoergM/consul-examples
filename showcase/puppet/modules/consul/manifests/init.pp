class consul {

  exec { 'Installation of Consul':
    command => '/bin/cp /exchange/consul /usr/local/bin',
  } ->

  exec { 'Make Consul executable':
    command => '/bin/chmod 755 /usr/local/bin/consul'
  }
}