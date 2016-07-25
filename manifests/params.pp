# == Class: nginx::params
#
class nginx::params {
  # resources

  # Pre-reqs
  case $::osfamily {
    'RedHat': {
      $prereq_package_names = ['epel-release']
      $package_name         = 'nginx'
      $service_name         = 'nginx'
      $conf_root            = '/etc/nginx'
    }
    default: {
      fail("Module kpeterson-nginx does not support ${::osfamily}")
    }
  }

  $nginx_conf   = "${conf_root}/nginx.conf"
  $nginx_confd  = "${conf_root}/conf.d"
  $server_names = "localhost ${::hostname} ${::fqdn}"
}
