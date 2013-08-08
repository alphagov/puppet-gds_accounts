# == Class: gds_accounts
#
# Manage accounts for GDS users. Wrapper for `torrancew/account`
#
# === Parameters
#
# [*accounts*]
#   Hash of accounts which will be passed to the `account` module.
#   Default: {}
#
# [*group*]
#   Secondary group to be applied to all accounts.
#   Default: gds
#
class gds_accounts (
  $accounts = {},
  $group = 'gds'
) {
  if $::osfamily != 'Debian' {
    fail("${::operatingsystem} not supported")
  }

  validate_hash($accounts)
  validate_string($group)

  anchor { 'gds_accounts::begin': } ->
  class { 'gds_accounts::create': } ->
  anchor { 'gds_accounts::end': }
}
