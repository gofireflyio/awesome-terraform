variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "my-key-pair"
}

variable "root_volume_size" {
  default = 8
}

variable "root_volume_type" {
  default = "gp2"
}

variable "data_volume_size" {
  default = 10
}

variable "data_volume_type" {
  default = "gp2"
}