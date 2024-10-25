output "bastion_id" {
  value = "${aws_eip.bastion-eip.public_ip}\ngitlab-instance${aws_eip.gitlab-3k-eip.allocation_id} - ${aws_eip.gitlab-3k-eip.public_ip}"
}
