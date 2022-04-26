output "bastion-id" {
  value = aws_instance.bastion_eks.id
}
output "bastion-ip" {
  value = aws_instance.bastion_eks.public_ip
}