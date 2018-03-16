FROM openjdk:8-jre
LABEL maintainer=milobahg
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -; \
  echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | \
  tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list; apt-get update -y; \
  apt-get -y install elasticsearch; apt-get install strace -y
ADD elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
ADD elasticsearch  /usr/share/elasticsearch/bin/elasticsearch
CMD /usr/share/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch/elasticsearch.pid --default.path.home=/usr/share/elasticsearch --default.path.logs=/var/log/elasticsearch --default.path.data=/var/lib/elasticsearch --default.path.conf=/etc/elasticsearch
