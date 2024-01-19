# syntax=docker/dockerfile:1

FROM node:18
WORKDIR /app
COPY . .
RUN npm install -g npm
RUN npm install
# CMD ["node", "src/index.js"]
CMD [ "npm", "run", "serve" ]
EXPOSE 8080