variable "bucket_name" {
  type = string
}

variable "instance_type" {
  type        = string
  description = "Choose Instance Type"
  validation {
    condition = contains(["item1", "item2", "item3"], var.instance_type)
    error_message = "Valid values for var: test_variable are (item1, item2, item3)."
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

output regional_domain_name {
  value = aws_s3_bucket.bucket.bucket_regional_domain_name
}
