variable "domain_name" {
    description = "The domain name for which to request an ACM certificate"
    type = string
  
}

variable "alternative_name" {
    description = "value for the alternative name for cert"
    type = string
  
}