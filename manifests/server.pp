# == Define: nginx::server
#
define nginx::server (
  $port         = undef,
  $web_root     = undef,
  $server_names = $::nginx::params::server_names
) {

  $server      = $title
  $nginx_confd = $::nginx::params::nginx_confd

  # Manage the server definition file
  file {"${server}_conf":
    ensure  => present,
    path    => "${nginx_confd}/${server}.conf",
    notify  => Service['nginx'],
    content => epp('nginx/server.conf.epp', {
      'server_names' => $server_names,
      'port'         => $port,
      'web_root'     => $web_root
    }),
  }
}
