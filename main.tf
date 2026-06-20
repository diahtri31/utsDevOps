terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

# Mengunduh image Ubuntu terbaru
resource "docker_image" "ubuntu" {
  name         = "ubuntu:latest"
  keep_locally = true
}

# Membuat wadah komputer kosong sesuai spesifikasi UAS
resource "docker_container" "server_uas" {
  image   = docker_image.ubuntu.image_id
  name    = "server_uas_analitik"
  restart = "always"
  
  # Perintah agar kontainer tetap hidup di latar belakang
  command = ["tail", "-f", "/dev/null"]
}