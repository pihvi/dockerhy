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

## 2.8
```fish
⋊> ~/o/dockerhy on master ⨯ cat ex2.8/docker-compose.yml                                                                                                                                                16:37:36
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
  kinkku:
    depends_on:
      - frontti
      - backki
    image: nginx
    restart: always
    ports:
      - 80:80
    environment:
      - NGINX_HOST=localhost
      - NGINX_PORT=80
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
```

## 2.9
```fish
⋊> ~/o/dockerhy on master ⨯ cat ex2.9/docker-compose.yml                                                                                                                                                17:15:03
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
    volumes:
      - ./database:/var/lib/postgresql/data
```

## 2.10

- Removed ENV API_URL from front's Dockerfile and brought that config to compose file pointing to http://localhost:80/api

docker-compose.yml:
```fish
version: '3.5'

services:
  frontti:
    ports:
      - 5000:5000
    build: ../ex1.10
    environment:
      - API_URL=http://localhost:80/api
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
  kinkku:
    depends_on:
      - frontti
      - backki
    image: nginx
    restart: always
    ports:
      - 80:80
    environment:
      - NGINX_HOST=localhost
      - NGINX_PORT=80
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
```

front Dockerfile:
```fish
FROM ubuntu:16.04

WORKDIR /appsi
COPY frontend-example-docker frontend-example-docker
RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs
RUN node -v && npm -v

RUN cd frontend-example-docker && npm install

CMD cd frontend-example-docker && npm start
```

back Dockerfile:
```fish
FROM ubuntu:16.04

WORKDIR /appsi
COPY backend-example-docker backend-example-docker
RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs
RUN node -v && npm -v

ENV FRONT_URL=http://localhost:5000
CMD cd backend-example-docker && npm install && npm start
```
