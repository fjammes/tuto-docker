openstack server list | grep docker- | cut -d'|' -f 3| xargs openstack server delete
