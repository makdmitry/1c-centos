FROM centos:centos7
#MAINTAINER "grahovsky" <grahovsky@gmail.com>

# Perform updates

RUN yum -y update; yum clean all

# Install EPEL
RUN yum -y install epel-release; yum clean all

# Install Microsoft's Core Fonts
RUN yum -y install curl cabextract xorg-x11-font-utils fontconfig; yum clean all
RUN rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# Install ImageMagick
RUN yum -y install ImageMagick; yum clean all

ADD rpm/*.rpm /tmp/
RUN rpm -Uvh /tmp/*.rpm

RUN mkdir -p /opt/1C/v8.3/x86_64/conf/
COPY logcfg.xml /opt/1C/v8.3/x86_64/conf/
RUN chown -R usr1cv8:grp1cv8 /opt/1C

RUN mkdir -p /var/log/1c/dumps/
RUN chown -R usr1cv8:grp1cv8 /var/log/1c/
RUN chmod 755 /var/log/1c

COPY logcfg.xml /opt/1C/v8.3/x86_64/conf/
COPY srv1cv83 /etc/sysconfig/


#RUN useradd onec
#RUN export PATH=/opt/1C/v8.3/x86_64:$PATH
ENV PATH="/opt/1C/v8.3/x86_64:${PATH}"

#RUN chown usr1cv8 /opt/1C
#RUN chown usr1cv8 /etc/init.d
#RUN chmod -R 777 /opt/1C
#RUN chmod -R 777 /etc/init.d

RUN echo 'root' | passwd root --stdin

#USER usr1cv8
#CMD ["/etc/init.d/srv1cv83 start"]

#COPY docker-entrypoint.sh /

#RUN chmod 777 /docker-entrypoint.sh

VOLUME /home/usr1cv8
VOLUME /var/log/1C

#ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 1545 1540 1541 1560-1591

#CMD [ "/bin/sh", "/opt/1C/v8.3/x86_64/ragent"]

#ENTRYPOINT ["/bin/bash"]
#ENTRYPOINT /opt/1C/v8.3/x86_64/ragent -daemon -port 2540 -regport 2541 -range 2560:2591
#ENTRYPOINT ["/opt/1C/v8.3/x86_64/ragent /daemon /port 2540 /regport 2541 /range 2560:2591"]


RUN chmod -R 777 /opt/1C

USER usr1cv8

#CMD /opt/1C/v8.3/x86_64/ragent
ENTRYPOINT ["/opt/1C/v8.3/x86_64/ragent"]
