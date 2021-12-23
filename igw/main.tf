resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_id
  display_name   = "${var.igw_name}-${var.environment}"
  vcn_id         = var.vcn_id
}

resource "oci_core_route_table" "route_table" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.route_table_name}-${var.environment}"

  route_rules {
    destination       = var.route_rule_destination
    destination_type  = var.route_rule_destination_type
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
}