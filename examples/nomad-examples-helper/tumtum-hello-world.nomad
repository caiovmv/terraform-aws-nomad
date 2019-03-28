job "tumtum-hello-world" {
  datacenters = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e"]
  type = "service"
  group "example" {
    count = 6
    task "hello-world" {
    service {
        tags = ["hello-world", "us-east-1"]
        port = "http"
        check {
          type     = "http"
          port     = "http"
          path     = "/"
          interval = "5s"
          timeout  = "2s"
        }
      }
      driver = "docker"
      config {
        image = "tutum/hello-world"
        network_mode = "host"
      }

      resources {
        network {
          mbits = 10
          port "http" {
            static = 80
          }
        }
      }
    }
  }
}
