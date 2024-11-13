docker version
docker --version
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
docker --version
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
sudo yum install -y java-21-amazon-corretto-devel
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key
sudo curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo growpart /dev/xvda 1
sudo xfs_growfs -d /
exit
