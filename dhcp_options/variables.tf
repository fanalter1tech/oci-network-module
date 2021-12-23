 variable "compartment_id" {}
 
 variable "vcn_id" {}

 variable "dhcp_options_name" {
     default = ""
 }

 variable "dhcp_options_type" {
     default = ""
 }

 variable "dhcp_options_search_domain_names" {
    default = []
}

 variable "environment" {}