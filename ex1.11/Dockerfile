FROM ubuntu:16.04

WORKDIR /appsi
COPY backend-example-docker backend-example-docker
RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs
RUN node -v && npm -v

CMD cd backend-example-docker && npm install && npm start
