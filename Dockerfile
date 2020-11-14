# BUILD STEP
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# in /app/build is going to be the stuff we care about for the next step

# RUN STEP
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

