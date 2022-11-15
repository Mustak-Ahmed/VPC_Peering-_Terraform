#### VPC1 Pubilic & Private Subnets #####

resource "aws_subnet" "vpc1public_subnets" {

   depends_on = [ aws_vpc.VPC1,aws_internet_gateway.gw1 ]

   count = length(var.VPC1_public_subnets)
   vpc_id = aws_vpc.VPC1.id
   availability_zone = element(var.az-zons,count.index)
   map_public_ip_on_launch = true
   cidr_block = element(var.VPC1_public_subnets,count.index)
   tags = {
     Name = "${var.vpc1_name}-public_subnet-${count.index+1}"
     test = "public"
   }
}
resource "aws_subnet" "vpc1private_subnets" {

   count = length(var.VPC1_private_subnets)
   vpc_id = aws_vpc.VPC1.id
   availability_zone = element(var.az-zons,count.index)
   cidr_block = element(var.VPC1_private_subnets,count.index)
   tags = {
     Name = "${var.vpc1_name}-private_subnet-${count.index+1}"
     test = "private"
   }

}
#### VPC2 Pubilic & Private Subnets #####
resource "aws_subnet" "vpc2public_subnets" {
    depends_on = [
      aws_vpc.VPC1,aws_internet_gateway.gw2
    ]
    count=length(var.VPC2_public_subnets)
    vpc_id = aws_vpc.VPC2.id
    availability_zone = element(var.az-zons,count.index)
     map_public_ip_on_launch = true
    tags={
        Name = "${var.vpc2_name}-public_subnet-${count.index+1}"
     test = "public"
    }
  
}
resource "aws_subnet" "vpc2private_subnets" {

   count = length(var.VPC2_private_subnets)
   vpc_id = aws_vpc.VPC2.id
   availability_zone = element(var.az-zons,count.index)
   cidr_block = element(var.VPC2_private_subnets,count.index)
   tags = {
     Name = "${var.vpc2_name}-private_subnet-${count.index+1}"
     test = "private"
   }

}

#### VPC3 Pubilic & Private Subnets #####

resource "aws_subnet" "vpc3public_subnets" {

   depends_on = [ aws_vpc.VPC3,aws_internet_gateway.gw3 ]

   count = length(var.VPC3_public_subnets)
   vpc_id = aws_vpc.VPC3.id
   availability_zone = element(var.az-zons,count.index)
   map_public_ip_on_launch = true
   cidr_block = element(var.VPC3_public_subnets,count.index)
   tags = {
     Name = "${var.vpc3_name}-public_subnet-${count.index+1}"
     test = "public"
   }
}
resource "aws_subnet" "vpc3private_subnets" {

   count = length(var.VPC3_private_subnets)
   vpc_id = aws_vpc.VPC3.id
   availability_zone = element(var.az-zons,count.index)
   cidr_block = element(var.VPC3_private_subnets,count.index)
   tags = {
     Name = "${var.vpc3_name}-private_subnet-${count.index+1}"
     test = "private"
   }

}


#### VPC4 Pubilic & Private Subnets #####

resource "aws_subnet" "vpc4public_subnets" {

   depends_on = [ aws_vpc.VPC4,aws_internet_gateway.gw4 ]

   count = length(var.VPC4_public_subnets)
   vpc_id = aws_vpc.VPC4.id
   availability_zone = element(var.az-zons,count.index)
   map_public_ip_on_launch = true
   cidr_block = element(var.VPC4_public_subnets,count.index)
   tags = {
     Name = "${var.vpc4_name}-public_subnet-${count.index+1}"
     test = "public"
   }
}
resource "aws_subnet" "vpc4private_subnets" {

   count = length(var.VPC4_private_subnets)
   vpc_id = aws_vpc.VPC4.id
   availability_zone = element(var.az-zons,count.index)
   cidr_block = element(var.VPC4_private_subnets,count.index)
   tags = {
     Name = "${var.vpc4_name}-private_subnet-${count.index+1}"
     test = "private"
   }

}