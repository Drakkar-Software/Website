FROM nginx:alpine

WORKDIR /web
ADD ./docker/nginx/nginx.conf nginx.conf.template
ADD ./docker/nginx/run_nginx.sh run_nginx.sh

CMD ["./run_nginx.sh"]
