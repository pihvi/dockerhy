job "dockerhy" {
  datacenters = ["dc1"]
  group "frontAndBack" {
    task "front" {
      driver = "docker"
      artifact {
        source = "https://raw.githubusercontent.com/pihvi/dockerhy/master/projekti/front/front.tar.bz2"
        options {
          archive = false
        }
      }
      config {
        load = "front.tar.bz2"
        image = "dcea3493b118"
        port_map {
          http = 8043
        }
      }
      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
        network {
          mbits = 10
          port  "http"  {
            static = "80"
          }
        }
      }
      service {
        name = "front"
        port = "http"
        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
    task "back" {
      driver = "docker"
      artifact {
        source = "https://raw.githubusercontent.com/pihvi/dockerhy/master/projekti/back/back.tar.bz2"
        options {
          archive = false
        }
      }
      config {
        load = "back.tar.bz2"
        image = "6aabafe02d69"
        port_map {
          http = 3000
        }
      }
      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
        network {
          mbits = 10
          port  "http"  {
            static = "3000"
          }
        }
      }
      service {
        name = "back"
        port = "http"
        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
