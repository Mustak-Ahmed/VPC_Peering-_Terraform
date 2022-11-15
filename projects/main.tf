module "vpc" {
    source = "../modules/VPC"
    VPC1CIDR=var.VPC1CIDR
    VPC1_public_subnets=var.VPC1_public_subnets
    VPC1_private_subnets=var.VPC1_private_subnets
    vpc1_name=var.vpc1_name
    az-zons=var.az-zons

    VPC2CIDR=var.VPC2CIDR
    VPC2_public_subnets=var.VPC2_public_subnets
    VPC2_private_subnets=var.VPC2_private_subnets
    vpc2_name=var.vpc2_name
    VPC3CIDR = var.VPC3CIDR
    
    VPC3_public_subnets = var.VPC3_public_subnets
    VPC3_private_subnets = var.VPC3_private_subnets
    vpc3_name = var.vpc3_name

    VPC4CIDR = var.VPC4CIDR
    VPC4_public_subnets = var.VPC4_public_subnets
    VPC4_private_subnets = var.VPC4_private_subnets
    vpc4_name = var.vpc4_name

  
}