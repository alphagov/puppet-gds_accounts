# == Class: gds_accounts::create
#
# Create group and account resources.
#
# This class is not intended to be called directly.
#
class gds_accounts::create {
  $accounts = $::gds_accounts::accounts
  $group    = $::gds_accounts::group

  group { $group:
    ensure => present,
  }

  create_resources('account', $accounts, {
    groups       => [$group],
    create_group => false,
    require      => Group[$group],
  })
}
