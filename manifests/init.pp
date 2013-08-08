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
# [*purge*]
#   Boolean value, whether non-system accounts that aren't managed by Puppet
#   should be purged.
#   Default: true
#
# [*purge_min_uid*]
#   Integer value, minimum UID for a non-system account.
#   Default: undef (defers to Puppet default)
#
# [*purge_ignore*]
#   Array of account names to ignore when purging. This will create dummy
#   `User { ensure => undef }` resources for each.
#
#   WARNING: Should only be used in development environments to prevent
#   `vagrant` and `vboxadd` from being removed. Presents a security risk if
#   used in production.
#
#   Default: []
#
class gds_accounts (
  $accounts = {},
  $group = 'gds',
  $purge = true,
  $purge_min_uid = undef,
  $purge_ignore = []
) {
  if $::operatingsystem != 'Ubuntu' {
    fail("${::operatingsystem} not supported")
  }

  validate_hash($accounts)
  validate_string($group)
  validate_bool($purge)
  validate_re($purge_min_uid, '^([0-9]+|)$')
  validate_array($purge_ignore)

  anchor { 'gds_accounts::begin': } ->
  class { 'gds_accounts::create': } ->
  class { 'gds_accounts::purge': } ->
  anchor { 'gds_accounts::end': }
}
