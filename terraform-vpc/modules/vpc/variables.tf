variable "vpc_cidr" {
    description = "value of the CIDR block for the VPC"
    type = string

}

variable "subnet_cidr" {
    description = "value of the CIDR block for the subnet"
    type = list(string)
  
}

variable "subnet_names" {
    description = "value of the subnets names"
    type = list(string)
    default = [ "publicsubnet1", "publicsubnet2"]
  
}