resource "aws_dynamodb_table" "user_logins" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "UserID"
  range_key    = "Timestamp"

  attribute {
    name = "UserID"
    type = "S"
  }

  attribute {
    name = "Timestamp"
    type = "N"
  }

  tags = { Name = "${var.project}-user-logins" }
}
