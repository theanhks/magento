FROM centos:7.8.2003
MAINTAINER Nguyen Xuan Nam xuannam0205@gmail.com
#Update Software Repository
RUN yum -y install epel-release
RUN yum -y update
RUN yum install wget -y
RUN wget http://nginx.org/packages/mainline/centos/7/x86_64/RPMS/nginx-1.19.2-1.el7.ngx.x86_64.rpm
RUN yum localinstall nginx-1.19.2-1.el7.ngx.x86_64.rpm -y
#RUN yum -y install nginx
RUN yum install perl-core zlib-devel -y
RUN yum group install 'Development Tools' -y
RUN cd /home
RUN wget https://ftp.openssl.org/source/old/1.1.1/openssl-1.1.1.tar.gz
RUN tar xvf openssl-1.1.1.tar.gz
RUN cd openssl-1.1.1/ && ./config --prefix=/usr --openssldir=/etc/ssl --libdir=lib no-shared zlib-dynamic &&  make && make test && make install
RUN export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64
RUN echo "export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64" >> ~/.bashrc
RUN openssl version
RUN openssl req -new -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=magento.local" -addext "subjectAltName=DNS:magento.local" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
EXPOSE 80 443

#nginx -g "daemon off" khởi động nginx
CMD ["nginx", "-g", "daemon off;"]