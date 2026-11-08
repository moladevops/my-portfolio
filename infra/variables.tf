variable "bucket_name" {
  description = "Globally unique name of the S3 bucket that stores the portfolio"
  type        = string
}

variable "domain_name" {
  description = "Domain whose DNS is managed by Cloudflare, e.g. example.com"
  type        = string
}

variable "subdomain" {
  description = "Subdomain that serves the portfolio, e.g. portfolio gives portfolio.example.com"
  type        = string
  default     = "portfolio"
}

variable "certificate_domain" {
  description = "Domain of an ISSUED ACM certificate in us-east-1 that covers the subdomain, e.g. *.example.com"
  type        = string
}

variable "github_repository" {
  description = "Repository allowed to deploy, as owner/name"
  type        = string
  default     = "moladevops/my-portfolio"
}

variable "create_github_oidc_provider" {
  description = "Create the GitHub Actions OIDC provider. Set to false if the AWS account already has one."
  type        = bool
  default     = true
}
