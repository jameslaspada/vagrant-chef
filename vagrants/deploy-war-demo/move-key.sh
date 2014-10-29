#!/bin/bash
echo "moving key to the chef data bag directory."
mv encrypted_data_bag_secret /etc/chef/encrypted_data_bag_secret
chmod 777 /etc/chef/encrypted_data_bag_secret
