variable "sg_id" {
    description = "SG_ID of Ec2 instance"
    type = string

}

variable "subnets" {
    description = "subnets for ec2"
    type = list(string)
  
}

variable "ec2_names" {
    description = "names for ec2"
    type = list(string)
    default = [ "webserver1", "webserver2" ]
  
}