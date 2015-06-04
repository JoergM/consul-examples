class timeservice($nodeID = undef) {

  include 'timeservice::install'
  include 'timeservice::service'

  Class[timeservice::install] -> Class[timeservice::service]
}