class update {
  exec { 'APT Package Index Updatae':
    command => '/usr/bin/apt-get update',
    timeout => 600,
  }

}