class consul-template($templates) {

  include 'consul-template::install'
  include 'consul-template::service'

  Class[consul-template::install] -> Class[consul-template::service]
}