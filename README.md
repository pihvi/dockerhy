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

## 1.4
```fish
⋊> ~/o/dockerhy on master ◦ docker run -d devopsdockeruh/exec_bash_exercise                                                                                                                             20:38:31
7e91f2bda7f85537e30023a86521f5e5d98e95e299d2d1d8af7d93def46bc814
⋊> ~/o/dockerhy on master ◦ docker exec -it 7e bash                                                                                                                                                     20:38:36
root@7e91f2bda7f8:/usr/app# tail -f ./logs.txt
Mon, 07 Oct 2019 17:38:36 GMT
Mon, 07 Oct 2019 17:38:39 GMT
Mon, 07 Oct 2019 17:38:42 GMT
Mon, 07 Oct 2019 17:38:45 GMT
Secret message is:
"Docker is easy"
```

## 1.5
```fish
⋊> ~/D/o/dockerhy on master ◦ docker run -it ubuntu:16.04 sh -c 'apt-get update; apt-get install curl -y; echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;'
Get:1 http://security.ubuntu.com/ubuntu xenial-security InRelease [109 kB]
... a lot of apt output removed
Setting up curl (7.47.0-1ubuntu2.14) ...
Processing triggers for libc-bin (2.23-0ubuntu11) ...
Processing triggers for ca-certificates (20170717~16.04.2) ...
Updating certificates in /etc/ssl/certs...
148 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
Input website:
helsinki.fi
Searching..
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="http://www.helsinki.fi/">here</a>.</p>
</body></html>
```

## 1.6
```fish
⋊> ~/D/o/dockerhy on master ↑ cat ex1.6/Dockerfile                                                                                                                                                      13:00:38
FROM devopsdockeruh/overwrite_cmd_exercise
CMD ["-c"]
⋊> ~/D/o/dockerhy on master ↑ docker build -t docker-clock ex1.6/                                                                                                                                       13:00:54
Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM devopsdockeruh/overwrite_cmd_exercise
 ---> 0f7f459b76c9
Step 2/2 : CMD ["-c"]
 ---> Using cache
 ---> 70b9200289fb
Successfully built 70b9200289fb
Successfully tagged docker-clock:latest
⋊> ~/D/o/dockerhy on master ↑ docker run docker-clock                                                                                                                                                   13:01:01
1
2
3
```

## 1.7
```fish
⋊> ~/D/o/dockerhy on master ⨯ cat ex1.7/Dockerfile                                                                                                                                                      13:12:52
FROM ubuntu:16.04
RUN apt-get update && apt-get install -y curl
CMD echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;
⋊> ~/D/o/dockerhy on master ⨯ docker build -t curler ex1.7/                                                                                                                                             13:13:17
Sending build context to Docker daemon  2.048kB
Step 1/3 : FROM ubuntu:16.04
 ---> 657d80a6401d
Step 2/3 : RUN apt-get update && apt-get install -y curl
 ---> Using cache
 ---> 4308a334068e
Step 3/3 : CMD echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;
 ---> Using cache
 ---> f4d6ba024ecc
Successfully built f4d6ba024ecc
Successfully tagged curler:latest
⋊> ~/D/o/dockerhy on master ⨯ docker run -it curler                                                                                                                                                     13:13:21
Input website:
helsinki.fi
Searching..
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="http://www.helsinki.fi/">here</a>.</p>
</body></html>
```

## 1.8
```fish
⋊> ~/D/o/dockerhy on master ◦ docker run devopsdockeruh/first_volume_exercise                  14:50:59
(node:1) ExperimentalWarning: The fs.promises API is experimental
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
^CClosing file
⋊> ~/D/o/dockerhy on master ◦ docker ps -a                                                     14:51:20
CONTAINER ID        IMAGE                                  COMMAND             CREATED             STATUS                     PORTS               NAMES
f22c7b173cc5        devopsdockeruh/first_volume_exercise   "node index"        9 seconds ago       Exited (0) 4 seconds ago                       amazing_tereshkova
⋊> ~/D/o/dockerhy on master ◦ docker cp "f22://usr/app/" .                                     14:51:34
⋊> ~/D/o/dockerhy on master ↑ docker run -v /Users/amattila/opiskelu/dockerhy/app:/usr/app devopsdockeruh/first_volume_exercise                                                                         14:54:07
(node:1) ExperimentalWarning: The fs.promises API is experimental
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
^CClosing file
⋊> ~/D/o/dockerhy on master ⨯ cat app/logs.txt                                                                                                                                                          14:54:57
Tue, 08 Oct 2019 11:54:36 GMT
Tue, 08 Oct 2019 11:54:39 GMT
Tue, 08 Oct 2019 11:54:42 GMT
Tue, 08 Oct 2019 11:54:45 GMT
Secret message is:
"Volume bind mount is easy"
Tue, 08 Oct 2019 11:54:51 GMT```
