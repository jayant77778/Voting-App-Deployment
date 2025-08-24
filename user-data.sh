#!/bin/bash
yum update -y

amazon-linux-extras enable docker
yum install -y docker
systemctl start docker
systemctl enable docker

curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

cat > /home/ec2-user/docker-compose.yml <<EOF
version: '3'
services:
  vote:
    image: dockersamples/examplevotingapp_vote
    ports:
      - "80:80"
  redis:
    image: redis:alpine
  worker:
    image: dockersamples/examplevotingapp_worker
  db:
    image: postgres:9.4
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
  result:
    image: dockersamples/examplevotingapp_result
    ports:
      - "8080:80"
EOF

cd /home/ec2-user
docker-compose up -d
