# Part 1
[here](Part1.md)

# Part 2
[here](Part2.md)

# Part 3

## 3.1

### Docker files

```
⋊> ~/o/dockerhy on master ⨯ cat ex3.1/Dockerfile-back                                                                                                                                                   11:13:42
FROM ubuntu:16.04

WORKDIR /appsi
COPY backend-example-docker-master backend-example-docker

RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs && \
apt-get purge -y --auto-remove curl && \
rm -rf /var/lib/apt/lists/*

ENV FRONT_URL=http://localhost:5000
CMD cd backend-example-docker && npm install && npm start

⋊> ~/o/dockerhy on master ⨯ cat ex3.1/Dockerfile-front                                                                                                                                                  11:13:49
FROM ubuntu:16.04

WORKDIR /appsi
COPY frontend-example-docker-master frontend-example-docker

RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs && \
apt-get purge -y --auto-remove curl && \
rm -rf /var/lib/apt/lists/*

RUN cd frontend-example-docker && npm install

CMD cd frontend-example-docker && npm start
```

### before

```fish
⋊> ~/D/o/dockerhy on master ↑ docker images | grep i3                                                                                                                                                   14:13:27
backki3                                                        latest              ac20af00dd2a        11 minutes ago      300MB
frontti3                                                       latest              bef9a9a2f9a9        31 minutes ago      455MB
⋊> ~/D/o/dockerhy on master ↑ docker history frontti3                                                                                                                                                   14:13:37
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
bef9a9a2f9a9        31 minutes ago      /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "cd f…   0B
0d1736323425        31 minutes ago      /bin/sh -c cd frontend-example-docker && npm…   155MB
eec10353835e        32 minutes ago      /bin/sh -c node -v && npm -v                    0B
6c35232ccedb        32 minutes ago      /bin/sh -c apt install -y nodejs                103MB
1bf4cb33c17e        32 minutes ago      /bin/sh -c curl -sL https://deb.nodesource.c…   33.6MB
0c9d5c00574c        32 minutes ago      /bin/sh -c apt install -y curl                  16.3MB
f19ac6d9b204        32 minutes ago      /bin/sh -c apt update                           25.7MB
59169cf327b1        32 minutes ago      /bin/sh -c #(nop) COPY dir:b9883e18c4b1b2749…   386kB
04669079ab1b        2 months ago        /bin/sh -c #(nop) WORKDIR /appsi                0B
657d80a6401d        3 months ago        /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B
<missing>           3 months ago        /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B
<missing>           3 months ago        /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   745B
<missing>           3 months ago        /bin/sh -c rm -rf /var/lib/apt/lists/*          0B
<missing>           3 months ago        /bin/sh -c #(nop) ADD file:a5b5bea2fa5358461…   121MB
⋊> ~/D/o/dockerhy on master ↑ docker history backki3                                                                                                                                                    14:14:03
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
ac20af00dd2a        11 minutes ago      /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "cd b…   0B
c6f03fe6b7da        11 minutes ago      /bin/sh -c #(nop)  ENV FRONT_URL=http://loca…   0B
69e16402f84c        11 minutes ago      /bin/sh -c node -v && npm -v                    0B
73172da5ba30        11 minutes ago      /bin/sh -c apt install -y nodejs                103MB
f5bd43f8fb37        11 minutes ago      /bin/sh -c curl -sL https://deb.nodesource.c…   33.6MB
770925e2bdc9        14 minutes ago      /bin/sh -c apt install -y curl                  16.3MB
6d3f986b90e7        14 minutes ago      /bin/sh -c apt update                           25.7MB
546f866d3101        14 minutes ago      /bin/sh -c #(nop) COPY dir:dafb132035c9f6056…   219kB
04669079ab1b        2 months ago        /bin/sh -c #(nop) WORKDIR /appsi                0B
657d80a6401d        3 months ago        /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B
<missing>           3 months ago        /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B
<missing>           3 months ago        /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   745B
<missing>           3 months ago        /bin/sh -c rm -rf /var/lib/apt/lists/*          0B
<missing>           3 months ago        /bin/sh -c #(nop) ADD file:a5b5bea2fa5358461…   121MB
⋊> ~/D/o/dockerhy on master ↑
```

### after

```fish
⋊> ~/D/o/dockerhy on master ⨯ docker images | grep i3                                                                                                                                                   14:24:45
frontti3                                                       latest              69a825fabdfe        5 hours ago         426MB
backki3                                                        latest              76b41b45b3f9        5 hours ago         271MB
⋊> ~/D/o/dockerhy on master ⨯ docker history backki3                                                                                                                                                    19:28:15
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
76b41b45b3f9        5 hours ago         /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "cd b…   0B
8635a75c3dfe        5 hours ago         /bin/sh -c #(nop)  ENV FRONT_URL=http://loca…   0B
8dd36e577f18        5 hours ago         /bin/sh -c apt update && apt install -y curl…   150MB
546f866d3101        5 hours ago         /bin/sh -c #(nop) COPY dir:dafb132035c9f6056…   219kB
04669079ab1b        2 months ago        /bin/sh -c #(nop) WORKDIR /appsi                0B
657d80a6401d        3 months ago        /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B
<missing>           3 months ago        /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B
<missing>           3 months ago        /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   745B
<missing>           3 months ago        /bin/sh -c rm -rf /var/lib/apt/lists/*          0B
<missing>           3 months ago        /bin/sh -c #(nop) ADD file:a5b5bea2fa5358461…   121MB
⋊> ~/D/o/dockerhy on master ⨯ docker history frontti3                                                                                                                                                   19:28:27
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
69a825fabdfe        5 hours ago         /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "cd f…   0B
99a0c12189e0        5 hours ago         /bin/sh -c cd frontend-example-docker && npm…   155MB
e9c32193418b        5 hours ago         /bin/sh -c apt update && apt install -y curl…   150MB
59169cf327b1        6 hours ago         /bin/sh -c #(nop) COPY dir:b9883e18c4b1b2749…   386kB
04669079ab1b        2 months ago        /bin/sh -c #(nop) WORKDIR /appsi                0B
657d80a6401d        3 months ago        /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B
<missing>           3 months ago        /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B
<missing>           3 months ago        /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   745B
<missing>           3 months ago        /bin/sh -c rm -rf /var/lib/apt/lists/*          0B
<missing>           3 months ago        /bin/sh -c #(nop) ADD file:a5b5bea2fa5358461…   121MB
⋊> ~/D/o/dockerhy on master ↑
```

## 3.2.

```
⋊> ~/o/dockerhy on master ◦ cat ex3.2/Dockerfile                                                                                                                                                        11:10:59
FROM taskinen/yle-dl

RUN pip uninstall -y youtube_dl pip && rm -rf /var/cache/apk/*

CMD ["https://areena.yle.fi/1-50393277"]

⋊> ~/o/dockerhy on master ⨯ docker build ex3.2                                                                                                                                                          10:28:33
Sending build context to Docker daemon  2.048kB
Step 1/3 : FROM taskinen/yle-dl
 ---> b97796e41c16
Step 2/3 : RUN pip uninstall -y youtube_dl pip && rm -rf /var/cache/apk/*
 ---> Running in f73ca278378a
DEPRECATION: Python 2.7 will reach the end of its life on January 1st, 2020. Please upgrade your Python as Python 2.7 won't be maintained after that date. A future version of pip will drop support for Python 2.7. More details about Python 2 support in pip, can be found at https://pip.pypa.io/en/latest/development/release-process/#python-2-support
Uninstalling pip-19.2.1:
  Successfully uninstalled pip-19.2.1
Uninstalling youtube-dl-2019.7.30:
  Successfully uninstalled youtube-dl-2019.7.30
Removing intermediate container f73ca278378a
 ---> 97a0d6eae0bc
Step 3/3 : CMD ["https://areena.yle.fi/1-50393277"]
 ---> Running in a035216383be
Removing intermediate container a035216383be
 ---> e6888c9bd097
Successfully built e6888c9bd097

⋊> ~/o/dockerhy on master ⨯ docker run -it -v /Users/amattila/opiskelu/dockerhy:/out e6888c9bd097                                                                                                       10:28:54
yle-dl 20190614: Download media files from Yle Areena and Elävä Arkisto
Copyright (C) 2009-2019 Antti Ajanki <antti.ajanki@iki.fi>, license: GPLv3

Output file: Strömsö klipit: Joulukuusenpallot kirjan sivuista-2019-12-18T11:59.mkv
frame= 5892 fps=212 q=-1.0 Lsize=  117791kB time=00:03:55.70 bitrate=4093.8kbits/s speed=8.48x
Stream saved to Strömsö klipit: Joulukuusenpallot kirjan sivuista-2019-12-18T11:59.mkv
⋊> ~/o/dockerhy on master ⨯ cat ex3.2/Dockerfile                                                                                                                                                        10:29:29
FROM taskinen/yle-dl

RUN pip uninstall -y youtube_dl pip && rm -rf /var/cache/apk/*

CMD ["https://areena.yle.fi/1-50393277"]

⋊> ~/o/dockerhy on master ⨯ ls *.mkv                                                                                                                                                                    10:30:18
Strömsö klipit: Joulukuusenpallot kirjan sivuista-2019-12-18T11:59.mkv
```

## 3.3.

```
⋊> ~/o/dockerhy on master ⨯ docker build -f ex3.3/Dockerfile-front -t front3.3 ex3.1/                                                                                                                   10:52:38
...
⋊> ~/o/dockerhy on master ⨯ docker build -f ex3.3/Dockerfile-back -t back3.3 ex3.1/
...

⋊> ~/o/dockerhy on master ⨯ cat ex3.3/Dockerfile-front                                                                                                                                                  11:01:18
FROM ubuntu:16.04

WORKDIR /appsi
COPY frontend-example-docker-master frontend-example-docker

RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs && \
apt-get purge -y --auto-remove curl && \
rm -rf /var/lib/apt/lists/* && \
useradd -m app && chown -R app /appsi

USER app

CMD cd frontend-example-docker && npm install && npm start

⋊> ~/o/dockerhy on master ⨯ cat ex3.3/Dockerfile-back                                                                                                                                                   11:01:26
FROM ubuntu:16.04

WORKDIR /appsi
COPY backend-example-docker-master backend-example-docker

RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs && \
apt-get purge -y --auto-remove curl && \
rm -rf /var/lib/apt/lists/* && \
useradd -m app && chown -R app /appsi

USER app

ENV FRONT_URL=http://localhost:5000
CMD cd backend-example-docker && npm install && npm start
```
