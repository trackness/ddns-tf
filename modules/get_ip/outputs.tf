output "home_ip" {
  description = "The external IP address of the local network."
  value = chomp(data.http.home_ip.body)
}
