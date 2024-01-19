# syntax=docker/dockerfile:1

FROM node:18
WORKDIR /app
COPY . .
RUN ls -l 
RUN npm install -g npm
RUN npm install ionic --loglevel verbose
# CMD ["node", "src/index.js"]
CMD [ "npm", "run", "serve" ]
EXPOSE 8080