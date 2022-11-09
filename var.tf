variable REGION {
    default = "us-west-2"
}

variable ZONE1 {
    default = "us-west-2a"
}

variable AMIS {
    type = map
    default = {
        us-west-2 = "ami-0d593311db5abb72b"
        us-west-1 = "ami-017c001a88dd93847"
    }
}

variable INSTANCE_TYPE {
    type = string
    description = "type of ec2 instance"
    default = "t3.micro"
}