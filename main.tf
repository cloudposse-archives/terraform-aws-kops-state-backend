# Kops domain (e.g. `kops.domain.com`)
module "domain" {
  source           = "git::https://github.com/cloudposse/terraform-aws-route53-cluster-zone.git?ref=tags/0.2.3"
  namespace        = "${var.namespace}"
  name             = "${var.name}"
  stage            = "${var.stage}"
  delimiter        = "${var.delimiter}"
  attributes       = "${var.attributes}"
  tags             = "${var.tags}"
  zone_name        = "${var.zone_name}"
  parent_zone_id   = "${var.parent_zone_id}"
  parent_zone_name = "${var.parent_zone_name}"
}

# Label & Tags
module "s3_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = "${var.namespace}"
  name       = "${var.name}"
  stage      = "${var.stage}"
  delimiter  = "${var.delimiter}"
  attributes = "${var.attributes}"

  tags = "${
      merge(
        map(
          "Cluster", "${module.domain.zone_name}"
        ), var.tags
      )
    }"
}

resource "aws_s3_bucket" "default" {
  bucket        = "${module.s3_label.id}"
  acl           = "${var.acl}"
  region        = "${var.region}"
  force_destroy = "${var.force_destroy}"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = "${module.s3_label.tags}"
}
