resource "oci_core_dhcp_options" "dhcp_options" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.dhcp_options_name}-${var.environment}"

  // required
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  // optional
  options {
    type                = var.dhcp_options_type
    search_domain_names = var.dhcp_options_search_domain_names
  }
}