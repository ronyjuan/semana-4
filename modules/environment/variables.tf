variable "env_name" {
  type        = string
  description = "Nombre del entorno (dev / qa)"
}

variable "network_name" {
  type        = string
  description = "Nombre de la red Docker asociada"
}

variable "web_container_name" {
  type        = string
}

variable "web_host_port" {
  type        = number
}

variable "web_container_port" {
  type        = number
}

variable "api_container_name" {
  type        = string
}

variable "api_host_port" {
  type        = number
}

variable "api_container_port" {
  type        = number
}

variable "bd_container_name" {
  type        = string
}

variable "bd_host_port" {
  type        = number
}

variable "bd_container_port" {
  type        = number
}