provider "aws" {
  region  = var.region
  version = ">= 2.36.0"
}


resource "aws_instance" "web-instance" {
  ami = data.aws_ami.poc.id
  instance_type = "t2.nano"
  associate_public_ip_address = true


  tags = {
    Name = "web-instance"
  }

  user_data = <<EOF
#!/bin/sh
yum install -y nginx
chgrp ec2-user /usr/share/nginx/html
chmod 775 /usr/share/nginx/html
rm -rf /usr/share/nginx/html/*
service nginx start
EOF

}
output "web_domain" {
  value = "aws_instance.web-instance.public_dns
}
