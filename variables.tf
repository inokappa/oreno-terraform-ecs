#
# Credentials for test
variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "ap-northeast-1"
}

# SSH key
variable "ssh_key_name" {}

# SSH access allow
# variable "ssh_allow_ip" {}

# 
variable "aws_amis" {
  default = {
      "ap-northeast-1" = "ami-50b01450"
  }
}

# Instance Type
variable "instance_type" {
  default = "t2.micro"
}

# Instance Tag Name
variable "tag_names" {
  default = {
    "0" = "ecs-container-instance01"
  }
}

# Subnet
variable "subnet" {}

# SecurityGroup
variable "securiy_group" {}

# IAM role
# variable "iam_profile_name" {}

# S3 bucket name
variable "s3_bucket_name" {}

# Datadog API Key
variable "datadog_api_key" {}
