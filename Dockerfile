FROM python:2.7

EXPOSE 8888

VOLUME ["/srv/thumbor/storage"]

RUN apt-get update
RUN apt-get install --no-install-recommends -y \
  libgraphicsmagick++1-dev=1.3.20-3+deb8u1 \
  libboost-python-dev=1.55.0.2
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY thumbor.conf.tpl /etc/thumbor.conf.tpl
COPY start /start

ENTRYPOINT ["/start"]
