# == Class: openssh-server
#
# Sets openssh-server
#
# === Parameters
#
# [ssh_port]
#   Sets the SSH port that the server should listen on
#   Defaults to 22
#
# === Variables
#
# none
#
# === Examples
#
# include openssh-server
#
# === Authors
#
# George Ornbo <george@shapeshed.com>
#
# === Copyright
#
# Copyright 2012 George Ornbo, unless otherwise noted.
#
class openssh-server($ssh_port = 22) {
  package { "openssh-server":
	ensure => installed
  }

  file { "/etc/ssh/sshd_config" :
	mode => 444,
	content => template("openssh-server/sshd_config.erb")
  }
  service { "ssh":
	ensure => running,
	subscribe => file["/etc/ssh/sshd_config"]
  }

}
