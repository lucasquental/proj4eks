aws_region = "us-east-2"

security_group = "sg_bastion"

aws_subnet = "vpc_eks-public-us-east-2a"

instance_type = "t3a.micro"

key_name = "proj4-eks"

bucket = "s3-bucket-tfstate-proj42"

bucket_key = "03-bastion/terraform.tfstate"

dynamodb_table = "s3_state_lock"