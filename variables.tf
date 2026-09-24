variable "docker_host" {
  type        = string
  default     = "unix:///var/run/docker.sock"
  description = "Socket o host de conexión con el demonio de Docker"
}