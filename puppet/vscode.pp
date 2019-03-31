#######################################
# Install Visual Studio Code
#######################################
exec { 'vscode-deb-download':
  command => 'curl -L https://update.code.visualstudio.com/latest/linux-deb-x64/stable -o /opt/vscode.deb',
  path    => '/usr/bin',
  creates => '/opt/vscode.deb'
}

package { 'libxss1':
  ensure => present
}

package { 'visual-studio-code':
  ensure   => present,
  provider => 'dpkg',
  source   => '/opt/vscode.deb',
  require  => [ Exec['vscode-deb-download'], Package['libxss1'] ]
}
