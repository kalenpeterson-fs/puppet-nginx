# == Class: nginx::install
#
class nginx::install (
    $user  = $::nginx::params::user,
    $group = $::nginx::params::group
){

  $prereq_package_names = $::nginx::params::prereq_package_names
  $package_name         = $::nginx::params::package_name

  user { $user:
    ensure => present,
    gid    => $group,
    before => Package['nginx'],
  }

  package { $prereq_package_names:
    ensure => installed,
    before => Package['nginx'],
  }

  package { 'nginx':
    ensure => installed,
    name   => $package_name,
  }
}
