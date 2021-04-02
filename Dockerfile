From tomcat:latest
ADD /tmp/gitrepo/addressbook.war /usr/local/tomcat/webapps/
RUN ln -s /usr/local/tomcat/webapps.dist/manager webapps/manager
RUN ln -s /usr/local/tomcat/webapps.dist/host-manager webapps/host-manager
RUN ln -s /usr/local/tomcat/webapps.dist/ROOT webapps/ROOT
CMD ["catalina.sh", "run"]
