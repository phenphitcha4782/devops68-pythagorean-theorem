provider "aws" {
  region = var.region
}

resource "aws_security_group" "node_sg" {

  name = "node-api-sg"

  ingress {
    from_port   = 3015
    to_port     = 3015
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}

resource "aws_instance" "node_app" {

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups = [aws_security_group.node_sg.name]

  tags = {
    Name = "DevOps-Node-App"
  }

user_data = <<-EOF
#!/bin/bash

sudo apt update -y

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install nodejs -y
sudo apt install git -y

cd /home/ubuntu

git clone https://github.com/phenphitcha4782/devops68-pythagorean-theorem.git

cd devops68-pythagorean-theorem

npm install

sudo npm install -g pm2

pm2 start index.js
pm2 startup
pm2 save

EOF

}
