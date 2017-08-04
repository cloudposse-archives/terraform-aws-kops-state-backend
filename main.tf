module "label" {
  source    = "git::https://github.com/cloudposse/tf_label.git?ref=master"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  name      = "${var.name}"
}

# Kops domain
module "domain" {
  source    = "git::https://github.com/cloudposse/tf_domain.git?ref=master"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  name      = "${var.name}"
}

# Kops bucket for manifests
resource "aws_s3_bucket" "default" {
  bucket        = "${var.bucket_prefix}${module.domain.dns_zone}"
  acl           = "private"
  tags          = "${module.label.tags}"
  force_destroy = true

  versioning {
    enabled = true
  }

  tags = "${module.label.tags}"

  lifecycle {
    create_before_destroy = true
  }
}
