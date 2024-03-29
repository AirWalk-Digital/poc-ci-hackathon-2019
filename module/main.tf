
resource "aws_instance" "web-instance" {
  ami                         = data.aws_ami.poc.id
  instance_type               = var.instance_type
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
output "instance_id" {
  value = aws_instance.web-instance.id
}
