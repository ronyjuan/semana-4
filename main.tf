terraform {
  required_version = ">= 1.3.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "dev_net" {
  name = "dev-network"
}

resource "docker_network" "qa_net" {
  name = "qa-network"
}

module "env_dev" {
  source = "./modules/environment"

  env_name     = "dev"
  network_name = docker_network.dev_net.name

  web_container_name = "web-dev"
  web_host_port      = 4001
  web_container_port = 80

  api_container_name = "api-dev"
  api_host_port      = 4002
  api_container_port = 3000

  bd_container_name  = "bd-dev"
  bd_host_port       = 4003
  bd_container_port  = 5432
}

module "env_qa" {
  source = "./modules/environment"

  env_name     = "qa"
  network_name = docker_network.qa_net.name

  web_container_name = "web-qa"
  web_host_port      = 5001
  web_container_port = 80

  api_container_name = "api-qa"
  api_host_port      = 5002
  api_container_port = 3000

  bd_container_name  = "bd-qa"
  bd_host_port       = 5003
  bd_container_port  = 5432
}