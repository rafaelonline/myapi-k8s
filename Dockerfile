FROM node:17.9.1-bullseye-slim
WORKDIR /app
COPY ./app/package*.json .
RUN npm install
COPY ./app .
EXPOSE 3000
CMD ["node", "index.js"]