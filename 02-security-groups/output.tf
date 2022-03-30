output "sg_bastion-id" {  
    value = aws_security_group.sg_bastion.id
}
output "sg_eks-id" {  
    value = aws_security_group.sg_eks.id
}
output "sg_db-id" {  
    value = aws_security_group.sg_db.id
}