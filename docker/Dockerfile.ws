FROM oven/bun:1

WORKDIR /user/src/app

COPY ./packages ./packages.json
COPY ./bun.lock ./bun.lock

COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json

COPY ./apps/ws-server ./apps/ws-server

RUN bun install 

RUN bun db:generate

EXPOSE 8081

CMD [ "bun", "run", "start:websocket" ]