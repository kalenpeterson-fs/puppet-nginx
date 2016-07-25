# == Class: nginx::config
#
class nginx::config (
  $user  = $::nginx::params::user,
  $group = $::nginx::params::group
){
  # resources
  $nginx_conf = $::nginx::params::nginx_conf
  $server_root = $::nginx::parmas::server_root

  # Manage the main nginx config file
  file { 'nginx_config':
    ensure  => present,
    path    => $nginx_conf,
    user    => $user,
    group   => $group,
    mode    => '0644',
    notify  => Service['nginx'],
    content => epp('nginx/nginx.conf.epp', {
      'user'  => $user,
      'group' => $group
    }),
  }
}
