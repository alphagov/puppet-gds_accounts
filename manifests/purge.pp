# == Class: gds_accounts::purge
#
# Purge unmanaged accounts.
#
# This class is not intended to be called directly.
#
class gds_accounts::purge {
  $purge         = $::gds_accounts::purge
  $purge_min_uid = $::gds_accounts::purge_min_uid
  $purge_ignore  = $::gds_accounts::purge_ignore

  resources { 'user':
    purge              => $purge,
    unless_system_user => $purge_min_uid,
  }

  if $purge_ignore != [] {
    user { $purge_ignore:
      ensure => undef,
    }
  }
}
