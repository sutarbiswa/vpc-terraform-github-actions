resource "aws_instance" "myec2" {
  count = length(var.ec2_names) 
  ami           = data.aws_ami.amazon-2.id
  instance_type = "t2.micro"
  security_groups = [var.sg_id]
  associate_public_ip_address = true
  subnet_id = var.subnets[count.index]
  availability_zone = data.aws_availability_zones.az.names[count.index]
  #user_data = base64decode(file("userdata.sh"))


  tags = {
    Name = var.ec2_names[count.index]
  }
}