# == Class gds_accounts::service
#
# This class is meant to be called from gds_accounts
# It ensure the service is running
#
class gds_accounts::service {
  include gds_accounts::params

  service { $gds_accounts::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
