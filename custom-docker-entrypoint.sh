#!/bin/sh

# NOTE:
# Without the initial sleep, you will probably hit this issue:
# https://github.com/docker-library/rabbitmq/issues/114
# https://github.com/docker-library/rabbitmq/issues/318
(sleep 10 && \
    rabbitmqctl wait --timeout 60 "$RABBITMQ_PID_FILE" && \
    rabbitmq-plugins enable rabbitmq_management rabbitmq_top rabbitmq_event_exchange) &

exec /usr/local/bin/docker-entrypoint.sh "$@"
