variable "operating_system" {
  description = "Select OS for the instance.Valid values are Linux, Windows"
  validation {
    condition = contains(["Linux", "Windows"], var.operating_system)
    error_message = "Valid values for var: operating_system are (Linux, Windows)."
  }
  type = string
}

variable "instance_type" {
  type        = string
  description = "Choose allowed instance type.Allowed values are t2.small, t2.medium, t3.large"
  validation {
    condition = contains(["t2.small", "t2.medium", "t3.large"], var.instance_type)
    error_message = "Valid values for var: instance_type are (t2.small, t2.medium, t3.large)."
  }
}

variable "instance_group" {
  type        = string
  description = "Choose suitable group of instance.Allowed values are Group_1, Group_2, Group_3"
  validation {
    condition = contains(["Group_1", "Group_2", "Group_3"], var.instance_group)
    error_message = "Valid values for var: instance_group are (Group_1, Group_2, Group_3)."
  }
}

resource "random_string" "random" {
  length      = 5
  special     = false
  min_special = 0
}

resource "aws_s3_bucket" "bucket" {
  bucket = "demo-bucket-${random_string.random.result}"
}

output regional_domain_name {
  value = aws_s3_bucket.bucket.bucket_regional_domain_name
}
