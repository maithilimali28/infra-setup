resource "aws_security_group" "ec2_sg" {
  name   = "${var.environment}-notes-sg"
  vpc_id = var.vpc_id

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Node.js API port
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # All outbound allowed
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.environment}-notes-sg" }
}

resource "aws_instance" "notes_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  # Auto-run on first boot
  user_data = file(var.user_data_script)

  tags = { Name = "${var.environment}-notes-server" }
}

resource "aws_eip" "ec2" {
  instance = aws_instance.notes_server.id
  tags     = { Name = "${var.environment}-notes-eip" }
}

