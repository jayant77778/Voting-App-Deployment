output "ec2_public_ip" {
  value = aws_instance.app.public_ip
}

output "ec2_url" {
  value = "http://${aws_instance.app.public_ip}"
}
