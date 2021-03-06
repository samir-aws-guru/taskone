FROM node:10 AS build
 
WORKDIR /usr/src/app

COPY frontendapp/. ./
RUN npm install
RUN npm build

FROM node:10 AS runtime
WORKDIR /usr/src/app

COPY --from=build /usr/src/app ./

EXPOSE 80
 
CMD ["npm", "start"]