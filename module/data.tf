data "aws_ami" "poc" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name = "name"

    values = ["amzn-ami-hvm-20*-gp2"]

  }
}

