FROM node:alpine as builder
WORKDIR '/usr/ng-frontend'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build -- --prod

FROM nginx
COPY --from=builder /usr/ng-frontend/dist/frontend /usr/share/nginx/html
