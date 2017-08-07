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
  value = "${module.domain.fqdn}"
}

output "bucket_name" {
  value = "${aws_s3_bucket.default.name}"
}

output "id" {
  value = "${module.label.id}"
}
