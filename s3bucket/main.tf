variable "bucket_name" {
  type = string
}

variable "instance_type" {
  type = list(string)
  default = ["t2.micro", "t2.medium"]
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

output regional_domain_name {
  value = aws_s3_bucket.bucket.bucket_regional_domain_name
}
