FROM ibmcom/ibm-http-server:latest
EXPOSE 80/tcp
EXPOSE 443/tcp
COPY static.html /opt/IBM/HTTPServer/htdocs

