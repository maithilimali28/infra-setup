# modules/vpc/variables.tf
variable "environment"        { type = string }
variable "vpc_cidr"           { type = string }
variable "public_subnet_cidr" { type = string }
variable "aws_region"         { type = string }