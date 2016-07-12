# == Class: nginx::config
#
class nginx::config {
  # resources

  $service_name = $::nginx::params::service_name

  service { $service_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
