# modules/ec2/variables.tf  ← this file MUST exist
variable "environment"   { type = string }
variable "instance_type" { type = string }
variable "ami_id"        { type = string }
variable "key_pair_name" { type = string }
variable "subnet_id"     { type = string }   # ← often forgotten
variable "vpc_id"        { type = string }   # ← often forgotten
variable "user_data_script" {
  description = "../../../scripts/install_node.sh"
  type        = string
}