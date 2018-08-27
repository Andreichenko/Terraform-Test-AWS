
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {
  default = "secretkey"
}


variable "network_address_space" {
  default = "192.168.12.0/8"
}

variable "network_address_subnet1" {
  default = "192.168.12.0/16"
}

variable "network_address_subnet2" {
  default = "192.168.13.0/16"
}

provider "aws" {
  access_key = "******"
  secret_key = "******"
  region = "eu-central-1"
}

resource "aws_instance" "test1" {
  ami = "ami-c86c3f23"
  instance_type = "t2.micro"

  provisioner "remote-exec" {
      inline = [
        "sudo yum install nginx -y",
        "sudo yum install mc",
        "sudo service nginx start"
      ]
  }


}