resource "aws_s3_bucket" "remote_bucket" {
    bucket = "helloworld2023dec-bucket"
}

resource "aws_dynamodb_table" "remote_table" {
    name = "helloworld2023dec-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        Name = "helloworld2023dec-table"
        Environment = "production"
    }
}