output "parent_zone_id" {
  value       = "${module.domain.parent_zone_id}"
  description = "Parent zone ID"
}

output "parent_zone_name" {
  value       = "${module.domain.parent_zone_name}"
  description = "Parent zone name"
}

output "zone_id" {
  value       = "${module.domain.zone_id}"
  description = "`kops` cluster zone ID"
}

output "zone_name" {
  value       = "${module.domain.zone_name}"
  description = "`kops` cluster zone name"
}

output "bucket_name" {
  value       = "${aws_s3_bucket.default.bucket}"
  description = "S3 bucket name"
}

output "bucket_region" {
  value       = "${aws_s3_bucket.default.region}"
  description = "S3 bucket region"
}

output "bucket_domain_name" {
  value       = "${aws_s3_bucket.default.bucket_domain_name}"
  description = "S3 bucket domain name"
}

output "bucket_id" {
  value       = "${aws_s3_bucket.default.id}"
  description = "S3 bucket ID"
}

output "bucket_arn" {
  value       = "${aws_s3_bucket.default.arn}"
  description = "S3 bucket ARN"
}
