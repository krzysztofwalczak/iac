FROM websphere-liberty:kernel
USER 1001
ADD ./server.xml //opt/ibm/wlp/usr/servers/defaultServer/server.xml
ADD ./Sample1.war //opt/ibm/wlp/usr/servers/defaultServer/dropins
RUN /opt/ibm/wlp/bin/installUtility install defaultServer \
&& rm -f /opt/ibm/wlp/usr/servers/defaultServer/server.env \
&& /opt/ibm/wlp/bin/server start defaultServer
EXPOSE 9443

