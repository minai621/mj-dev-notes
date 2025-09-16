FROM node:22-alpine

RUN npm install -g serve
COPY public /app
EXPOSE 80

CMD ["serve", "-s", "/app", "-l", "80"]