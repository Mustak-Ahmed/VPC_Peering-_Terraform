resource "aws_internet_gateway" "gw1" {
  depends_on = [ aws_vpc.VPC1 ]
  vpc_id = aws_vpc.VPC1.id

  tags = {
    Name = "${var.vpc1_name}-IG"
  }
}
resource "aws_internet_gateway" "gw2" {
  depends_on = [ aws_vpc.VPC2 ]
  vpc_id = aws_vpc.VPC2.id

  tags = {
    Name = "${var.vpc2_name}-IG"
  }
}
resource "aws_internet_gateway" "gw3" {
  depends_on = [ aws_vpc.VPC3 ]
  vpc_id = aws_vpc.VPC3.id

  tags = {
    Name = "${var.vpc3_name}-IG"
  }
}
resource "aws_internet_gateway" "gw4" {
  depends_on = [ aws_vpc.VPC4 ]
  vpc_id = aws_vpc.VPC4.id

  tags = {
    Name = "${var.vpc4_name}-IG"
  }
}
resource "aws_eip" "nateIP1" {
   vpc   = true 
     tags = {
    Name = "${var.vpc1_name}-EIP"
  }
 }
   resource "aws_eip" "nateIP2" {
   vpc   = true 
     tags = {
    Name = "${var.vpc2_name}-EIP"
  }
 }
 resource "aws_eip" "nateIP3" {
   vpc   = true 
     tags = {
    Name = "${var.vpc3_name}-EIP"
  }
 }
   resource "aws_eip" "nateIP4" {
   vpc   = true 
     tags = {
    Name = "${var.vpc4_name}-EIP"
  }
 }
  resource "aws_nat_gateway" "NATgw1" {
   allocation_id = aws_eip.nateIP1.id
   subnet_id      = aws_subnet.vpc1public_subnets[0].id
    tags = {
    Name = "${var.vpc1_name}-NAT-Gateway"
  }
 }
  resource "aws_nat_gateway" "NATgw2" {
   allocation_id = aws_eip.nateIP2.id
   subnet_id      = aws_subnet.vpc2public_subnets[0].id
    tags = {
    Name = "${var.vpc2_name}-NAT-Gateway"
  }
 }
 resource "aws_nat_gateway" "NATgw3" {
   allocation_id = aws_eip.nateIP3.id
   subnet_id      = aws_subnet.vpc3public_subnets[0].id
    tags = {
    Name = "${var.vpc3_name}-NAT-Gateway"
  }
 }
  resource "aws_nat_gateway" "NATgw4" {
   allocation_id = aws_eip.nateIP4.id
   subnet_id      = aws_subnet.vpc4public_subnets[0].id
    tags = {
    Name = "${var.vpc4_name}-NAT-Gateway"
  }
 }