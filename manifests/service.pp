# == Class: nginx::service
#
class nginx::service {
  # resources

  $service_name = $::nginx::params::service_name

  service { 'nginx':
    ensure     => running,
    name       => $service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
