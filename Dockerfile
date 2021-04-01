From tomcat:latest
ADD addressbook.war /usr/local/tomcat/webapps/addressbook.war
RUN ln -s /usr/local/tomcat/webapps.dist/manager webapps/manager
RUN ln -s /usr/local/tomcat/webapps.dist/host-manager webapps/host-manager
RUN ln -s /usr/local/tomcat/webapps.dist/ROOT webapps/ROOT
CMD ["catalina.sh", "run"]
