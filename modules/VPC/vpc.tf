resource "aws_vpc" "VPC1" {
    cidr_block = var.VPC1cidr
    tags = {
  Name = var.vpc1_name
  } 
}
resource "aws_vpc" "VPC2" {
    cidr_block = var.VPC2cidr
    tags = {
  Name = var.vpc2_name
  } 
}
resource "aws_vpc" "VPC3" {
    cidr_block = var.VPC3cidr
    tags = {
  Name = var.vpc3_name
  } 
}
resource "aws_vpc" "VPC4" {
    cidr_block = var.VPC4cidr
    tags = {
  Name = var.vpc4_name
  } 
}