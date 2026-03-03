# ── General ──────────────────────────────
variable "aws_region" {
  description = "AWS region to deploy in"
  type        = string
  default     = "ap-south-1"  # Mumbai
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# ── VPC ──────────────────────────────────
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# ── EC2 ──────────────────────────────────
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "AWS key pair for SSH access"
  type        = string
  # No default — must set in tfvars
}

variable "ami_id" {
  description = "Ubuntu 22.04 AMI ID"
  type        = string
  default     = "ami-0f58b397bc5c1f2e8"
}

# ── Amplify ──────────────────────────────
variable "github_repo" {
  description = "GitHub repo URL for frontend"
  type        = string
}

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true  # won't show in logs
}