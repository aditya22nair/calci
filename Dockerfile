# syntax=docker/dockerfile:1

FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm install
# CMD ["node", "src/index.js"]
CMD [ "npm", "run", "serve" ]
EXPOSE 8080