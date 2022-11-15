###### VPC2 Route Table ######

resource "aws_route_table" "vpc1_public_rt" {

    depends_on = [ aws_vpc.VPC1,aws_internet_gateway.gw1 ]

     vpc_id = aws_vpc.VPC1.id  #VPC1PublicSubnet

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw1.id
    } 
   route {
      cidr_block = var.VPC2CIDR  #VPC2_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC1.id
    }
       route {
      cidr_block = var.VPC3CIDR  #VPC3_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC1toVPC3.id
    }
    route {
      cidr_block = var.VPC4CIDR  #VPC4_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC1toVPC4.id
    }

    tags = {
      Name = "Route Table for ${var.vpc1_name}-Internet-gateway"
    }
}
resource "aws_route_table_association" "vpc1_public_rt_associate" {

        depends_on = [ aws_subnet.vpc1public_subnets,aws_route_table.vpc1_public_rt]

        count = length(var.VPC1_public_subnets)
        subnet_id      = element(aws_subnet.vpc1public_subnets.*.id,count.index)
        route_table_id = aws_route_table.vpc1_public_rt.id

}
resource "aws_route_table" "vpc1_NAT-Gateway-RT" {
  depends_on = [
    aws_nat_gateway.NATgw1
  ]

  vpc_id = aws_vpc.VPC1.id #VPC1PrivateSubnet

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgw1.id
  }
     route {
      cidr_block = var.VPC2CIDR #VPC2_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC1.id
    }
     route {
      cidr_block = var.VPC3CIDR  #VPC3_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC1toVPC3.id
    }
    route {
      cidr_block = var.VPC4CIDR  #VPC4_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC1toVPC4.id
    }

  tags = {
    Name = "Route Table for ${var.vpc1_name}-NAT Gateway"
  }

}
resource "aws_route_table_association" "vpc1_Nat-Gateway-RT-Association" {
  depends_on = [
    aws_route_table.vpc1_NAT-Gateway-RT
  ]
  count = length(var.VPC1_private_subnets)
  subnet_id      = element(aws_subnet.vpc1private_subnets.*.id,count.index)

  route_table_id = aws_route_table.vpc1_NAT-Gateway-RT.id
}



###### VPC2 Route Table ######
resource "aws_route_table" "vpc2_public_rt" {

    depends_on = [ aws_vpc.VPC2,aws_internet_gateway.gw2 ]

     vpc_id = aws_vpc.VPC2.id #VPC2PublicSubnet

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw2.id
    }
    route {
      cidr_block = var.VPC1CIDR #VPC1_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC1.id
    }
    route {
      cidr_block = var.VPC3CIDR  #VPC3_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC2toVPC3.id
    }
    route {
      cidr_block = var.VPC4CIDR  #VPC4_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC2toVPC4.id
    } 

    tags = {
      Name = "Route Table for ${var.vpc2_name}-Internet-gateway"
    }
}

resource "aws_route_table_association" "vpc2_public_rt_associate" {

        depends_on = [ aws_subnet.vpc2public_subnets,aws_route_table.vpc2_public_rt]

        count = length(var.VPC2_public_subnets)
        subnet_id      = element(aws_subnet.vpc2public_subnets.*.id,count.index)
        route_table_id = aws_route_table.vpc2_public_rt.id

}


#vpc2natgateway
resource "aws_route_table" "vpc2_NAT-Gateway-RT" {
  depends_on = [
    aws_nat_gateway.NATgw2
  ]

  vpc_id = aws_vpc.VPC2.id #VPC2PrivateSubnet

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgw2.id
  }
     route {
      cidr_block = var.VPC1CIDR #VPC1_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC1.id
    }
    route {
      cidr_block = var.VPC3CIDR  #VPC3_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC2toVPC3.id
    } 
    route {
      cidr_block = var.VPC4CIDR  #VPC4_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC2toVPC4.id
    }

  tags = {
    Name = "Route Table for ${var.vpc2_name}-NAT Gateway"
  }

}

resource "aws_route_table_association" "vpc2_Nat-Gateway-RT-Association" {
  depends_on = [
    aws_route_table.vpc2_NAT-Gateway-RT
  ]
  count = length(var.VPC2_public_subnets)
#  Private Subnet ID for adding this route table to the DHCP server of Private subnet!
  subnet_id      = element(aws_subnet.vpc2private_subnets.*.id,count.index)

# Route Table ID
  route_table_id = aws_route_table.vpc2_NAT-Gateway-RT.id
}

#VPC3RT
resource "aws_route_table" "vpc3_public_rt" {

    depends_on = [ aws_vpc.VPC3,aws_internet_gateway.gw3 ]

     vpc_id = aws_vpc.VPC3.id #VPC2PublicSubnet

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw3.id
    }
    route {
      cidr_block = var.VPC4CIDR #VPC4_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner2VPC3.id
    } 
    route {
      cidr_block = var.VPC1CIDR #VPC1_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC1toVPC3.id
    }
    route {
      cidr_block = var.VPC2CIDR  #VPC2_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC2toVPC3.id
    }

    tags = {
      Name = "Route Table for ${var.vpc3_name}-Internet-gateway"
    }
}

resource "aws_route_table_association" "vpc3_public_rt_associate" {

        depends_on = [ aws_subnet.vpc3public_subnets,aws_route_table.vpc3_public_rt]

        count = length(var.VPC3_public_subnets)
        subnet_id      = element(aws_subnet.vpc3public_subnets.*.id,count.index)
        route_table_id = aws_route_table.vpc3_public_rt.id

}


#vpc3natgateway
resource "aws_route_table" "vpc3_NAT-Gateway-RT" {
  depends_on = [
    aws_nat_gateway.NATgw3
  ]

  vpc_id = aws_vpc.VPC3.id #VPC2PrivateSubnet

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgw3.id
  }
     route {
      cidr_block = var.VPC4CIDR #VPC4_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner2VPC3.id
    }
    route {
      cidr_block = var.VPC1CIDR #VPC1_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC1toVPC3.id
    }
    route {
      cidr_block = var.VPC2CIDR  #VPC2_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC2toVPC3.id
    }

  tags = {
    Name = "Route Table for ${var.vpc3_name}-NAT Gateway"
  }

}

resource "aws_route_table_association" "vpc3_Nat-Gateway-RT-Association" {
  depends_on = [
    aws_route_table.vpc3_NAT-Gateway-RT
  ]
  count = length(var.VPC3_public_subnets)
#  Private Subnet ID for adding this route table to the DHCP server of Private subnet!
  subnet_id      = element(aws_subnet.vpc3private_subnets.*.id,count.index)

# Route Table ID
  route_table_id = aws_route_table.vpc3_NAT-Gateway-RT.id
}


#VPC4RT
resource "aws_route_table" "vpc4_public_rt" {

    depends_on = [ aws_vpc.main4,aws_internet_gateway.gw4 ]

     vpc_id = aws_vpc.VPC4.id #VPC2PublicSubnet

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw4.id
    }
    route {
      cidr_block = var.VPC3CIDR #VPC3_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner2VPC3.id
    }
    route {
      cidr_block = var.VPC1CIDR  #VPC4_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC1toVPC4.id
    }
    route {
      cidr_block = var.VPC2CIDR  #VPC2_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC2toVPC4.id
    } 

    tags = {
      Name = "Route Table for ${var.vpc4_name}-Internet-gateway"
    }
}

resource "aws_route_table_association" "vpc4_public_rt_associate" {

        depends_on = [ aws_subnet.vpc4public_subnets,aws_route_table.vpc4_public_rt]

        count = length(var.VPC4_public_subnets)
        subnet_id      = element(aws_subnet.vpc4public_subnets.*.id,count.index)
        route_table_id = aws_route_table.vpc4_public_rt.id

}


#vpc4natgateway
resource "aws_route_table" "vpc4_NAT-Gateway-RT" {
  depends_on = [
    aws_nat_gateway.NATgw4
  ]

  vpc_id = aws_vpc.VPC4.id #VPC2PrivateSubnet

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgw4.id
  }
     route {
      cidr_block = var.VPC3CIDR #VPC3_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner2VPC3.id
    }
    route {
      cidr_block = var.VPC1CIDR  #VPC4_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC1toVPC4.id
    }
    route {
      cidr_block = var.VPC2CIDR  #VPC2_CIDRBlock
      gateway_id = aws_vpc_peering_connection.owner1VPC2toVPC4.id
    }  

  tags = {
    Name = "Route Table for ${var.vpc4_name}-NAT Gateway"
  }

}

resource "aws_route_table_association" "vpc4_Nat-Gateway-RT-Association" {
  depends_on = [
    aws_route_table.vpc4_NAT-Gateway-RT
  ]
  count = length(var.VPC4_public_subnets)
#  Private Subnet ID for adding this route table to the DHCP server of Private subnet!
  subnet_id      = element(aws_subnet.vpc4private_subnets.*.id,count.index)

# Route Table ID
  route_table_id = aws_route_table.vpc4_NAT-Gateway-RT.id
}