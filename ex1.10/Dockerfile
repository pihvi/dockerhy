FROM ubuntu:16.04

WORKDIR /appsi
COPY frontend-example-docker frontend-example-docker
RUN apt update && apt install -y curl && curl -sL https://deb.nodesource.com/setup_10.x | bash && apt install -y nodejs
RUN node -v && npm -v
RUN cd frontend-example-docker && npm install

CMD cd frontend-example-docker && npm start
