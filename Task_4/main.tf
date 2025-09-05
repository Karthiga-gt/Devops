<<<<<<< HEAD
<<<<<<< HEAD
provider "aws" {
  region = "us-east-1"
}

# 🔹 Create Security Group
resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg1"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # SSH access
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # HTTP access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]   # Allow all outbound traffic
  }

  tags = {
    Name = "WebSecurityGroup_gk"
  }
}

# 🔹 Launch EC2 Instance using existing key pair
resource "aws_instance" "web" {
  ami                    = "ami-08c40ec9ead489470" # Ubuntu 22.04 in us-east-1
  instance_type          = "t2.micro"
  key_name               = "keypair"   # existing AWS key pair
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y python3
              EOF

  tags = {
    Name = "TerraformWeb_kk"
  }
}

# 🔹 Output the EC2 Public IP
output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}
=======
=======
>>>>>>> 6f3e4ac4716464eedf8a2a2069c996c5ce5a0df9
provider "aws" {
  region = "us-east-1"
}

# 🔹 Create Security Group
resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg1"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # SSH access
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # HTTP access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]   # Allow all outbound traffic
  }

  tags = {
    Name = "WebSecurityGroup_gk"
  }
}

# 🔹 Launch EC2 Instance using existing key pair
resource "aws_instance" "web" {
  ami                    = "ami-08c40ec9ead489470" # Ubuntu 22.04 in us-east-1
  instance_type          = "t2.micro"
  key_name               = "keypair"   # existing AWS key pair
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y python3
              EOF

  tags = {
    Name = "TerraformWeb_kk"
  }
}

# 🔹 Output the EC2 Public IP
output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}
<<<<<<< HEAD
>>>>>>> 6f3e4ac (final_commit)
=======
>>>>>>> 6f3e4ac4716464eedf8a2a2069c996c5ce5a0df9
 