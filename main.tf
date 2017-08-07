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

data "template_file" "bucket_name" {
  template = "${replace(var.bucket_name, "$$$$", "$")}"

  vars {
    namespace        = "${var.namespace}"
    name             = "${var.name}"
    stage            = "${var.stage}"
    id               = "${module.label.id}"
    zone_name        = "${module.domain.zone_name}"
    parent_zone_name = "${module.domain.parent_zone_name}"
  }
}

# Kops bucket for manifests (e.g. `config.foobar.example.com`)
resource "aws_s3_bucket" "default" {
  bucket        = "${data.template_file.bucket_name.rendered}"
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
