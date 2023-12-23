terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}
# Configure Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock" # Provide Docker daemon socket path
}