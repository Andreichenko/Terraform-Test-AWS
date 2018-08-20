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
        "sudo service nginx start"
      ]
  }
}