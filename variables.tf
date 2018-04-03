variable "namespace" {
  type        = "string"
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "stage" {
  type        = "string"
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  type        = "string"
  default     = "kops"
  description = "Name (e.g. `kops`)"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name`, and `attributes`"
}

variable "attributes" {
  type        = "list"
  default     = ["state"]
  description = "Additional attributes (e.g. `state`)"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "zone_name" {
  type        = "string"
  default     = "$${name}.$${parent_zone_name}"
  description = "Template for `kops` DNS zone name"
}

variable "parent_zone_id" {
  type        = "string"
  default     = ""
  description = "Parent DNS zone ID"
}

variable "parent_zone_name" {
  type        = "string"
  default     = "cloudxl.net"
  description = "Parent DNS zone name (e.g. `domain.com`)"
}

variable "region" {
  type        = "string"
  description = "AWS Region the S3 bucket should reside in"
  default     = "us-east-1"
}

variable "acl" {
  type        = "string"
  description = "The canned ACL to apply to the S3 bucket"
  default     = "private"
}

variable "force_destroy" {
  type        = "string"
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without errors. These objects are not recoverable"
  default     = false
}
