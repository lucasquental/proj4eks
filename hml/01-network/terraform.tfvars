aws_region = "us-east-2"

availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]

cidr_block = "10.0.0.0/16"

public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

bucket = "s3-bucket-tfstate-proj42"

bucket_key = "01-network/terraform.tfstate"

dynamodb_table = "s3_state_lock"