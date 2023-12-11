variable "lambda_name" {
  description = "The name of the Lambda function."
}

variable "region" {
  description = "The AWS region where the Lambda function will be deployed."
}

variable "handler" {
  description = "The handler for the Lambda function."
}

variable "output_location" {
  description = "The path to the zip archived file"
}

variable "source_code_hash" {
  description = "The source code hash generated when zipping the file"
}
