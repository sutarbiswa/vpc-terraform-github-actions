#vpc
resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr
    #instance_tenancy = default

    tags = {
        "Name" = "my_vpc"
    }
}

# this will create 2subnets
resource "aws_subnet" "subnet1" {
  count = length(var.subnet_cidr)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.az.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_names[count.index]
  }
}

#internet_gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "myigw"
  }
}

#route_table
resource "aws_route_table" "pbrt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0" #public route
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    "Name" = "myroutetable"
  }
}

#route_table_association
resource "aws_route_table_association" "pbrta" {
  count = length(var.subnet_cidr)
  subnet_id      = aws_subnet.subnet1[count.index].id
  route_table_id = aws_route_table.pbrt.id
}