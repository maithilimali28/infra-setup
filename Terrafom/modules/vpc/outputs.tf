# modules/vpc/outputs.tf
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {        # ← exact name must match
  value = aws_subnet.public.id
}