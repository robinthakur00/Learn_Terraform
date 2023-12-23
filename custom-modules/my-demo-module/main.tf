resource "aws_key_pair" "my_key_pair" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")  # Replace with the path to your public key file
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.default.id  # Reference the default VPC using data source

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]  # Use vpc_security_group_ids instead of security_groups

  tags = {
    Name = "demo-server"
    Environment = var.environment
  }
}

module "my_module" {
  source = "./my-module"
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.my_key_pair.key_name
  environment = "dev"
}

