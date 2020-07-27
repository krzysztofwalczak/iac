# escape=`

FROM ibmcom/ibm-http-server:latest
EXPOSE 80/tcp
MAINTAINER krzysztof.walczak1@unilodz.eu
USER root
RUN apt-get update  `
&& apt-get install -y vim `
&& apt-get install -y iputils-ping  `
&& apt-get install -y curl `
&& apt-get install -y git `
&& mkdir /root/.ssh `
&& chmod 700 /root/.ssh 
COPY ./id_rsa /root/.ssh
COPY ./known_hosts /root/.ssh
COPY ./git_clone.sh /home/default/scripts/
RUN ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts `
&& /home/default/scripts/git_clone.sh `
&& cd /opt/IBM/HTTPServer/conf/ `
#&& git init  /opt/IBM/HTTPServer/conf/ `
#&& git config --global user.name "git" `
#&& git config --global user.email "krzysztof.walczak1@unilodz.eu" `
#&& git clone ssh://git@github.com/krzysztofwalczak/plugincfg.git `
&& printf "\nLoadModule was_ap24_module \"/opt/IBM/WebSphere/Plugins/bin/64bits/mod_was_ap24_http.so" >> /opt/IBM/HTTPServer/conf/httpd.conf `
&& printf "\nWebSpherePluginConfig "/opt/IBM/HTTPServer/conf/plugincfg/plugin-cfg.xml"" >> /opt/IBM/HTTPServer/conf/httpd.conf `
&& /opt/IBM/HTTPServer/bin/apachectl restart 
