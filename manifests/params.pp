# == Class gds_accounts::params
#
# This class is meant to be called from gds_accounts
# It sets variables according to platform
#
class gds_accounts::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'gds_accounts'
      $service_name = 'gds_accounts'
    }
    'RedHat', 'Amazon': {
      $package_name = 'gds_accounts'
      $service_name = 'gds_accounts'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
