variable "deploy_name" {
  description = "The deployment name"
}

variable "aws_region" {
  description = "AWS Region"
}

variable "bucket_arn" {
  description = "S3 bucket arn"
}

variable "max_lines" {
  description = "Maximum Lines"
  default = 10000
}