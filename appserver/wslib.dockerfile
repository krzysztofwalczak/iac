FROM websphere-liberty:kernel
ARG NAME
MAINTAINER krzysztof.walczak1@unilodz.eu
USER root
RUN apt-get update \ 
&& apt-get install -y iputils-ping \
&& apt-get install -y curl \
&& apt-get install -y net-tools \ 
&& apt-get install -y vim \
&& apt-get install -y git
EXPOSE 9080
ADD ./server.xml //opt/ibm/wlp/usr/servers/defaultServer/server.xml
ADD ./Sample1.war //opt/ibm/wlp/usr/servers/defaultServer/dropins
COPY ./id_rsa /home/default/.ssh/id_rsa
COPY ./known_hosts /home/default/.ssh/known_hosts
COPY ./git.sh /home/default/scripts/git.sh
RUN chmod +x /home/default/scripts/git.sh 
USER 1001
RUN /opt/ibm/wlp/bin/installUtility install defaultServer \
&& /opt/ibm/wlp/bin/server start defaultServer \
&& sed -i "s/<Transport Hostname=".*" Port/<Transport Hostname=$NAME Port/g" /opt/ibm/wlp/output/defaultServer/logs/state/plugin-cfg.xml \
&& /home/default/scripts/git.sh  \
&& rm -f /home/default/.ssh/id_rsa
