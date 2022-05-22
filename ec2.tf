

resource "aws_instance" "web" {
    ami = "ami-04893cdb768d0f9ee"
    instance_type = "t2.micro"
    key_name = "ubu_Allewan"    
    subnet_id = aws_subnet.tigerDev.id
    vpc_security_group_ids = ["${aws_security_group.sgTiger.id}"]
    

    tags = {
      Name = "Webserver1"
      env = "dev"
      Country = "India"
    }
}

