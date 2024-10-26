variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_availability_zone" {
  type    = string
  default = "eu-west-1a"
}

variable "instance" {
  type = object({
    ami_id = string
    type   = string
  })
  default = {
    ami_id = "ami-02f64c390601e5f36"
    type   = "c5.large"
  }
}

variable "instance_key_pair" {
  type = object({
    name           = string
    public_ssh_key = string
  })
  default = {
    name           = "admin"
    public_ssh_key = "./key.pub"
  }
}

variable "instance_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "instance_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
