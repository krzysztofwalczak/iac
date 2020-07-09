FROM ibmcom/ibm-http-server:latest
EXPOSE 80/tcp
EXPOSE 443/tcp
COPY /opt/workspace/html/static.html /opt/IBM/HTTPServer/htdocs