output "tunnel1_address" {
  value = aws_vpn_connection.hq.tunnel1_address
}

output "tunnel2_address" {
  value = aws_vpn_connection.hq.tunnel2_address
}

output "tunnel1_preshared_key" {
  value     = aws_vpn_connection.hq.tunnel1_preshared_key
  sensitive = true
}

output "tunnel1_cgw_inside_address" {
  value = aws_vpn_connection.hq.tunnel1_cgw_inside_address
}

output "tunnel1_vgw_inside_address" {
  value = aws_vpn_connection.hq.tunnel1_vgw_inside_address
}