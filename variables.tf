# The AWS account access key
variable "aws_access_key" {}

# The AWS account secret key
variable "aws_secret_key" {}

# The AWS account secret key
variable "account_id" {}

variable "deploy_name" {
  description = "Deploy name"
}

variable "aws_region" {
  description = "AWS Region"
}

variable "max_lines" {
  description = "MAX Lines"
}