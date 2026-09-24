terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "postgres" {
  name         = "postgres:15-alpine"
  keep_locally = true
}

resource "docker_image" "node" {
  name         = "node:18-alpine"
  keep_locally = true
}

resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

# 1. Base de Datos
resource "docker_container" "db" {
  name  = var.bd_container_name
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_USER=app_user",
    "POSTGRES_PASSWORD=app_password",
    "POSTGRES_DB=app_db"
  ]

  ports {
    internal = var.bd_container_port
    external = var.bd_host_port
  }

  networks_advanced {
    name = var.network_name
  }
}

# 2. Backend
resource "docker_container" "api" {
  name  = var.api_container_name
  image = docker_image.node.image_id

  command = ["sh", "-c", "echo 'const http = require(\"http\"); const server = http.createServer((req, res) => res.end(\"API ${var.env_name}\")); server.listen(${var.api_container_port});' > index.js && node index.js"]

  env = [
    "DB_HOST=${var.bd_container_name}",
    "DB_PORT=${var.bd_container_port}",
    "PORT=${var.api_container_port}"
  ]

  ports {
    internal = var.api_container_port
    external = var.api_host_port
  }

  networks_advanced {
    name = var.network_name
  }

  depends_on = [docker_container.db]
}

# 3. Frontend
resource "docker_container" "web" {
  name  = var.web_container_name
  image = docker_image.nginx.image_id

  command = ["sh", "-c", "echo '<h1>Entorno ${var.env_name}</h1>' > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"]

  ports {
    internal = var.web_container_port
    external = var.web_host_port
  }

  networks_advanced {
    name = var.network_name
  }

  depends_on = [docker_container.api]
}