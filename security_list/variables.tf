 variable "compartment_id" {}
 
 variable "vcn_id" {}

 variable "security_list_name" {}

 variable "security_list_egress_security_rules_description" {
   default = "description"
 }

 variable "security_list_ingress_security_rules_description" {
    default = "description"
 }

 variable "environment" {}