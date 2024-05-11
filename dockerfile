# stage 1
FROM node:18.16.0 as node
WORKDIR /app
COPY . .
RUN echo $NODE_OPTIONS
RUN npm install --force
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/jenkins-portal /usr/share/nginx/html
