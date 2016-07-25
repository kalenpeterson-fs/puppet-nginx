# == Class: nginx::config
#
class nginx::config {
  # resources
  $nginx_conf = $::nginx::params::nginx_conf

  # Manage the main nginx config file
  file { 'nginx_config':
    ensure  => present,
    path    => $nginx_conf,
    notify  => Service['nginx'],
    content => epp('nginx/nginx.conf.epp'),
  }
}
