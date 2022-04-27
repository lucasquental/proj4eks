resource "aws_dynamodb_table" "s3_state_lock" {
  name         = var.dynamodb_name
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}