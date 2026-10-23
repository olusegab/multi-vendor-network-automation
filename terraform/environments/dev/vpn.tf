resource "aws_customer_gateway" "hq" {
  bgp_asn    = 65000
  ip_address = var.sophos_public_ip
  type       = "ipsec.1"
  tags       = { Name = "${var.project_name}-sophos-cgw" }
}

resource "aws_vpn_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "${var.project_name}-vgw" }
}

resource "aws_vpn_connection" "hq" {
  customer_gateway_id                  = aws_customer_gateway.hq.id
  vpn_gateway_id                       = aws_vpn_gateway.main.id
  type                                 = "ipsec.1"
  static_routes_only                   = true
  tags                                 = { Name = "${var.project_name}-hq-vpn" }
  tunnel1_ike_versions                 = ["ikev2"]
  tunnel1_phase1_encryption_algorithms = ["AES256"]
  tunnel1_phase1_integrity_algorithms  = ["SHA2-256"]
  tunnel1_phase1_dh_group_numbers      = [14]
  tunnel1_phase2_encryption_algorithms = ["AES256"]
  tunnel1_phase2_integrity_algorithms  = ["SHA2-256"]
  tunnel1_phase2_dh_group_numbers      = [14]

  tunnel2_ike_versions                 = ["ikev2"]
  tunnel2_phase1_encryption_algorithms = ["AES256"]
  tunnel2_phase1_integrity_algorithms  = ["SHA2-256"]
  tunnel2_phase1_dh_group_numbers      = [14]
  tunnel2_phase2_encryption_algorithms = ["AES256"]
  tunnel2_phase2_integrity_algorithms  = ["SHA2-256"]
  tunnel2_phase2_dh_group_numbers      = [14]
}

resource "aws_vpn_connection_route" "onprem" {
  for_each               = toset(var.onprem_cidrs)
  vpn_connection_id      = aws_vpn_connection.hq.id
  destination_cidr_block = each.value
}

resource "aws_vpn_gateway_route_propagation" "public" {
  vpn_gateway_id = aws_vpn_gateway.main.id
  route_table_id = aws_route_table.public.id
}