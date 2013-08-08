# == Class gds_accounts::params
#
# This class is meant to be called from gds_accounts
# It sets variables according to platform
#
class gds_accounts::params {
  case $::osfamily {
    'Debian': {
    }
    'RedHat', 'Amazon': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
