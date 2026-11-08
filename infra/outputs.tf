output "website_url" {
  value = "https://${local.site_domain}"
}

output "cloudfront_domain_name" {
  description = "CloudFront domain, usable before DNS propagates"
  value       = "https://${aws_cloudfront_distribution.site.domain_name}"
}

# Values to save in GitHub: Settings > Secrets and variables > Actions
output "github_variable_S3_BUCKET" {
  value = aws_s3_bucket.site.id
}

output "github_variable_CLOUDFRONT_DISTRIBUTION_ID" {
  value = aws_cloudfront_distribution.site.id
}

output "github_secret_AWS_DEPLOY_ROLE_ARN" {
  value = aws_iam_role.deploy.arn
}
