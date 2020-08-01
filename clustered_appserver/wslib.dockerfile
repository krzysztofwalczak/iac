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
COPY ./git_clone.sh /home/default/scripts/git_clone.sh
RUN chown 1001:0 /home/default/.ssh/id_rsa \
&& chown 1001:0 /home/default/.ssh/known_hosts \
&& chown 1001:0 /home/default/scripts/git.sh \
&& chown 1001:0 /home/default/scripts/git_clone.sh \
&& chown 1001:0 /home/default/.ssh \
&& chmod 400 /home/default/.ssh/id_rsa \
&& chmod 750 /home/default/scripts/git.sh \
&& chmod 750 /home/default/scripts/git_clone.sh \
&& chmod 750 /home/default/.ssh
USER 1001
RUN /opt/ibm/wlp/bin/installUtility install defaultServer \
&& /opt/ibm/wlp/bin/server start defaultServer \
&& sed -i "s/<Transport Hostname=".*" Port/<Transport Hostname=\x22${NAME}\x22 Port/g" /opt/ibm/wlp/output/defaultServer/logs/state/plugin-cfg.xml \
&& cp /opt/ibm/wlp/output/defaultServer/logs/state/plugin-cfg.xml /opt/ibm/wlp/output/defaultServer/logs/state/plugin1-cfg.xml \
&& /home/default/scripts/git_clone.sh  \
&& /opt/ibm/wlp/bin/pluginUtility merge --sourcePath=/opt/ibm/wlp/output/defaultServer/logs/state/plugincfg/plugin-cfg.xml,/opt/ibm/wlp/output/defaultServer/logs/state/plugin1-cfg.xml --targetPath=/opt/ibm/wlp/output/defaultServer/logs/state/mergedPlugin-cfg.xml \
&& /home/default/scripts/git.sh \
&& rm -f /home/default/.ssh/id_rsa
