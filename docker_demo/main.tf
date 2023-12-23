# Define a Docker container
resource "docker_container" "example_container" {
    name  = "my-nginx"       # Name of the container
    image = "nginx:latest"   # Docker image to use

    ports {
        internal = 80          # Internal container port
        external = 80        # External port to expose on the host
    }
}

