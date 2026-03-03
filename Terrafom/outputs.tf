# These print in terminal after terraform apply
# so you know exactly where to go

output "ec2_public_ip" {
  description = "EC2 Elastic IP — paste in api.js"
  value       = module.ec2.elastic_ip
}

output "ssh_command" {
  description = "Command to SSH into EC2"
  value       = "ssh -i ~/.ssh/${var.key_pair_name}.pem ubuntu@${module.ec2.elastic_ip}"
}

output "api_url" {
  description = "Your Node.js API base URL"
  value       = "http://${module.ec2.elastic_ip}:5000"
}

output "amplify_url" {
  description = "React app live URL"
  value       = module.amplify.amplify_url
}

# After apply, terminal shows:
# ec2_public_ip = "13.234.XX.XX"
# api_url       = "http://13.234.XX.XX:5000"
# amplify_url   = "https://main.xxxxx.amplifyapp.com"
# ssh_command   = "ssh -i ~/.ssh/key.pem ubuntu@13.234.XX.XX"