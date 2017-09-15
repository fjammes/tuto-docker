
# Set up ssh account

```
wget https://github.com/fjammes/tuto-docker/archive/master.zip
unzip master.zip 
cd tuto-docker-master/provision
gpg -d id_rsa_isima.gpg > ~/.ssh/id_rsa_isima
cp ssh_config ~/.ssh/config
cp id_rsa_isima.pub ~/.ssh
chmod 700 ~/.ssh/id_rsa_isima
# Connect to cloud-hosted server and play
ssh dockerworker-15
```
