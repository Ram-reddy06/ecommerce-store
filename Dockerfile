FROM 26-alpine3.23 AS build
ADD . /APP
WORKDIR /APP
RUN npm install && \
npm run build

FROM alpine3.24 AS runtime
COPY --from=build /APP/build /usr/share/nginx/html
EXPOSE 80