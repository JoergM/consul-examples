class consul ($serverMode = false,
              $servUI = false,
              $nodeID = undef,
              $bindIp) {

  include 'consul::install'
  include 'consul::service'

  Class[consul::install] -> Class[consul::service]
}