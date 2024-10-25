resource "aws_key_pair" "admin-kp" {
  key_name   = var.instance_key_pair.name
  public_key = file(var.instance_key_pair.public_ssh_key)
}

resource "aws_security_group" "bastion-sg" {
  name   = "allow-all-sg"
  vpc_id = aws_vpc.bastion-vpc.id

  dynamic "ingress" {
    for_each = var.instance_ingress_rules

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.instance_egress_rules

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
