provider "aws" {
  region = var.region
}
variable vpc_cidr_blocks {
  default = "10.0.0.0/16"
}



resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_blocks
  tags = {
    Name: "${var.env_prefix}-vpc"
  }
}

resource "aws_subnet" "myapp-subnet-1" {
  vpc_id = aws_vpc.myapp-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = var.avail_zone
  tags = {
    Name: "${var.env_prefix}-subnet-1"
  }
}



/* resource "aws_route_table" "myapp-route-table" {
  vpc_id = aws_vpc.myapp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-igw.id
  }
  tags = {
    Name: "${var.env_prefix}-rtb"
  }

} */



resource "aws_internet_gateway" "myapp-igw" {
  vpc_id = aws_vpc.myapp-vpc.id
  tags = {
    Name: "${var.env_prefix}-igw"
  }
}


/*resource "aws_route_table_association" "a-rtb-subnet" {
  subnet_id = aws_subnet.myapp-subnet-1.id
  route_table_id = aws_route_table.myapp-route-table.id
  
}*/

resource "aws_default_route_table" "main-rtb" {
  default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id  
  

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-igw.id
  }
  tags = {
    Name: "${var.env_prefix}-main-rtb"
  }
}


resource "aws_default_security_group" "default-sg" {
  
  vpc_id = aws_vpc.myapp-vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = [var.my_ip, var.jenkins_ip]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    Name: "${var.env_prefix}-default-sg"
  }
}

data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name" 
    values = ["al2023-ami-*-x86_64"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}




resource "aws_instance" "myapp-server" {
  ami = data.aws_ami.latest-amazon-linux-image.id
  instance_type = var.instance_type

  root_block_device { volume_size = 50  }

  subnet_id = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids = [aws_default_security_group.default-sg.id]
  availability_zone = var.avail_zone

  associate_public_ip_address = true
  key_name = "docker-server1"


  user_data = file("entry-script.sh")

  user_data_replace_on_change = true

  tags = {
    Name: "${var.env_prefix}-server"
  }


}


output "ec2-public_ip" {
  value = aws_instance.myapp-server.public_ip
}


