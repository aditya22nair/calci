# syntax=docker/dockerfile:1

FROM node:18
WORKDIR /app
COPY . .
RUN ls -l 
RUN npm install -g npm@10.3.0
RUN npm install
# CMD ["node", "src/index.js"]
CMD [ "npm", "run", "serve" ]
EXPOSE 8080