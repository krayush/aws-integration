# `builder` is the tag here
# You can actually use any name here
FROM node:alpine as builder

# Setting up working directory inside the container
WORKDIR '/app'

# Copy all except written in .dockerignore
COPY . .

RUN yarn install

RUN yarn build

FROM nginx 

COPY --from=builder /app/build /usr/share/nginx/html
