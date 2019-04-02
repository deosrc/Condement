#######################################
# Install Desktop UI & useful GUI tools
#######################################
package { 'ubuntu-desktop':
  ensure          => present,
  install_options => '--no-install-recommends'
}

package { 'gnome-software':
  ensure  => present,
  require => Package['ubuntu-desktop']
}
