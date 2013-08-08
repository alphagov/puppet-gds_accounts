# == Class gds_accounts::intall
#
class gds_accounts::install {
  include gds_accounts::params

  package { $gds_accounts::params::package_name:
    ensure => present,
  }
}
