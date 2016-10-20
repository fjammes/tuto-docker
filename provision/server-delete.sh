openstack server list | grep fjammes-docker | cut -d'|' -f 3| xargs openstack server delete
