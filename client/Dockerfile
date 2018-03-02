FROM node:carbon
WORKDIR /usr/app/
COPY . .
RUN npm install
RUN npm install -g yarn
RUN yarn build
RUN yarn global add serve
ENTRYPOINT ["serve","-s", "build"]
EXPOSE 5000