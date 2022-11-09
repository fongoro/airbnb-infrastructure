resource "aws_instance" "dove-instance" {
    ami = var.AMIS[var.REGION]
    instance_type          = var.INSTANCE_TYPE
    monitoring = true
    ebs_optimized = true
    availability_zone      = "us-west-2a"
    key_name               = "jenkins-keypair"
    vpc_security_group_ids = ["sg-0b3869a314f2d2574"]
    
    tags = {
        "name" = "Airbnb-webserver"
    }
}