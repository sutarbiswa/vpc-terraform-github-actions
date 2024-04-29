output "instances" {
    value = aws_instance.myec2.*.id
  
}