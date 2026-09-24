output "dev_frontend_url" {
  value       = "http://localhost:${module.env_dev.web_port}"
  description = "URL del Frontend en DEV"
}

output "dev_backend_url" {
  value       = "http://localhost:${module.env_dev.api_port}"
  description = "URL de la API Backend en DEV"
}

output "qa_frontend_url" {
  value       = "http://localhost:${module.env_qa.web_port}"
  description = "URL del Frontend en QA"
}

output "qa_backend_url" {
  value       = "http://localhost:${module.env_qa.api_port}"
  description = "URL de la API Backend en QA"
}