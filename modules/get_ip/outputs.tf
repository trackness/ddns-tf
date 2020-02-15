output "home_ip" {
  value = chomp(data.http.home_ip.body)
}
