variable "vpc_cidr" {
  description = "value of the CIDR block for the VPC"
  type        = string

}

variable "subnet_cidr" {
  description = "value of the CIDR block for the subnet"
  type        = list(string)

}

variable "domain_name" {
  description = "The domain name for which to request an ACM certificate"
  type        = string

}

variable "alternative_name" {
  description = "value for the alternative name for cert"
  type        = string

}