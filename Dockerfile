From tomcat
ADD addressbook.war /usr/local/tomcat/webapps
EXPOSE 8090
CMD ["catalina.sh", "run"]
