variable "operating_system" {
  description = "Select OS for the instance.\nValid values are Linux,Windows"
  validation {
    condition = contains(["Linux", "Windows"], var.operating_system)
    error_message = "Valid values for var: operating_system are (Linux, Windows)."
  }
  type = string
}

variable "instance_type" {
  type        = string
  description = "Choose allowed instance type.\nAllowed values are t2.small, t2.medium, t3.large"
  validation {
    condition = contains(["t2.small", "t2.medium", "t3.large"], var.instance_type)
    error_message = "Valid values for var: instance_type are (t2.small, t2.medium, t3.large)."
  }
}
resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "demo-bucket-${random_string.random.result}"
}

output regional_domain_name {
  value = aws_s3_bucket.bucket.bucket_regional_domain_name
}
