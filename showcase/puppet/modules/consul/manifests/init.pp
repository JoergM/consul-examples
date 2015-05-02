class consul ($serverMode = 'false',
              $bindIp) {

  include 'consul::install'
  include 'consul::service'

  Class[consul::install] -> Class[consul::service]
}