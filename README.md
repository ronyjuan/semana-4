# Despliegue de Entornos DEV y QA con Terraform y Docker

Este proyecto aprovisiona automáticamente la arquitectura de contenedores para los entornos de **DEV** y **QA** mediante infraestructura como código (IaC) utilizando Terraform y Docker.

## Arquitectura del Sistema

### Entorno DEV
* **Frontend (Nginx):** `web-dev` en puerto host `4001:80` (sirve `index.html`).
* **Backend (Node.js):** `api-dev` en puerto host `4002:3000` (ejecuta `index.js`).
* **Base de Datos (PostgreSQL):** `bd-dev` en puerto host `4003:5432`.

### Entorno QA
* **Frontend (Nginx):** `web-qa` en puerto host `5001:80` (sirve `index.html`).
* **Backend (Node.js):** `api-qa` en puerto host `5002:3000` (ejecuta `index.js`).
* **Base de Datos (PostgreSQL):** `bd-qa` en puerto host `5003:5432`.

---

## Requisitos Previos

* [Git](https://git-scm.com/)
* [Docker](https://www.docker.com/) (en ejecución)
* [Terraform](https://developer.hashicorp.com/terraform/downloads) (v1.3.0+)

---

## Instrucciones Paso a Paso

### 1. Clonar el repositorio

```bash
git clone [https://github.com/tu-usuario/semana-4.git](https://github.com/tu-usuario/semana-4.git)
cd semana-4