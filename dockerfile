FROM centos


RUN yum install httpd -y

WORKDIR /var/www/html

COPY startbootstrap-agency-gh-pages  .




CMD apachectl -DFOREGROUND
