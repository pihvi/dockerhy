# Part 1
## 1.1
```bash
⋊> ~/o/dockerhy on master ◦ docker ps -a                                                                                                                                                                19:02:20
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                        PORTS                            NAMES
23349f0c9941        nginx               "nginx -g 'daemon of…"   34 seconds ago      Up 33 seconds                 80/tcp                           clever_brattain
b62d6d3b8f0e        nginx               "nginx -g 'daemon of…"   35 seconds ago      Exited (0) 7 seconds ago                                       wizardly_moore
d9c89d90a5d8        nginx               "nginx -g 'daemon of…"   2 minutes ago       Exited (0) 2 seconds ago                                       nostalgic_chandrasekhar
55bcd8dfd483        nginx               "nginx -g 'daemon of…"   3 minutes ago       Exited (0) 3 minutes ago                                       condescending_shannon
```

## 1.2
```bash
⋊> ~/o/dockerhy on master ◦ docker images                                                                                                                                                               19:09:57
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
⋊> ~/o/dockerhy on master ◦ docker ps -a                                                                                                                                                                19:10:00
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

## 1.3
```bash
⋊> ~/o/dockerhy on master ◦ docker run -it devopsdockeruh/pull_exercise                                                                                                                                 19:43:12
Unable to find image 'devopsdockeruh/pull_exercise:latest' locally
latest: Pulling from devopsdockeruh/pull_exercise
8e402f1a9c57: Pull complete
5e2195587d10: Pull complete
6f595b2fc66d: Pull complete
165f32bf4e94: Pull complete
67c4f504c224: Pull complete
Digest: sha256:7c0635934049afb9ca0481fb6a58b16100f990a0d62c8665b9cfb5c9ada8a99f
Status: Downloaded newer image for devopsdockeruh/pull_exercise:latest
Give me the password: basics
You found the correct password. Secret message is:
"This is the secret message"

```
