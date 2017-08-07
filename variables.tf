variable "namespace" {
  default = "cluster"
}

variable "stage" {
  default = "dev"
}

variable "name" {
  default = "kops"
}

variable "parent_zone_id" {
  default = ""
}

variable "parent_zone_name" {
  default = ""
}

variable "bucket_name" {
  default = "config.$${zone_name}"
}

variable "ttl" {
  default = "300"
}
