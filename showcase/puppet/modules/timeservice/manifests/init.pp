class timeservice {

  include 'timeservice::install'
  include 'timeservice::service'

  Class[timeservice::install] -> Class[timeservice::service]
}