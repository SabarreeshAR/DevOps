resource "aws_internet_gateway" "IGWtiger" {
    vpc_id = aws_vpc.tigerVPC.id
    tags = {
        Name="IGWTiger"
    }  
}

resource "aws_route_table" "TigerRT" {
    vpc_id = aws_vpc.tigerVPC.id

    route  {
      cidr_block = "0.0.0.0/0"      
      gateway_id = aws_internet_gateway.IGWtiger.id
    } 
}

resource "aws_route_table_association" "RTATigerPublicSubnet" {
    subnet_id = "${aws_subnet.tigerDev.id}"
    route_table_id = "${aws_route_table.TigerRT.id}" 
}

resource "aws_security_group" "sgTiger" {
    vpc_id = "${aws_vpc.tigerVPC.id}"

    
    //If you do not add this rule, you can not reach the NGIX  
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}