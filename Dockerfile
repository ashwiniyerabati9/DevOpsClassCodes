From tomcat:8
RUN cp -avT $CATALINA_HOME/webapps.dist/manager $CATALINA_HOME/webapps/manager
ADD addressbook.war /usr/local/tomcat/webapps
EXPOSE 8090
CMD ["catalina.sh", "run"]
