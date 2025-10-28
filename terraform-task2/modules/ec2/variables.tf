variable "project"           { type = string }
variable "vpc_id"            { type = string }
variable "private_subnet_id" { type = string }
variable "instance_type"     { type = string }

variable "key_name" {
  type    = string
  default = null
}

variable "http_source_cidr"  { type = string }
