variable "VPC1CIDR" {
    default = "10.0.0.0/16"
}
variable "VPC2CIDR" {
    default = "172.0.0.0/16"
}
variable "VPC3CIDR" {
  default = "172.16.0.0/16"
}
variable "VPC4CIDR" {
  default = "192.168.0.0/16"
}
variable "VPC1_public_subnets" {
    type = list
    default = ["10.0.1.0/24"]

}
variable "VPC1_private_subnets" {
    type = list
    default = ["10.0.5.0/24"]

}
variable "az-zons" {
    type = list
    default = ["ap-south-1a"]
}


#VPC2Subnets
variable "VPC2_public_subnets" {
    type = list
    default = ["172.0.1.0/24"]

}
variable "VPC2_private_subnets" {
    type = list
    default = ["172.0.5.0/24"]

}
#VPC3Subnets
variable "VPC3_public_subnets" {
    type = list
    default = ["172.16.1.0/24"]

}
variable "VPC3_private_subnets" {
    type = list
    default = ["172.16.5.0/24"]

}
#VPC4Subnets

variable "VPC4_public_subnets" {
    type = list
    default = ["192.168.1.0/24"]

}
variable "VPC4_private_subnets" {
    type = list
    default = ["192.168.5.0/24"]

}

variable "vpc1_name" {
    default = "customVpc1"
  
}
variable "vpc2_name" {
    default = "customVpc2"
  
}
variable "vpc3_name" {
    default = "customVpc3"
  
}
variable "vpc4_name" {
    default = "customVpc4"
  
}


