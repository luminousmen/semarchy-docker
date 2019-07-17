FROM tomcat:latest

WORKDIR temp/

ARG SEMARCHY_VERSION="5.0"
ARG FILENAME="semarchy-xdm-preconfigured-5.0.4.ga-20190708-1257.zip"

RUN bash /usr/local/tomcat/bin/shutdown.sh

ENV CATALINA_HOME /usr/local/tomcat/temp/mdm-server

RUN wget https://www.semarchy.com/downloads/products/${SEMARCHY_VERSION}/${FILENAME}
RUN unzip ${FILENAME}
RUN rm ${FILENAME}

CMD ["bash", "/usr/local/tomcat/temp/mdm-server/bin/catalina.sh", "run"]