# == Class: gds_accounts::create
#
# Create group and account resources.
#
# This class is not intended to be called directly.
#
class gds_accounts::create {
  $accounts = $::gds_accounts::accounts
  $groups   = $::gds_accounts::groups

  group { $groups:
    ensure => present,
  }

  create_resources('account', $accounts, {
    groups       => $groups,
    create_group => false,
    require      => Group[$groups],
  })
}
