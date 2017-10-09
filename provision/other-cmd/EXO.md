```
# On master
#
#
# see https://kubernetes.io/docs/tutorials/stateless-application/guestbook/
sudo yum install -y docker-engine && sudo systemctl start docker

# get service ip, at the end
kubectl get services

lynx http://dockerworker-1:30612/index.html

# On worker node
#
#
sudo yum install -y docker-engine && sudo systemctl start docker

# test service locally
wget http://dockerworker-1:30612

# Enable nodeport remote access
sudo yum install iptables-services
sudo systemctl stop iptables

# Investigate
#
#

# get pod ips
kubectl get pods -o wide

# launch shell
kubectl run -i --tty busybox --image=busybox -- sh
# check pod with podIP
wget http://172.17.0.3:80

```
