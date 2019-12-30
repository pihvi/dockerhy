# Part 1
[here](Part1.md)

# Part 2
[here](Part2.md)

# Part 3

## 3.1

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
⋊> ~/D/o/dockerhy on master ↑```
