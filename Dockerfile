FROM python:3-alpine
RUN python3 -m ensurepip && \
    pip3 install robotframework && \
    rm -rf /var/cache/apk/*

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

CMD ["run.sh"]
