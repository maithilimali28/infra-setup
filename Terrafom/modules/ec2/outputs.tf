# modules/ec2/outputs.tf
output "elastic_ip" {              # ← exact name must match
  value = aws_eip.ec2.public_ip
}
