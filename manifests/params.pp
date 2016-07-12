# == Class: nginx::params
#
class nginx::params {
  # resources

  # Pre-reqs
  case $::osfamily {
    'RedHat': {
      $prereq_package_names = ['epel-release']
      $package_name = 'nginx'
      $service_name = 'nginx'
    }
    default: {
      fail("Module kpeterson-nginx does not support ${::osfamily}")
    }
  }
}
