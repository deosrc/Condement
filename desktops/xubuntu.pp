#######################################
# Install Desktop UI & useful GUI tools
#######################################
package { 'xubuntu-desktop':
  ensure          => present,
  install_options => '--no-install-recommends'
}

package { 'gnome-software':
  ensure  => present,
  require => Package['xubuntu-desktop']
}
