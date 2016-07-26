# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation
# errors and view a log of events) or by fully applying the test in a virtual
# environment (to compare the resulting system state to the desired state).
#
# Learn more about module testing here:
# https://docs.puppetlabs.com/guides/tests_smoke.html
#

$srv_root = '/srv'
$web_root = "${srv_root}/puppet"
$web_source = 'https://github.com/puppetlabs/exercise-webpage.git'

file { $srv_root:
  ensure => directory,
  owner  => 'root',
  group  => 'root',
  mode   => '0755',
}

vcsrepo { $web_root:
  ensure   => latest,
  provider => git,
  source   => $web_source,
  require  => File[$srv_root],
}

class { '::nginx': }

::nginx::server { 'puppet':
  port     => 8000,
  web_root => $web_root,
}
