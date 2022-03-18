resource "aws_dynamodb_table" "s2_state_lock" {
    name = "s3_state_lock"
    hash_key = "LockID"
}