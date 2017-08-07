output "parent_zone_id" {
  value = "${module.domain.parent_zone_id}"
}

output "parent_zone_name" {
  value = "${module.domain.parent_zone_name}"
}

output "zone_id" {
  value = "${module.domain.zone_id}"
}

output "zone_name" {
  value = "${module.domain.zone_name}"
}

output "bucket_name" {
  value = "${aws_s3_bucket.default.bucket}"
}

output "bucket_region" {
  value = "${aws_s3_bucket.default.region}"
}

output "id" {
  value = "${module.label.id}"
}
