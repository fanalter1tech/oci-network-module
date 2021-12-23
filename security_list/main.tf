resource "oci_core_security_list" "security_list" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.security_list_name}-${var.environment}"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }

  // allow outbound udp traffic on a port range
  egress_security_rules {
    description = var.security_list_egress_security_rules_description
    destination = "0.0.0.0/0"
    protocol    = "17" // udp
    stateless   = true

    udp_options {
      // These values correspond to the destination port range.
      min = 319
      max = 320
    }
  }

  // allow inbound ssh traffic from a specific port
  ingress_security_rules {
    protocol  = "6" // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      source_port_range {
        min = 100
        max = 100
      }

      // These values correspond to the destination port range.
      min = 22
      max = 22
    }
  }

  // allow inbound icmp traffic of a specific type
  ingress_security_rules {
    description = var.security_list_ingress_security_rules_description
    protocol    = 1
    source      = "0.0.0.0/0"
    stateless   = true

    icmp_options {
      type = 3
      code = 4
    }
  }
}