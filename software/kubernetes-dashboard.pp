#######################################
# Install Kubernetes Dashboard to k3s
#######################################

# Set the default path for all exec resources in this file.
Exec {
  path => ['/usr/local/sbin','/usr/local/bin','/usr/sbin','/usr/bin','/sbin','/bin']
}

exec { 'k3s-dashboard':
  command  => 'k3s kubectl apply -f /vagrant/kubernetes/k3s-dashboard.yml'
}
