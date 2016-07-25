# == Class: nginx::config
#
class nginx::config (
  $user  = $::nginx::params::user,
  $group = $::nginx::params::group
){
  # resources
  $nginx_conf = $::nginx::params::nginx_conf

  # Manage the main nginx config file
  file { 'nginx_config':
    ensure  => present,
    path    => $nginx_conf,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['nginx'],
    content => epp('nginx/nginx.conf.epp', {
      'user'  => $user,
      'group' => $group
    }),
  }
}
