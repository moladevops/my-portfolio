output "website_url" {
  description = "Public URL of the website"
  value       = "https://${local.site_domain}"
}

output "cloudfront_domain_name" {
  description = "CloudFront domain, usable before DNS propagates"
  value       = "https://${aws_cloudfront_distribution.site.domain_name}"
}

output "cloudfront_distribution_id" {
  description = "Distribution ID, for cache invalidations"
  value       = aws_cloudfront_distribution.site.id
}

output "bucket_name" {
  value = aws_s3_bucket.site.id
}
