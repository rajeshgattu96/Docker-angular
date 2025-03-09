FROM node:12 AS builder

RUN npm install -g @angular/cli@9.0.6

WORKDIR /my-project

COPY . .

RUN npm install && ng build --prod

FROM nginx:1.21

EXPOSE 80

COPY --from=builder /my-project/dist/my-angular-project /usr/share/nginx/html