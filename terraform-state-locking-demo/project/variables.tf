variable "ami_id" {
    description = "The ID of the AMI for the EC2 instance"
    default = "ami-0fc5d935ebf8bc3bc"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  default     = "t2.micro" 
}

variable "key_name" {
  description = "The name of the SSH key pair"
  default     = "demo-server-key" 
}
