#######################################
# Install Docker
#######################################
# Set the default path for all exec resources in this file.
Exec {
  path => ['/usr/local/sbin','/usr/local/bin','/usr/sbin','/usr/bin','/sbin','/bin']
}

package { 'apt-transport-https':
  ensure => present
}

package { 'ca-certificates':
  ensure => present
}

package { 'gnupg-agent':
  ensure => present
}

package { 'software-properties-common':
  ensure => present
}

exec { 'install-docker-repo-key':
  command => 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -',
  creates => '/etc/apt/trusted.gpg',
  require => Package['apt-transport-https', 'ca-certificates', 'gnupg-agent', 'software-properties-common']
}

exec { 'apt-update':
  command => 'apt update',
  require => Exec['install-docker-repo-key']
}

exec { 'add-docker-repository':
  command => 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"',
  require => Exec['apt-update']
}

package { 'docker-ce-cli':
  ensure  => present,
  require => Exec['add-docker-repository']
}

package { 'containerd.io':
  ensure  => present,
  require => Exec['add-docker-repository']
}

package { 'docker-ce':
  ensure  => present,
  require => Exec['add-docker-repository']
}

exec { 'add-docker-group-to-dev-user':
  command => 'usermod -G docker -a dev',
  require => Package['docker-ce']
}

# Persist ~/.docker/config.json (has credentials for registries)
file { [
    '/mnt/persistent_storage/docker',
    '/mnt/persistent_storage/docker/user_home'
  ]:
  ensure => directory,
  owner  => 'dev',
  group  => 'dev'
}

file { '/home/dev/.docker':
  ensure  => link,
  target  => '/mnt/persistent_storage/docker/user_home',
  require => File['/mnt/persistent_storage/docker/user_home']
}
