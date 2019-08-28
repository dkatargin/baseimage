FROM ubuntu:bionic

RUN apt update && apt install syslog-ng cron dumb-init runit -y

COPY ./scripts /scripts
COPY ./services/ /services/

RUN mkdir -p /etc/service/cron/
RUN mv /services/cron/cron.runit /etc/service/cron/run && chmod +x /etc/service/cron/run

RUN mkdir -p /etc/service/syslog-ng/
RUN mv /services/syslog-ng/syslog-ng.runit /etc/service/syslog-ng/run && chmod +x /etc/service/syslog-ng/run


COPY bin/ /sbin/
RUN chmod +x /sbin/my_init

CMD ["/sbin/my_init"]
