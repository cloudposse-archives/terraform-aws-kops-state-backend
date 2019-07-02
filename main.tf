provider "aws" {
  version = "~> 2.17"

  alias  = "s3"
  region = "${var.region}"
}

data "template_file" "zone_name" {
  template = "${replace(var.zone_name, "$$$$", "$")}"

  vars {
    namespace        = "${var.namespace}"
    name             = "${var.cluster_name}"
    stage            = "${var.stage}"
    parent_zone_name = "${var.parent_zone_name}"
  }
}

locals {
  create_s3_bucket = "${!(var.create_bucket == "false")}"

  tags = "${
      merge(
        var.tags,
        map(
          "Cluster", "${data.template_file.zone_name.rendered}"
        )
      )
    }"
}

# Kops domain (e.g. `kops.domain.com`)
module "domain" {
  source           = "git::https://github.com/cloudposse/terraform-aws-route53-cluster-zone.git?ref=tags/0.3.1"
  namespace        = "${var.namespace}"
  name             = "${var.cluster_name}"
  stage            = "${var.stage}"
  delimiter        = "${var.delimiter}"
  attributes       = "${var.attributes}"
  zone_name        = "${var.zone_name}"
  parent_zone_id   = "${var.parent_zone_id}"
  parent_zone_name = "${var.parent_zone_name}"
  tags             = "${local.tags}"
  enabled          = "${var.domain_enabled}"
}

module "s3_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = "${var.namespace}"
  name       = "${var.name}"
  stage      = "${var.stage}"
  delimiter  = "${var.delimiter}"
  attributes = "${var.attributes}"
  tags       = "${local.tags}"
}

data "aws_s3_bucket" "default" {
  provider = "aws.s3"

  count  = "${local.create_s3_bucket ? 0 : 1}"
  bucket = "${module.s3_label.id}"
}

resource "aws_s3_bucket" "default" {
  provider = "aws.s3"

  count         = "${local.create_s3_bucket ? 1 : 0}"
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

resource "aws_s3_bucket_public_access_block" "default" {
  provider = "aws.s3"

  count  = "${local.create_s3_bucket && var.block_public_access_enabled == "true" ? 1 : 0}"
  bucket = "${aws_s3_bucket.default.id}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
