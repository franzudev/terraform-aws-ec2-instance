resource "aws_instance" "bastion-instance" {
  ami                    = var.instance.ami_id
  instance_type          = var.instance.type
  key_name               = aws_key_pair.admin-kp.key_name
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]

  subnet_id = aws_subnet.bastion-subnet.id
}
