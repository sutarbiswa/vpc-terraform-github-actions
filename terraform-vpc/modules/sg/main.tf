resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = var.vpc_id_sg

ingress {
    description = "HTTP"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    
}

ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

 egress {
    description = "outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
 tags = {
    Name = "mysecuritygroup"
 }
 
}
