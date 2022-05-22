resource "aws_vpc" "tigerVPC" {
    cidr_block = "50.0.0.0/20"
    tags = {
      Name = "tigerVPC"
    }
}

resource "aws_subnet" "tigerDev" {
    vpc_id = "${aws_vpc.tigerVPC.id}"
    cidr_block = "50.0.0.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1a"

    tags = {
      "Name" = "tigerDev"
    }
  
}