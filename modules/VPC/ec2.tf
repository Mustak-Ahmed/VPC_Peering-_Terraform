  resource "aws_instance" "VM-1-vpc1" {
  ami                    = "ami-079b5e5b3971bd10d" 
  instance_type          = "t2.micro"
  key_name               = "Mustak-Test"
  subnet_id              = [aws_subnet.VPC1_public_subnets.id]
  security_groups        = [aws_security_group.forwarder.id] 
  map_public_ip_on_launch=true
  tags = {
    "Name" = "VM-1-vpc1"
  }
  # user_data = <<EOF
	# 	#! /bin/bash
  #   #Use this for user data
  #   #install httpd(Linux 2 version)
  #   yum install -y httpd
	# 	systemctl start httpd
	# 	systemctl enable httpd
	# 	echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	# EOF
}
 resource "aws_instance" "VM-2-vpc2" {
  ami                    = "ami-079b5e5b3971bd10d" 
  instance_type          = "t2.micro"
  key_name               = "Mustak-Test"
  subnet_id              = [aws_subnet.VPC2_private_subnets.id]
  security_groups        = [aws_security_group.forwarder.id] 
    tags = {
    "Name" = "VM-2-vpc2"
  }
  # user_data = <<EOF
	# 	#! /bin/bash
  #   #Use this for user data
  #   #install httpd(Linux 2 version)
  #   yum install -y httpd
	# 	systemctl start httpd
	# 	systemctl enable httpd
	# 	echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	# EOF
}
resource "aws_instance" "VM-3-vpc3" {
  ami                    = "ami-079b5e5b3971bd10d" 
  instance_type          = "t2.micro"
  key_name               = "Mustak-Test"
  subnet_id              = [aws_subnet.VPC3_public_subnets.id]
  security_groups        = [aws_security_group.forwarder.id]
  map_public_ip_on_launch=true 
  tags = {
    "Name" = "VM-3-vpc3"
  }
  # user_data = <<EOF
	# 	#! /bin/bash
  #   #Use this for user data
  #   #install httpd(Linux 2 version)
  #   yum install -y httpd
	# 	systemctl start httpd
	# 	systemctl enable httpd
	# 	echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	# EOF
}
 resource "aws_instance" "VM-4-vpc4" {
  ami                    = "ami-079b5e5b3971bd10d" 
  instance_type          = "t2.micro"
  key_name               = "Mustak-Test"
  subnet_id              = [aws_subnet.VPC4_private_subnets.id]
  security_groups        = [aws_security_group.forwarder.id] 
  tags = {
    "Name" = "VM-4-vpc4"
  }
  # user_data = <<EOF
	# 	#! /bin/bash
  #   #Use this for user data
  #   #install httpd(Linux 2 version)
  #   yum install -y httpd
	# 	systemctl start httpd
	# 	systemctl enable httpd
	# 	echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	# EOF
}