FROM rabbitmq:3-management

ENV RABBITMQ_PID_FILE /var/lib/rabbitmq/mnesia/rabbitmq.pid

COPY ./rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

ADD custom-docker-entrypoint.sh /usr/local/bin
RUN chmod 0755 /usr/local/bin/*.sh

ENTRYPOINT ["custom-docker-entrypoint.sh"]
CMD ["rabbitmq-server"]
