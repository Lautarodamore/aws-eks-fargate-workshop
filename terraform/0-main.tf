provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket   = "ldamore-terraform-state"
    key      = "terraform.tfstate"
    region   = "us-east-1"
    encrypt  = true
  }
}

variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "cluster_name" {
  type = string
  default = "demo"
}

variable "cluster_version" {
  type = string
  default = "1.22"
}

