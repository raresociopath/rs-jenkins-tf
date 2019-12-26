output "jenkins_private_pem" {
  value = "${tls_private_key.jenkins.private_key_pem}"
}
