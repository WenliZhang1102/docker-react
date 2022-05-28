FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

# just copy the things we care so only build folder
FROM nginx
# copy from another interface
# copy the relevant folder   
# [/usr...]that is indicated in the official website of nginx image
COPY --from=builder /app/build /usr/share/ngx/html


