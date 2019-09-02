#!/bin/bash

function configure_role {
    type=$1
    id=$2

    echo "Configuring Ansible role for $id $type..."
    mkdir -p /vagrant/.condement/roles/$type-$id
    cp -r /vagrant/$type/$id/* /vagrant/.condement/roles/$type-$id
}

rm -r /vagrant/.condement

for r in /vagrant/system/*/; do
    id=${r:16:-1}
    echo "Configuring Ansible role for $id..."
    mkdir -p /vagrant/.condement/roles/$id
    cp -r /vagrant/system/$id/* /vagrant/.condement/roles/$id
done

echo "Copying keyboard layout files..."
mkdir -p /vagrant/.condement/roles/condement-base/files/keyboard_layouts/
cp /vagrant/keyboard_layouts/* /vagrant/.condement/roles/condement-base/files/keyboard_layouts/

for r in /vagrant/desktop/*/; do
    id=${r:17:-1}
    configure_role "desktop" $id
done

for r in /vagrant/software/*/; do
    id=${r:18:-1}
    configure_role "software" $id
done

cp /vagrant/system/site.yaml /vagrant/.condement/site.yaml