# == Class: nginx::install
#
class nginx::install {
  # resources
  $prereq_package_names = $::nginx::parmas::prereq_package_names
  $package_name = $::nginx::parmas::package_name

  package { $prereq_package_names:
    ensure => installed,
    before => Package['nginx'],
  }

  package { 'nginx':
    ensure => installed,
    name   => $package_name,
  }
}
