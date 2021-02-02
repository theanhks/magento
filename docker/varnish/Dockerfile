FROM centos:centos7
MAINTAINER Nguyen Xuan Nam xuannam0205@gmail.com

RUN yum update -y && \
  yum install -y epel-release && \
  yum install -y varnish && \
  yum install -y libmhash-devel && \
  yum clean all

ADD start.sh /start.sh
RUN chmod 755 /start.sh
#RUN echo  $'[base]     \n\
#[Unit] \n\
#Description=Varnish Cache, a high-performance HTTP accelerator   \n\
#After=network-online.target nss-lookup.target   \n\
#  \n\
#[Service]   \n\
#Type=forking   \n\
#KillMode=process  \n\
#  \n\
## Maximum number of open files (for ulimit -n)   \n\
#LimitNOFILE=131072   \n\
#  \n\
## Locked shared memory - should suffice to lock the shared memory log   \n\
## (varnishd -l argument)   \n\
## Default log size is 80MB vsl + 1M vsm + header -> 82MB   \n\
## unit is bytes   \n\
#LimitMEMLOCK=85983232   \n\
#  \n\
## Enable this to avoid "fork failed" on reload.   \n\
#TasksMax=infinity   \n\
#  \n\
## Maximum size of the corefile.   \n\
#LimitCORE=infinity   \n\
#\n\
#ExecStart=/usr/sbin/varnishd \  \n\
#          -a :80 \  \n\
#          -T localhost:6082 \  \n\
#          -a localhost:8443,PROXY \    \n\
#          -p feature=+http2 \   \n\
#          -f /etc/varnish/default.vcl \   \n\
#          -s malloc,256m \   \n\
#          -p http_resp_hdr_len=65536 \   \n\
#          -p http_resp_size=98304 \   \n\
#          -p http_req_hdr_len=64k  \   \n\
#          -p workspace_backend=256k \   \n\
#          -p workspace_client=256k  \    \n\
#          -p thread_pools=4  \    \n\
#          -p thread_pool_max=1500  \    \n\
#          -p connect_timeout=300  \    \n\
#          -p http_max_hdr=256   \n\
#          -S /etc/varnish/secret \ \n\
#                       -s malloc,2G" \n\
#  \n\
#ExecReload=/usr/sbin/varnishreload   \n\
#  \n\
#[Install]   \n\
#WantedBy=multi-user.target   \n'\
#> /usr/lib/systemd/system/varnish.service

ENV VCL_CONFIG      /etc/varnish/default.vcl
ENV VARNISH_STORAGE malloc,2048m
ENV CACHE_SIZE      64m
ENV VARNISH_MANAGEMENT_LISTEN 127.0.0.1:6082
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600

CMD /start.sh
EXPOSE 80