variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "domain_name" {
  description = "Fully qualified domain name for the certificate "
  type        = string
}

variable "hosted_zone_id" {
  description = "Route 53 Hosted Zone ID for DNS validation."
  type        = string
}