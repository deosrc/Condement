#######################################
# Install Visual Studio Code
#######################################
exec { 'vscode-deb-download':
  command => 'curl -L https://update.code.visualstudio.com/latest/linux-deb-x64/stable -o /opt/vscode.deb',
  path    => '/usr/bin',
  creates => '/opt/vscode.deb'
}

package { [ 'libxss1',
            'libnss3',
            'libsecret-1-0' ]:
  ensure  => present
}

package { 'visual-studio-code':
  ensure   => present,
  provider => 'dpkg',
  source   => '/opt/vscode.deb',
  require  => [ Exec['vscode-deb-download'], Package['libxss1', 'libnss3', 'libsecret-1-0'] ]
}

# Configure folders for persistent storage
file { [
    '/mnt/persistent_storage/vscode',
    '/mnt/persistent_storage/vscode/user_home',
    '/mnt/persistent_storage/vscode/user_config'
  ]:
  ensure => directory,
  owner  => 'dev',
  group  => 'dev'
}

file { '/home/dev/.vscode':
  ensure  => link,
  target  => '/mnt/persistent_storage/vscode/user_home',
  require => File['/mnt/persistent_storage/vscode/user_home']
}

file { '/home/dev/.config/Code':
  ensure  => link,
  target  => '/mnt/persistent_storage/vscode/user_config',
  require => File['/mnt/persistent_storage/vscode/user_config']
}
