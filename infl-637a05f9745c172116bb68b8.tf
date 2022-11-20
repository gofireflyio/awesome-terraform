resource "aws_instance" "Akamai-e2d" {
  ami                         = "ami-00ee4df451840fa9d"
  associate_public_ip_address = true
  availability_zone           = "us-west-2c"
  cpu_core_count              = 1
  cpu_threads_per_core        = 1
  credit_specification {
    cpu_credits = "standard"
  }
  disable_api_termination = false
  ebs_optimized           = false
  enclave_options {
    enabled = false
  }
  hibernation                          = false
  iam_instance_profile                 = "SSMInstanceProfile"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  key_name                             = "stag"
  monitoring                           = false
  private_ip                           = "10.1.185.221"
  root_block_device {
    iops = 100
    tags = {
      Name = "Akamai"
    }
    volume_size = 8
  }
  subnet_id = "subnet-0a4c87511013b4cc4"
  tags = {
    Name = "Akamai"
  }
  tenancy                = "default"
  user_data              = "4eb78bee9984cb86ccaf87008a7c06106f889968"
  vpc_security_group_ids = ["sg-0187c85e0666bfc7f"]
}

