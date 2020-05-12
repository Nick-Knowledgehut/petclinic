from node:10-alpine as build

run apk add git bash jq vim unzip zip curl && \
    npm install -g @angular/cli@8.0.1 && \
    git clone https://github.com/BryanDollery/spring-petclinic-angular.git
    
run cd /spring-petclinic-angular && \
    npm install

copy environment.prod.ts /spring-petclinic-angular/src/environments/

run cd /spring-petclinic-angular && \
    ng build --prod --base-href=/petclinic/ --deploy-url=/petclinic/

from nginx:1.18-alpine

copy --from=build /spring-petclinic-angular/dist /usr/share/nginx/html/petclinic/dist/
copy nginx.conf /etc/nginx/

run apk add vim git bash unzip zip jq

expose 8400
