class consul {

  include 'consul::install'
  include 'consul::service'

  Class[consul::install] -> Class[consul::service]
}