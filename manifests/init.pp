# == Class: gds_accounts
#
# Full description of class gds_accounts here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class gds_accounts (
) inherits gds_accounts::params {

  # validate parameters here

  anchor { 'gds_accounts::begin': } ->
  class { 'gds_accounts::install': } ->
  class { 'gds_accounts::config': }
  class { 'gds_accounts::service': } ->
  anchor { 'gds_accounts::end': }

  Anchor['gds_accounts::begin']  ~> Class['gds_accounts::service']
  Class['gds_accounts::install'] ~> Class['gds_accounts::service']
  Class['gds_accounts::config']  ~> Class['gds_accounts::service']
}
