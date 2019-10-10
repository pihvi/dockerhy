# Part 2

## 2.1
```fish
⋊> ~/o/dockerhy on master ⨯ cat ex2.1/docker-compose.yml                                                                                                                                                14:37:11
version: '3.5'

services:
  youtube-dl-ubuntu:
    image: devopsdockeruh/first_volume_exercise
    build: .
    volumes:
      - ./logs.txt:/usr/app/logs.txt
    container_name: ex2.1
```
