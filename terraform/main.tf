provider "aws" {
  region = "us-east-1"
}

data "aws_key_pair" "oleg_key" {
  key_name = "oleg_key"
}

data "aws_internet_gateway" "existing_igw" {
  internet_gateway_id = "igw-0c3d8c45c5bd39e34"
}

resource "aws_subnet" "oleg_public_subnet" {
  vpc_id                  = "vpc-044604d0bfb707142"
  cidr_block              = "172.31.96.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "oleg-public-subnet"
  }
}

resource "aws_route_table" "oleg_public_rt" {
  vpc_id = "vpc-044604d0bfb707142"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.existing_igw.id
  }
  tags = {
    Name = "oleg-public-rt"
  }
}

resource "aws_route_table_association" "oleg_subnet_association" {
  subnet_id      = aws_subnet.oleg_public_subnet.id
  route_table_id = aws_route_table.oleg_public_rt.id
}

resource "aws_security_group" "oleg_builder_sg" {
  name        = "oleg-builder-sg"
  description = "Security group for builder EC2 instance"
  vpc_id      = "vpc-044604d0bfb707142"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5001
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "oleg_builder" {
  ami                    = "ami-0c4e709339fa8521a"
  instance_type          = "t4g.medium"
  key_name               = "oleg_key"
  vpc_security_group_ids = [aws_security_group.oleg_builder_sg.id]
  subnet_id              = aws_subnet.oleg_public_subnet.id
  tags = {
    Name = "oleg_builder"
  }
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install docker -y
    systemctl start docker
    systemctl enable docker
    usermod -a -G docker ec2-user
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
  EOF
}