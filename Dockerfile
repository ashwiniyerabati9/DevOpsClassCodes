From tomcat:latest
ADD addressbook.war /usr/local/tomcat/webapps/ROOT.war
RUN ln -s /usr/local/tomcat/webapps.dist/manager webapps/manager
RUN ln -s /usr/local/tomcat/webapps.dist/host-manager webapps/host-manager
RUN ln -s /usr/local/tomcat/webapps.dist/ROOT webapps/ROOT
EXPOSE 8090
CMD ["catalina.sh", "run"]
