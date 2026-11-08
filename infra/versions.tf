terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.40"
    }
  }
}

# CloudFront only accepts ACM certificates from us-east-1.
provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project   = "portfolio"
      ManagedBy = "terraform"
    }
  }
}

# The API token is read from the CLOUDFLARE_API_TOKEN environment variable.
provider "cloudflare" {}
