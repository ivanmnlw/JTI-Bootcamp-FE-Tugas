# Build Process
FROM node:latest as build

WORKDIR /usr/local/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Serve app with nginx server
FROM nginx:latest 
COPY --from=build /usr/local/app/dist/angular-to-do-list /usr/share/nginx/html

