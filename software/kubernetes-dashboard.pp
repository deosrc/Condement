#######################################
# Install Kubernetes Dashboard to k3s
#######################################

# Set the default path for all exec resources in this file.
Exec {
  path => ['/usr/local/sbin','/usr/local/bin','/usr/sbin','/usr/bin','/sbin','/bin']
}

exec { 'kubernetes-dashboard':
  command  => 'k3s kubectl apply -f /vagrant/kubernetes/kubernetes-dashboard.yml'
}

host { 'k8s.localtest.me':
  ensure  => present,
  comment => 'Kubernetes Dashboard on localhost',
  ip      => '127.0.0.1'
}

file { '/etc/kubernetes_logo.png':
  ensure  => file,
  source  => '/vagrant/kubernetes/logo.png',
}

file { '/home/dev/Desktop/Kubernetes Dashboard.desktop':
  ensure  => file,
  owner   => 'dev',
  group   => 'dev',
  mode    => '0750',
  source  => '/vagrant/kubernetes/Kubernetes Dashboard.desktop',
  require => File['/etc/kubernetes_logo.png']
}
