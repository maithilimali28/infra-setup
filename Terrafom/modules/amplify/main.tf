resource "aws_amplify_app" "frontend" {
  name         = "${var.environment}-notes-app"
  repository   = var.github_repo
  access_token = var.github_token
 # depends_on = [module.ec2]   # ← wait for EC2 to finish first


  # Build settings — what command to run
  build_spec = <<-EOT
    version: 1
    frontend:
      phases:
        preBuild:
          commands:
            - npm install
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT

  # Inject API URL as env variable at build time
  environment_variables = {
    REACT_APP_API_URL = var.api_base_url
  }
}

resource "aws_amplify_branch" "master" {
  app_id      = aws_amplify_app.frontend.id
  branch_name = "master"

  # Auto build on every git push
  enable_auto_build = true
}

output "amplify_url" {
  value = "https://${aws_amplify_branch.master.branch_name}.${aws_amplify_app.frontend.id}.amplifyapp.com"
}
