FROM savonet/liquidsoap:v2.0.0

USER root
RUN apt-get install -y --no-install-recommends --no-install-suggests xmp inotify-tools
RUN addgroup app && useradd -m -g app app
USER app

ADD . /home/app
WORKDIR /home/app
VOLUME ["/music"]

ENTRYPOINT [ "/home/app/entrypoint.sh" ]
