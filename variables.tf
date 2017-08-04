variable "namespace" {
  default = "kops"
}

variable "stage" {
  default = "dev"
}

variable "name" {
  default = "cluster"
}

variable "parent_zone_id" {
  default = ""
}

variable "parent_zone_name" {
  default = ""
}

variable "bucket_prefix" {
  default = "config."
}

variable "ttl" {
  default = "300"
}
