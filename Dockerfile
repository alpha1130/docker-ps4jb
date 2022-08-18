FROM nginx:1.23-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk update \
        && apk add git \
        && git clone https://github.com/GamerHack/ps4jb900v2.git \
        && cp ps4jb900v2/* /usr/share/nginx/html

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
