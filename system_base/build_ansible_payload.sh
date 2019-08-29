#!/bin/bash

function configure_role {
    type=$1
    id=$2

    echo "Configuring Ansible role for $id $type..."
    mkdir -p /vagrant/.condement/roles/$type-$id
    cp -r /vagrant/$type/$id/* /vagrant/.condement/roles/$type-$id
}

rm -r /vagrant/.condement

echo "Configuring Ansible role for Condement base..."
mkdir -p /vagrant/.condement/roles/condement-base
cp -r /vagrant/system_base/ansible_base/* /vagrant/.condement/roles/condement-base

for d in /vagrant/desktop/*/; do
    id=${d:17:-1}
    configure_role "desktop" $id
done

for s in /vagrant/software/*/; do
    id=${s:18:-1}
    configure_role "software" $id
done

cp /vagrant/system_base/site.yaml /vagrant/.condement/site.yaml