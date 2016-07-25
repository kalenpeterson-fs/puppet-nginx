# == Class: nginx::config
#
class nginx::config {
  # resources
  $nginx_conf = $::nginx::params::nginx_conf
  $port       = $::nginx::params::port

  # Manage the main nginx config file
  file { 'nginx_config':
    ensure  => present,
    path    => $nginx_conf,
    content => epp('nginx/nginx.conf.epp', {'port' => $port}),
    notify  => Service['nginx'],
  }


}
