# This is the main terraform file containing modules that can be reused
# It will contain the provider as well as all the modules in the project

provider "aws" {
  version             = "2.40.0"
  region              = var.aws_region
  access_key          = var.aws_access_key
  secret_key          = var.aws_secret_key
  allowed_account_ids = [var.account_id]
}

module "s3_bucket" {
  source        = "./S3"
  deploy_name   = var.deploy_name
  aws_region    = var.aws_region
  lambda_arn    = module.lambda.lambda_arn
}

module "lambda" {
  source        = "./Lambda"
  deploy_name   = var.deploy_name
  aws_region    = var.aws_region
  bucket_arn    = module.s3_bucket.s3_arn
  max_lines     = var.max_lines
}