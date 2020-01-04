FROM node as build-stage
WORKDIR /appsi
COPY frontend-example-docker-master frontend-example-docker
RUN useradd -m app && chown -R app /appsi && cd frontend-example-docker && npm install && npm run build


FROM pierrezemb/gostatic

COPY --from=build-stage /appsi/frontend-example-docker/dist/ /srv/http/

CMD goStatic
