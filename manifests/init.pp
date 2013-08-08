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

  anchor { 'gds_accounts::begin': } ->
  anchor { 'gds_accounts::end': }
}
