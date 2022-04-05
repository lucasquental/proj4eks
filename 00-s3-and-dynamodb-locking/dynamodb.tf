resource "aws_dynamodb_table" "s3_state_lock" {
  name         = "s3_state_lock"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}