# ── VPC Module ───────────────────────────
module "vpc" {
  source = "./modules/vpc"

  environment        = var.environment
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  aws_region         = var.aws_region
}

# ── EC2 Module ───────────────────────────
module "ec2" {
  source = "./modules/ec2"

  user_data_script = "${path.root}../../../scripts/install_node.sh"
  environment     = var.environment
  instance_type   = var.instance_type
  ami_id          = var.ami_id
  key_pair_name   = var.key_pair_name

  # Outputs from VPC module passed in
  subnet_id       = module.vpc.public_subnet_id
  vpc_id          = module.vpc.vpc_id
}

# ── Amplify Module ───────────────────────
module "amplify" {
  source = "./modules/amplify"
  depends_on = [module.ec2]  # Dependency goes here in the root module

  environment   = var.environment
  github_repo   = var.github_repo
  github_token  = var.github_token
  

  # Pass EC2 IP so Amplify knows the API URL
  api_base_url  = "http://${module.ec2.elastic_ip}:5000"
}