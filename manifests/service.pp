# == Class: nginx::service
#
class nginx::service {

  $service_name = $::nginx::params::service_name

  service { 'nginx':
    ensure     => running,
    name       => $service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
