variable "bucket_name" {
  description = "Globally unique name of the S3 bucket that stores the website files"
  type        = string
}

variable "domain_name" {
  description = "Domain hosted in Route 53, e.g. example.com"
  type        = string
}

variable "subdomain" {
  description = "Subdomain that serves the site, e.g. www gives www.example.com"
  type        = string
}

variable "certificate_domain" {
  description = "Domain of an ISSUED ACM certificate in us-east-1 that covers the site, e.g. *.example.com"
  type        = string
}

variable "site_dir" {
  description = "Local folder with the website files (index.html at its root)"
  type        = string
  default     = "../site"
}
