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
  value       = "${coalesce(join("",aws_s3_bucket.default.*.bucket),join("",data.aws_s3_bucket.default.*.bucket))}"
  description = "S3 bucket name"
}

output "bucket_region" {
  value       = "${coalesce(join("",aws_s3_bucket.default.*.region),join("",data.aws_s3_bucket.default.*.region))}"
  description = "S3 bucket region"
}

output "bucket_domain_name" {
  value       = "${coalesce(join("",aws_s3_bucket.default.*.bucket_domain_name),join("",data.aws_s3_bucket.default.*.bucket_domain_name))}"
  description = "S3 bucket domain name"
}

output "bucket_id" {
  value       = "${coalesce(join("",aws_s3_bucket.default.*.id),join("",data.aws_s3_bucket.default.*.id))}"
  description = "S3 bucket ID"
}

output "bucket_arn" {
  value       = "${coalesce(join("",aws_s3_bucket.default.*.arn),join("",data.aws_s3_bucket.default.*.arn))}"
  description = "S3 bucket ARN"
}
