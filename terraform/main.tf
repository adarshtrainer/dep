resource "aws_security_group" "devops_sgx" {
 name = "devops-sgx"
 ingress {
 from_port = 22
 to_port = 22
 protocol = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
 from_port = 8080
 to_port = 8080
 protocol = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
 from_port = 80
 to_port = 80
 protocol = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
 from_port = 0
 to_port = 0
 protocol = "-1"
 cidr_blocks = ["0.0.0.0/0"]
 }
}
resource "aws_instance" "devops_ec2" {
 ami = "ami-01a00762f46d584a1"  
 instance_type = "c7i-flex.large"
 key_name = "sanchari"  
 security_groups = [aws_security_group.devops_sgx.name]
 tags = {
 Name = "devops-ec2"
 }
}