FROM alpine:3.17.3

# prepare minute job dir for crond
RUN mkdir /etc/periodic/minute
RUN echo "* * * * * run-parts /etc/periodic/minute" >> /etc/crontabs/root

# add deps
RUN apk add git logrotate openssl

# add local files
COPY ./entrypoint.sh /entrypoint.sh
COPY ./jobs/updateworldmods.sh /etc/periodic/minute/updateworldmods
COPY ./jobs/collectstatic.sh /etc/periodic/15min/collectstatic
COPY ./jobs/logrotate.sh /etc/periodic/minute/logrotate

CMD ["/entrypoint.sh"]
