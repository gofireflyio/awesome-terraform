resource "aws_instance" "instance1" {
  ami           = data.aws_ami.amzn_linux.id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [
    aws_security_group.ssh_access.id,
    aws_security_group.http_access.id,
  ]

  tags = {
    Name = "Instance1"
  }

  userData = filebase64("userdata.sh")

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = var.data_volume_size
    volume_type = var.data_volume_type
  }
}

data "aws_ami" "amzn_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}