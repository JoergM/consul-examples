class eop {
    file { '/puppet-executed': ensure => present, content => "eop", mode => 0444}

}
