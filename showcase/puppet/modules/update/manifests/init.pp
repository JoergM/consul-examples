class update {
  exec { 'APT Package Index Update':
    command => '/usr/bin/apt-get update',
    timeout => 600,
  }

}