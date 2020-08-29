# `builder` is the tag here
# You can actually use any name here
FROM node:alpine

# Setting up working directory inside the container
WORKDIR '/app'

# Copy all except written in .dockerignore
COPY . .

RUN yarn install

RUN yarn build

FROM nginx 
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html
