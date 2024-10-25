resource "aws_instance" "bastion-instance" {
  ami                    = "ami-02f64c390601e5f36"
  instance_type          = "c5.large"
  key_name               = aws_key_pair.admin-kp.key_name
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]

  subnet_id = aws_subnet.bastion-subnet.id
}
