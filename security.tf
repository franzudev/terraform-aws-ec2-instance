resource "aws_key_pair" "admin-kp" {
  key_name   = "bastion-admin"
  public_key = file("./key.pub")
}

resource "aws_security_group" "bastion-sg" {
  name   = "allow-all-sg"
  vpc_id = aws_vpc.bastion-vpc.id
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
