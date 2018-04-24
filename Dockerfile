FROM garland/butterfly

RUN apk add --update curl && rm -rf /var/cache/apk/*

WORKDIR /opt
ADD . /opt/app
WORKDIR /opt/app

RUN python setup.py build \
 && python setup.py install

ADD docker/run.sh /opt/run.sh

EXPOSE 57575

CMD ["butterfly.server.py", "--unsecure", "--host=0.0.0.0"]
ENTRYPOINT ["docker/run.sh"]
