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

## 2.4
```fish
⋊> ~/o/dockerhy on master ⨯ cat ex2.4/start_scaled.sh                                                                                                                                                   14:30:23
docker-compose -f scaling-exercise/docker-compose.yml up --scale compute=2
```

## 2.5
```fish
⋊> ~/D/o/dockerhy on master ⨯ cat ex2.5/docker-compose.yml                                     14:56:54
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
    environment:
      - REDIS=redis
  redis:
    image: redis
    ports:
      - 6379:6379
```

## 2.6
```fish
⋊> ~/D/o/dockerhy on master ⨯ cat ex2.6/docker-compose.yml                                     16:01:23
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
    environment:
      - REDIS=redis
      - DB_USERNAME=postgres
      - DB_PASSWORD=huomentapaivaa
      - DB_NAME=postgres
      - DB_HOST=possulainen
    depends_on:
      - possulainen
  redis:
    image: redis
    ports:
      - 6379:6379
  possulainen:
    image: postgres
    restart: always
    environment:
      POSTGRES_PASSWORD: huomentapaivaa
```
