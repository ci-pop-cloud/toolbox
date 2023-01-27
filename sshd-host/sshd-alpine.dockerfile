FROM python:alpine3.17
LABEL org.opencontainers.image.source https://github.com/pop-cloud/toolbox

RUN apk add --update --no-cache openssh 
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN adduser -h /home/artisan -s /bin/sh -D artisan
RUN echo -n 'artisan:SmartPassw0rd' | chpasswd
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
COPY entrypoint.sh /
