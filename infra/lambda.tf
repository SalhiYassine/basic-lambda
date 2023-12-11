variable "region" {
  default = "eu-west-1"
}

provider "aws" {
  region = var.region
}

variable "output_location" {
  default = "zipped-functions/lambda_functions_payload.zip"
}

variable "source_code_dir" {
  default = "../functions/dist"
}

variable "handlers" {
  type = list(string)
  default = [
    "getSomethingHandler",
    "getSomethingElseHandler",
  ]
}


# Archive the source code once
data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = var.source_code_dir
  output_path = var.output_location
}

module "lambda_setup" {
  for_each = { for idx, handler in var.handlers : idx => handler }

  source           = "./lambda_setup"
  lambda_name      = "${each.value}_lambda"
  region           = var.region
  handler          = "index.${each.value}"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  output_location  = var.output_location
}


