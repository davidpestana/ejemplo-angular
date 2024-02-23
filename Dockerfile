# stage 1 BUILD PARA CONSEGUIR EL DIST
FROM node as faseBuild
RUN npm install -g --silent @angular/cli
COPY ./aplicacion/myapp/. /app/.
WORKDIR /app
RUN ng build

# stage 2 DESPLEGAR UN SERVIDOR WEB PARA SERVIR EL DIST
FROM nginx
# servir un contenido HTML,CSS,JS
COPY --from=faseBuild /app/dist/myapp/browser /usr/share/nginx/html
