job "nginx" {
  datacenters = ["dc1"]
  group "nginx" {
    count = 1
    task "nginx" {
      driver = "docker"
      config {
        image = "nginx"
        port_map {
          http = 80
        }
        volumes = [
          "local:/etc/nginx/conf.d",
        ]
      }
      template {
        data = <<EOF
upstream backend {
{{ range service "back" }}
  server {{ .Address }}:{{ .Port }};
{{ else }}server 127.0.0.1:65535; # force a 502
{{ end }}
}

upstream frontend {
{{ range service "front" }}
  server {{ .Address }}:{{ .Port }};
{{ else }}server 127.0.0.1:65535; # force a 502
{{ end }}
}

server {
   listen 80;

   location /back {
      proxy_pass http://backend;
   }
   location / {
      proxy_pass http://frontend;
   }
}
EOF
        destination   = "local/load-balancer.conf"
        change_mode   = "signal"
        change_signal = "SIGHUP"
      }

      resources {
        cpu    = 200 # 500 MHz
        memory = 256 # 256MB
        network {
          mbits = 10
          port "http" {
            static = 8080
          }
        }
      }

      service {
        name = "nginx"
        port = "http"
      }
    }
  }
}
