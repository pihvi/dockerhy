# Part 1
[here](Part1.md)

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

## 2.2
```fish
⋊> ~/dockerhy on master ◦ cat ex2.2/docker-compose.yml                                                                                                                                                  21:36:34
version: '3.5'

services:
  portit:
    image: devopsdockeruh/ports_exercise
    ports:
      - 8000:80
```

## 2.3
```fish
⋊> ~/dockerhy on master ◦ cat ex2.3/docker-compose.yml                                                                                                                                                  21:36:41
version: '3.5'

services:
  frontti:
    ports:
      - 5000:5000
    build: ../ex1.10
  backki:
    ports:
      - 8000:8000
    build: ../ex1.11
```
