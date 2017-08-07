# Label & Tags (e.g. `example-dev-foobar`)
module "label" {
  source    = "git::https://github.com/cloudposse/tf_label.git?ref=master"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  name      = "${var.name}"
}

# Kops domain (e.g. `foobar.example.com`)
module "domain" {
  source    = "git::https://github.com/cloudposse/tf_domain.git?ref=support-parent-dns-zone-name"
  namespace = "${var.namespace}"
  name      = "${var.name}"
  stage     = "${var.stage}"

  zone_name        = "$${namespace}.$${parent_zone_name}"
  parent_zone_id   = "${var.parent_zone_id}"
  parent_zone_name = "${var.parent_zone_name}"
  ttl              = 60
}

# Kops bucket for manifests (e.g. `config.foobar.example.com`)
resource "aws_s3_bucket" "default" {
  bucket        = "${var.bucket_prefix}${module.domain.fqdn}"
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
