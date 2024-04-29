variable "sgs" {
    type = string
    description = "List of security group IDs to attach to the ALB"
  
}

variable "subnets" {
    type = list(string)
    description = "List of subnet IDs to attach to the ALB"
  
}


variable "vpc_alb" {
    type = string
    description = "VPC ID to attach to the ALB"
  
}

variable "instancesalb" {
    type = list(string)
    description = "List of instance IDs to attach to the ALB"
  
}