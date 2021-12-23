provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

resource "oci_core_vcn" "this" {
  cidr_block     = var.cidr_block
  dns_label      = var.network_name
  compartment_id = var.compartment_ocid
  display_name   = "${var.network_name}-${var.environment}"
}

module "internet_gateway" {
    source = "./igw"

    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.this.id 
    environment = var.environment
    igw_name = var.igw_name
    route_table_name = var.route_table_name
    route_rule_destination = var.route_rule_destination
    route_rule_destination_type = var.route_rule_destination_type
    
}

module "dhcp_options" {
    source = "./dhcp_options"
    
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.this.id 
    environment = var.environment
}

module "security_list" {
    source = "./security_list"

    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.this.id 
    environment = var.environment
    security_list_name = var.security_list_name
}
