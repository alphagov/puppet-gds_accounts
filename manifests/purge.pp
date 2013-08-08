# == Class: gds_accounts::purge
#
# Purge unmanaged accounts.
#
# This class is not intended to be called directly.
#
class gds_accounts::purge {
  $purge         = $::gds_accounts::purge
  $purge_min_uid = $::gds_accounts::purge_min_uid

  resources { 'user':
    purge              => $purge,
    unless_system_user => $purge_min_uid,
  }
}
