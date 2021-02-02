ARG ELK_VERSION
FROM docker.elastic.co/elasticsearch/elasticsearch:${ELK_VERSION}
#FROM elasticsearch:7.6.2
MAINTAINER Nguyen Xuan Nam xuannam0205@gmail.com
#RUN  echo "vm.max_map_count=262144" |  tee -a /etc/sysctl.conf

#RUN grep vm.max_map_count /etc/sysctl.conf
RUN elasticsearch-plugin install analysis-icu analysis-phonetic
#RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu
#RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-phonetic

EXPOSE 9200 9300
