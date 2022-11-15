variable "VPC1cidr" {
  
}
variable "VPC2cidr" {
  
}
variable "VPC3cidr" {
  
}
variable "VPC4cidr" {
  
}
variable "vpc1_name" {
    }
variable "vpc2_name" {
    }
variable "vpc3_name" {
    }
variable "vpc4_name" {
    }
#VPC1Subnets
variable "VPC1_public_subnets" {
    type = list
    
}
variable "VPC1_private_subnets" {
    type = list
    
}
#VPC2Subnets
variable "VPC2_public_subnets" {
    type = list
   

}
variable "VPC2_private_subnets" {
    type = list
    
}
#VPC3Subnets
variable "VPC3_public_subnets" {
    type = list


}
variable "VPC3_private_subnets" {
    type = list


}
#VPC4Subnets

variable "VPC4_public_subnets" {
    type = list
    

}
variable "VPC4_private_subnets" {
    type = list
    

}
variable "az-zons" {
    type = list
    
}