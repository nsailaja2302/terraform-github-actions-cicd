
# ------------------------------------------------
# 1. Create S3 bucket
# ------------------------------------------------

resource "aws_s3_bucket" "portfolio" {
  bucket        = var.bucket_name
  force_destroy = false

  tags = {
    Name        = var.bucket_name
    Environment = "Portfolio"
  }
}

# ------------------------------------------------
# 2. Enable bucket versioning
# ------------------------------------------------

resource "aws_s3_bucket_versioning" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  versioning_configuration {
    status = "Enabled"
  }
}

# ------------------------------------------------
# 3. Enable server-side encryption
# ------------------------------------------------

resource "aws_s3_bucket_server_side_encryption_configuration" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ------------------------------------------------
# 4. Block public access
# ------------------------------------------------

resource "aws_s3_bucket_public_access_block" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
