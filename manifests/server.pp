# == Define: nginx::server
#
define nginx::server (
  $port     = undef,
  $web_root = undef,
) {

  $server_name = $title
  $nginx_confd = $::nginx::params::nginx_confd

  # Manage the server definition
  file {"${server_name}_conf":
    ensure  => present,
    path    => "${nginx_confd}/${server_name}.conf",
    notify  => Service['nginx'],
    content => epp('nginx/server.conf.epp', {
      'server_name' => $server_name,
      'port'        => $port,
      'web_root'    => $web_root
    }),
  }
}
