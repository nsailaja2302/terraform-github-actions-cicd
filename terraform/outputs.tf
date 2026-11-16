output "s3_bucket_name" {
  description = "Name of the created portfolio S3 bucket"
  value       = aws_s3_bucket.portfolio.id
}

output "s3_bucket_arn" {
  description = "ARN of the created portfolio S3 bucket"
  value       = aws_s3_bucket.portfolio.arn
}

output "s3_bucket_region" {
  description = "Region of the portfolio S3 bucket"
  value       = var.aws_region
}