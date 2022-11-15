#peering VPC1 WITH VPC2
resource "aws_vpc_peering_connection" "owner1VPC1" {
  vpc_id = "${aws_vpc.VPC1.id}" #VPC1
  peer_vpc_id   = "${aws_vpc.VPC2.id}" #VPC2
      tags = {
      Name = "vpc1 to vpc2"
    }
}

resource "aws_vpc_peering_connection_accepter" "accepter1VPC2" {
  vpc_peering_connection_id = "${aws_vpc_peering_connection.owner1VPC1.id}"
  auto_accept               = true

}
#peering VPC1 with VPC3
resource "aws_vpc_peering_connection" "owner1VPC1toVPC3" {
  vpc_id = "${aws_vpc.VPC1.id}" #VPC1
  peer_vpc_id   = "${aws_vpc.VPC3.id}" #VPC3
      tags = {
      Name = "vpc1 to vpc3"
    }
}

resource "aws_vpc_peering_connection_accepter" "accepter1VPC3" {
  vpc_peering_connection_id = "${aws_vpc_peering_connection.owner1VPC1toVPC3.id}"
  auto_accept               = true

}
#peering VPC1 with VPC4
resource "aws_vpc_peering_connection" "owner1VPC1toVPC4" {
  vpc_id = "${aws_vpc.VPC1.id}" #VPC1
  peer_vpc_id   = "${aws_vpc.VPC4.id}" #VPC4
      tags = {
      Name = "vpc1 to vpc4"
    }
}

resource "aws_vpc_peering_connection_accepter" "accepter1VPC4" {
  vpc_peering_connection_id = "${aws_vpc_peering_connection.owner1VPC1toVPC4.id}"
  auto_accept               = true

}

#peering VPC2 with VPC3
resource "aws_vpc_peering_connection" "owner1VPC2toVPC3" {
  vpc_id = "${aws_vpc.VPC2.id}" #VPC2
  peer_vpc_id   = "${aws_vpc.VPC3.id}" #VPC3
      tags = {
      Name = "vpc2 to vpc3"
    }
}

resource "aws_vpc_peering_connection_accepter" "accepter2VPC3" {
  vpc_peering_connection_id = "${aws_vpc_peering_connection.owner1VPC2toVPC3.id}"
  auto_accept               = true

}
#peering VPC2 with VPC4
resource "aws_vpc_peering_connection" "owner1VPC2toVPC4" {
  vpc_id = "${aws_vpc.VPC2.id}" #VPC2
  peer_vpc_id   = "${aws_vpc.VPC4.id}" #VPC4
      tags = {
      Name = "vpc2 to vpc4"
    }
}

resource "aws_vpc_peering_connection_accepter" "accepter2VPC4" {
  vpc_peering_connection_id = "${aws_vpc_peering_connection.owner1VPC2toVPC4.id}"
  auto_accept               = true

}


#peering between VPC3 with VPC4
resource "aws_vpc_peering_connection" "owner2VPC3" {
  vpc_id = "${aws_vpc.VPC3.id}" #VPC1
  peer_vpc_id   = "${aws_vpc.VPC4.id}" #VPC2
      tags = {
      Name = "vpc3 to vpc4"
    }
}

resource "aws_vpc_peering_connection_accepter" "accepter3VPC4" {
  vpc_peering_connection_id = "${aws_vpc_peering_connection.owner2VPC3.id}"
  auto_accept               = true

}
