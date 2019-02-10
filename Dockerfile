# FASE 1

FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm i

RUN npm uninstall ajv

RUN npm install ajv@6.8.1

COPY . .

RUN npm run build


# FASE 2 NGINX Server
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html



