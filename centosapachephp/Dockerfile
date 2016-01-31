# This is a comment
FROM centos:latest
MAINTAINER Edward Quick <edwardquick@hotmail.com>
RUN yum -y update && yum install -y httpd php && yum clean all
EXPOSE 80
EXPOSE 443
ADD run-apache.sh /run-apache.sh
RUN chmod -v +x /run-apache.sh
CMD ["/run-apache.sh"]
