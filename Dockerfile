FROM nginx:alpine

# 정적 파일 복사
COPY public /usr/share/nginx/html

# nginx 설정을 Dockerfile 안에 직접 작성
RUN printf 'server {\n\
    listen 80;\n\
    server_name _;\n\
\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
\n\
    location / {\n\
        try_files $uri $uri.html $uri/ =404;\n\
    }\n\
\n\
    error_page 404 /404.html;\n\
}\n' > /etc/nginx/conf.d/default.conf

EXPOSE 80
