terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = ">= 5.0" }
    helm = { source = "hashicorp/helm", version = ">= 2.11" }
    kubernetes = { source = "hashicorp/kubernetes", version = ">= 2.29" }
  }
  # If you want remote state, uncomment and fill in.
  # backend "s3" {
  #   bucket         = "YOUR-BUCKET"
  #   key            = "opsfleet-eks/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "terraform-locks"
  #   encrypt        = true
  # }
}

provider "aws" {
  region = var.region
}
